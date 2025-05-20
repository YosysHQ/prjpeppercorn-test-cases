import sys

filename = sys.argv[1]

with open(filename, 'rb') as f:
    byte = f.read(1)
    while byte:
        print(f"{int.from_bytes(byte, 'big'):02x}")
        byte = f.read(1)
