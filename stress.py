#!/usr/bin/env python3

import os
import re
import subprocess
import shutil
import click

@click.command()
@click.option('--seed', default=100, help='Max seed numbers.')
@click.option('--base_dir', default=".", help='Base directory.')
@click.option('--test', default=-1, type=int, help='Run specific test.')
def stress(seed, base_dir, test):
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
            try:
                result = subprocess.run(
                    ["make", "-C", dir, "BOARD=olimex", "clean", "json"],
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT
                )
            except subprocess.CalledProcessError:
                pass

            items = list(range(0,seed))
            count = 0
            with click.progressbar(items, label='Processing items', length=len(items)) as bar:
                for curr_seed in items:
                    log_file = os.path.join(logs_dir, f"{dir}_{curr_seed}.log")
                    try:
                        result = subprocess.run(
                            ["make", "-C", dir, "BOARD=olimex", f"SEED={curr_seed}", "clean-bit", "nextpnr"],
                            check=True,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT
                        )
                        with open(log_file, "w") as out_f:
                            out_f.write(result.stdout.decode())
                        count += 1
                    except subprocess.CalledProcessError as e:
                        with open(log_file, "w") as out_f:
                            out_f.write(e.stdout.decode() if e.stdout else "")
                    bar.update(1)
            if (count == len(items)):
                click.secho("Success", fg="green", nl=False)
            else:
                click.secho("Failure", fg="red", nl=False)
            click.secho(f" {count}/{len(items)}")
            click.secho("")

if __name__ == "__main__":
    stress()
