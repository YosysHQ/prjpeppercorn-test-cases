#!/usr/bin/env python3

import os
import re
import subprocess
import time
import shutil
import click

@click.command()
@click.option('--base_dir', default=".", help='Base directory.')
@click.option('--test', default=-1, type=int, help='Run specific test.')
def run(base_dir, test):
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
            log_file = os.path.join(logs_dir, f"{dir}.log")

            click.secho("Running ", nl=False)
            click.secho(f"{dir}",  bold=True, nl=False)
            try:
                result = subprocess.run(
                    ["make", "-C", dir, "BOARD=olimex", "clean", "synth"],
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT
                )
            except subprocess.CalledProcessError:
                pass

            start_time = time.time()
            try:
                result = subprocess.run(
                    ["make", "-C", dir, "BOARD=olimex", "pr"],
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
                error_line = next((line for line in e.stdout.decode().splitlines() if line.startswith("ERROR:")), None)
                if error_line:
                    click.secho(error_line, fg="red")
                else:
                    click.secho("Failure ", fg="red")
                with open(log_file, "w") as out_f:
                    out_f.write(e.stdout.decode() if e.stdout else "")

if __name__ == "__main__":
    run()
