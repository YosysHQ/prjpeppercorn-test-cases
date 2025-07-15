#!/usr/bin/env python3
import click
import re
import subprocess
import yaml
from pathlib import Path

@click.command()
@click.option('paths', '--path', multiple=True,
              type=click.Path(exists=True, file_okay=False, dir_okay=True, path_type=Path))
@click.option('--config', is_flag=True)
@click.option('--debug', is_flag=True)
def run(paths: list[Path], config: bool, debug: bool):
    if len(paths) == 0:
        paths = []
        # get all subdirs if none are given
        for path in Path.cwd().glob("*"):
            if path.is_dir() and path.name not in ["lib", "verification"]:
                paths.append(path)

    synth_args_map: dict[tuple[str], dict[str, list[str]]] = {}
    for path in paths:
        if debug: click.echo(f"Running in path '{path}'")
        
        # get supported boards from constraint files
        boards = [ccf.stem for ccf in path.glob("*.ccf")]
        board_args_map: dict[str, dict[str]] = {}
        for board in boards:
            board_args_map[board] = board_args = {
                "pnr_constraints": f"{board}.ccf",
                "pnr_format": "ccf",
            }
            
            # dry-run Make to get tool options
            result = subprocess.run(
                ["make", "-C", path, f"BOARD={board}", "nextpnr", f"P_R=p_r", "pr", "--dry-run"],
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT,
            )
            yosys = None
            nextpnr = None
            p_r = None
            for line in result.stdout.decode().splitlines():
                if line.startswith("yosys"):
                    yosys = line.split(' ', 1)[1]
                elif line.startswith("nextpnr"):
                    nextpnr = line.split(' ', 1)[1]
                elif line.startswith("p_r"):
                    p_r = line.split(' ', 1)[1]

            # extracting options from Yosys script
            _, yoscrypt, _ = yosys.split("'")
            d = re.match(
                r"(?P<defs>.*) read_verilog -defer -sv (?P<inputs>.*?); (?P<cmds>.*?) synth_gatemate (?P<synth_args1>.*?) -top (?P<top>\S+) (?P<synth_args2>[^;\n]*)?",
                yoscrypt
            ).groupdict()
            board_args["source"] = d["inputs"].split()
            board_args["top_module"] = d["top"]

            verilog_defines: list[str] = []
            for define in d["defs"].split():
                if define == "verilog_defines":
                    continue
                if define.startswith("-D"):
                    define = define[2:]
                verilog_defines.append(define)
            board_args["verilog_defines"] = verilog_defines

            synth_args: set[str] = set()
            for arg_m in re.finditer(r"(-\S+)( [^-]\S+)?", f'{d["synth_args1"]} {d["synth_args2"]}'):
                synth_arg = arg_m.group()
                if synth_arg.startswith("-vlog"):
                    continue
                synth_args.add(synth_arg)
            board_args["synth_args"] = synth_args

            board_args["yosys_cmds"] = d["cmds"]

            # nextpnr and p_r currently unused
            # click.echo(f"    nextpnr options: {nextpnr}")
            # click.echo(f"    p_r options: {p_r}")

        # collect common configurations
        first_board: str | None = None
        first_args: dict[str] = {}
        num_boards = len(boards)
        if num_boards:
            first_board, first_args = board_args_map.popitem()

        # if there aren't multiple boards, it's all common
        if num_boards > 1:
            common_args = {}
            for arg, val in first_args.items():
                same_vals = True
                for board in boards:
                    if board == first_board: continue
                    other_val = board_args_map[board][arg]
                    if val == other_val: continue
                    same_vals = False
                if same_vals:
                    common_args[arg] = val
                    for board_args in board_args_map.values():
                        board_args.pop(arg)
            for arg in common_args.keys():
                first_args.pop(arg)
            board_args_map[first_board] = first_args
        else:
            common_args = first_args
            
        # check for include files
        include_files = []
        for ftype in [".hex", ".mem", ".init"]:
            include_files += list(include.name for include in path.glob(f"*{ftype}"))
        if include_files:
            common_args["includes"] = include_files

        # echo debug
        if debug:
            if common_args:
                click.echo("  common")
                for k, v in common_args.items():
                    if v: click.echo(f"    {k}: {v}")
            for board, board_args in board_args_map.items():
                click.echo(f"  {board}")
                for k, v in board_args.items():
                    if v: click.echo(f"    {k}: {v}")

        # format for mddbench
        bench_yaml = {
            "all": common_args,
        }
        bench_yaml.update(board_args_map)

        # update default config options
        common_args.update({
            "output_files": ["$(SOURCE)"],
            "output_format": "Verilog",
        })

        # dump to benchmarks.yaml
        for board, board_args in bench_yaml.items():
            # drop unused config options
            verilog_defines = board_args.pop("verilog_defines", None)
            if verilog_defines:
                board_args["verilog_defines"] = verilog_defines

            yosys_cmds = board_args.pop("yosys_cmds", None)
            if yosys_cmds:
                board_args["yosys_cmds"] = yosys_cmds

            # map synth args to path/board
            try:
                synth_args = board_args.pop("synth_args")
            except KeyError:
                continue
            if verilog_defines:
                synth_args.add("-hasdefines")
            if yosys_cmds:
                synth_args.add("-hascmds")
            try:
                synth_args_paths_map = synth_args_map[tuple(synth_args)]
            except KeyError:
                synth_args_map[tuple(synth_args)] = synth_args_paths_map = {}
            try:
                boards_list = synth_args_paths_map[path.name]
            except KeyError:
                synth_args_paths_map[path.name] = boards_list = []
            boards_list.append(board)

        with open(path / "benchmarks.yaml", "w") as f:
            yaml.dump(bench_yaml, stream=f)

    # (optionally) dump to config.yaml
    if config:
        config_yaml = {}
        
        for args, synth_args_paths_map in synth_args_map.items():
            # group benchmarks by yosys args
            arg_list = [arg.lstrip("-") for arg in args]
            arg_list.sort()
            config_name = "peppercorn_" + "_".join(arg_list)

            # all the benchmarks here use readsv to load the .vh
            arg_list.append("readsv")

            # so long as the cmd is just "setattr -unset ram_style a:ram_style=distributed"
            # then yosys-gatemate does that by default
            try: arg_list.remove("hascmds")
            except ValueError: pass
            arg_list.sort()
            yosys_flow = "yosys-shell-gatemate+" + "+".join(arg_list)

            # format yaml
            this_config = config_yaml[config_name] = {
                "benchmark_dirs": ["benchmarks/peppercorn"],
                "benchmarks": {},
                "flows": [
                    [yosys_flow, "ccpr-toolchain"],
                    [yosys_flow, "nextpnr-shell-gatemate"],
                ],
            }
            for group, targets in synth_args_paths_map.items():
                this_config["benchmarks"][group] = ", ".join(targets)

        with open("config.yaml", "w") as f:
            yaml.dump(config_yaml, stream=f)
    

if __name__ == "__main__":
    run()
