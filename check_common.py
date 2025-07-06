import os
import re
import subprocess
import time
import shutil
import click

def run_eqy(base_dir, test, freq, check_task, filter):
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
    else:
        if filter:
            allowed = [0,1,2,3,4,5,6,7,8,9,10,12,14,19,20,21,22,23,24,25,26,
                    27,28,30,31,32,33,34,35,36,37,38,65,66,111]
            filtered_subdirs = []
            for d in subdirs:
                match = pattern.match(d)
                if match and int(match.group(1)) in allowed:
                    filtered_subdirs.append(d)
            subdirs = filtered_subdirs

    for dir in subdirs:
        if os.path.exists(os.path.join(base_dir,dir,"Makefile")):
            log_file = os.path.join(logs_dir, f"{dir}.log")

            click.secho("Running ", nl=False)
            click.secho(f"{dir}",  bold=True, nl=False)
            start_time = time.time()
            board = "olimex"
            if not os.path.exists(os.path.join(base_dir,dir,"olimex.ccf")):
                board = "evb"
            try:
                result = subprocess.run(
                    ["make", "-C", dir, f"BOARD={board}", "clean", "json"],
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT
                )
            except subprocess.CalledProcessError:
                pass
            duration = time.time() - start_time
            click.secho(f" (synth {duration:.2f} seconds) ", nl=False)

            start_time = time.time()
            try:
                result = subprocess.run(
                    ["make", "-C", dir, f"BOARD={board}", check_task],
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT
                )
                duration = time.time() - start_time
                click.secho(f" {duration:.2f} seconds ", nl=False)
                with open(log_file, "w") as out_f:
                    out_f.write(result.stdout.decode())
                click.secho("Success ", fg="green")
                report = set()
                if freq:
                    for line in result.stdout.decode().splitlines():
                        if line.startswith("Info: Max frequency"):
                            report.add(line)
                    for line in report:
                        click.secho(line)
            except subprocess.CalledProcessError as e:
                duration = time.time() - start_time
                click.secho(f" {duration:.2f} seconds ", nl=False)
                error_line = next((line for line in e.stdout.decode().splitlines() if line.startswith("ERROR:")), None)
                if error_line:
                    click.secho(error_line, fg="red")
                else:
                    click.secho("Failure ", fg="red")
                with open(log_file, "w") as out_f:
                    out_f.write(e.stdout.decode() if e.stdout else "")
