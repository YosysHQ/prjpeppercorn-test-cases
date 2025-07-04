#!/usr/bin/env python3

import concurrent.futures
import os
import re
import subprocess
import shutil
import click

def build(board, logs_dir, dir, curr_seed, bar):
    log_file = os.path.join(logs_dir, f"{dir}_{curr_seed}.log")
    try:
        result = subprocess.run(
            ["make", "-C", dir, f"BOARD={board}", f"SEED={curr_seed}", "force-nextpnr"],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT
        )
        with open(log_file, "w") as out_f:
            out_f.write(result.stdout.decode())
        return True
    except subprocess.CalledProcessError as e:
        with open(log_file, "w") as out_f:
            out_f.write(e.stdout.decode() if e.stdout else "")
    return False

@click.command()
@click.option('--seed', default=100, help='Max seed numbers.')
@click.option('--base_dir', default=".", help='Base directory.')
@click.option('--test', default=-1, type=int, help='Run specific test.')
@click.option('--board', default="olimex", help='Selected board for stress test.')
def stress(seed, base_dir, test, board):
    logs_dir = os.path.join(base_dir, "logs")
    if os.path.exists(logs_dir):
        shutil.rmtree(logs_dir)
    os.makedirs(logs_dir, exist_ok=True)

    pattern = re.compile(r'^(\d+)-')
    subdirs = sorted([
        d for d in os.listdir(base_dir)
        if os.path.isdir(os.path.join(base_dir, d)) and pattern.match(d)
    ])

    if test!=-1:
        filtered_subdirs = []
        for d in subdirs:
            match = pattern.match(d)
            if match and int(match.group(1)) == test:
                filtered_subdirs.append(d)
        subdirs = filtered_subdirs
        if len(subdirs)==0:
            raise click.ClickException("Test not found")

    for dir in subdirs:
        if os.path.exists(os.path.join(base_dir,dir,"Makefile")):
            click.secho("Running ", nl=False)
            click.secho(f"{dir}", bold=True)
            if not os.path.exists(os.path.join(base_dir,dir,f"{board}.ccf")):
                click.secho(f"{board}.ccf not found", fg="red")
                click.secho("")
                continue
            try:
                result = subprocess.run(
                    ["make", "-C", dir, f"BOARD={board}", "clean", "json"],
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT
                )
            except subprocess.CalledProcessError:
                pass

            items = list(range(0,seed))
            count = 0
            ok_seeds = []
            failed_seeds = []
            with click.progressbar(items, label='Processing items', length=len(items)) as bar:
                with concurrent.futures.ThreadPoolExecutor(max_workers=os.process_cpu_count()) as executor:
                    tasks = {executor.submit(build, board, logs_dir, dir, curr_seed, bar): curr_seed for curr_seed in items}
                    for future in concurrent.futures.as_completed(tasks):
                        bar.update(1)
                        if future.result():
                            count += 1
                            ok_seeds.append(tasks[future])
                        else:
                            failed_seeds.append(tasks[future])

            if (count == len(items)):
                click.secho("Success", fg="green", nl=False)
            else:
                click.secho("Failure", fg="red", nl=False)
            click.secho(f" {count}/{len(items)}")
            click.secho("")
            if len(failed_seeds) > 0:
                click.secho("Failed seeds:")
                click.secho(failed_seeds)
                click.secho("OK seeds:")
                click.secho(ok_seeds)

if __name__ == "__main__":
    stress()
