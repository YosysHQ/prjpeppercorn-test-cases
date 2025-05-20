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
    pattern = re.compile(r'^(\d+)-')
    subdirs = sorted([
        d for d in os.listdir(base_dir)
        if os.path.isdir(os.path.join(base_dir, d)) and pattern.match(d)
    ])
    boards = [ "evb", "olimex"]

    for dir in subdirs:
        if os.path.exists(os.path.join(base_dir,dir,"Makefile")):
            click.secho("Check ", nl=False)
            click.secho(f"{dir:<25}",  bold=True, nl=False)
            for board in boards:
                if os.path.exists(os.path.join(base_dir,dir,board+".ccf")):
                    click.secho(f" {board}", fg="green", nl=False)
                else:
                    click.secho(f" {board}", fg="red", nl=False)
            click.secho("")

if __name__ == "__main__":
    run()
