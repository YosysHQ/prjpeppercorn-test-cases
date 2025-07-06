#!/usr/bin/env python3
import click
import check_common

@click.command()
@click.option('--base_dir', default=".", help='Base directory.')
@click.option('--test', default=-1, type=int, help='Run specific test.')
@click.option('--freq', is_flag=True, help='Display max frequency.')
def run(base_dir, test, freq):
    return check_common.run_eqy(base_dir, test, freq, "check_pnr", True)

if __name__ == "__main__":
    run()
