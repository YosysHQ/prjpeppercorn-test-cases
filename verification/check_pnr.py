#!/usr/bin/env python3
import os
import sys
import click
# Get the parent directory
parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))

# Add the parent directory to sys.path
sys.path.insert(0, parent_dir)
import check_common

@click.command()
@click.option('--base_dir', default=".", help='Base directory.')
@click.option('--test', default=-1, type=int, help='Run specific test.')
@click.option('--freq', is_flag=True, help='Display max frequency.')
def run(base_dir, test, freq):
    return check_common.run_eqy(base_dir, test, freq, "check_pnr")

if __name__ == "__main__":
    run()
