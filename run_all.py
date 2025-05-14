import os
import re
import subprocess
import time
import shutil
import click

def run_make_in_subdirs(base_dir="."):
    logs_dir = os.path.join(base_dir, "logs")
    if os.path.exists(logs_dir):
        shutil.rmtree(logs_dir)
    os.makedirs(logs_dir, exist_ok=True)

    pattern = re.compile(r'^\d+-')
    subdirs = sorted([
        d for d in os.listdir(base_dir)
        if os.path.isdir(os.path.join(base_dir, d)) and pattern.match(d)
    ])
    for dir in subdirs:
        if os.path.exists(os.path.join(base_dir,dir,"Makefile")):
            log_file = os.path.join(logs_dir, f"{dir}.log")

            click.secho("Running ", nl=False)
            click.secho(f"{dir}",  bold=True, nl=False)
            try:
                result = subprocess.run(
                    ["make", "-C", dir, "BOARD=olimex", "clean", "json"],
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT
                )
            except subprocess.CalledProcessError:
                pass

            start_time = time.time()
            try:
                result = subprocess.run(
                    ["make", "-C", dir, "BOARD=olimex", "nextpnr"],
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT
                )
                duration = time.time() - start_time
                click.secho(f" {duration:.2f} seconds ", nl=False)
                with open(log_file, "w") as out_f:
                    out_f.write(result.stdout.decode())
                click.secho("Success ", fg="green")
            except subprocess.CalledProcessError as e:
                duration = time.time() - start_time
                click.secho(f" {duration:.2f} seconds ", nl=False)
                click.secho("Failure ", fg="red")
                with open(log_file, "w") as out_f:
                    out_f.write(e.stdout.decode() if e.stdout else "")

if __name__ == "__main__":
    run_make_in_subdirs(".")
