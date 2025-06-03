# Project Peppercorn Test Cases

Test cases to validate NextPnR implementation for GateMate FPGAs and compare results with 
Cologne Chip Place and Route tool

Before running build with `make` command make sure you have prjpeppercorn and nextpnr in PATH.
To additionally use GateMate place and route tool set next environment variable:

```
export CC_TOOL=~/cc-toolchain-linux
```

When using [GateMate FPGA Evaluation Board](https://www.colognechip.com/programmable-logic/gatemate-evaluation-board/) board use:

```
export BOARD=evb
```

in case of using [Olimex GateMateA1-EVB](https://www.olimex.com/Products/FPGA/GateMate/GateMateA1-EVB/open-source-hardware) board use:

```
export BOARD=olimex
```

## PMOD Location

### For testing on EVB

Put [PmodUSBUART](https://digilent.com/shop/pmod-usbuart-usb-to-uart-interface/) or compatible in **PMODB** top

For [PmodVGA](https://digilent.com/shop/pmod-vga-video-graphics-array/) it is required to set JP14 to 2.5V power

In all configurations when there is one PMOD used (and that is not for serial) it needs to be located in **PMODA**

Others PMODs used for testing:

[PmodMicroSD](https://digilent.com/shop/pmod-microsd-microsd-card-slot/)

[PmodFull-sizedSD](https://digilent.com/shop/pmod-sd-full-sized-sd-card-slot/)


# License

Code in Project Peppercorn Test Cases repository in licensed under the very permissive
[ISC Licence](https://opensource.org/licenses/ISC) or in case of third party code can be under compatible license, and that is noted in file itself. A copy of license can be found in the [`COPYING`](COPYING) file.

All new contributions must also be released under this license.
