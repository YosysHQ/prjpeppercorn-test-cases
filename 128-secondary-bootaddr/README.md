This example shows how to boot a secondary bitstream from another flash address.

Flash the primary and secondary bitstreams with:
```
make BOARD=evb flash
```

Then, start the FPGA in `CFG_MD=0x0` (active SPI). After ~3 seconds, an internal counter will trigger a reboot signal and restart at `BOOTADDR=0x100000`. The `BOOTADDR` can be set arbitrarily, but should be greater than the length of the primary bitstream.
