#!/usr/bin/env python3

import os
import re
import subprocess
import time
import shutil
import click

@click.command()
@click.option('--base_dir', default=".", help='Base directory.')
def run(base_dir):
    logs_dir = os.path.join(base_dir, "logs")
    if os.path.exists(logs_dir):
        shutil.rmtree(logs_dir)
    os.makedirs(logs_dir, exist_ok=True)

    pattern = re.compile(r'^(\d+)-')
    subdirs = sorted([
        d for d in os.listdir(base_dir)
        if os.path.isdir(os.path.join(base_dir, d)) and pattern.match(d)
    ])

    for dir in subdirs:
        if os.path.exists(os.path.join(base_dir,dir,"Makefile")):

            click.secho("Cleaning ", nl=False)
            click.secho(f"{dir}",  bold=True)
            try:
                result = subprocess.run(
                    ["make", "-C", dir, "clean"],
                    check=True,
                    stdout=subprocess.PIPE,
                    stderr=subprocess.STDOUT
                )
            except subprocess.CalledProcessError:
                pass


if __name__ == "__main__":
    run()
