<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

# VGA nyan cat

![nyancat preview](preview.png)

## How it works

Outputs nyancat on VGA with music!

Colors and animation are all from the original nyan.cat site, using a 2x2 Bayer
dithering matrix which inverts on alternate frames for better color rendition on
the Tiny VGA Pmod.

Sound is generated from a MIDI file, split into melody and bass parts. Melody
and bass are each square waves mixed with a simple exponential decay envelope,
which is then fed to a low-pass filter and then a sigma-delta DAC.

This was designed to fit into 1 tile, and it *almost* did -- the cells take up
about 93% of 1 tile, but detailed routing doesn't finish. With the deadline
approaching I was forced to grow it to 1x2, so I threw in a little easter egg.

## How to test

Set clock to 25.175MHz or thereabouts, give reset pulse, and enjoy

## External hardware

[TinyVGA Pmod](https://github.com/mole99/tiny-vga) for video on o[7:0].

1-bit sound on io[7], compatible with [Tiny Tapeout Audio
Pmod](https://github.com/MichaelBell/tt-audio-pmod), or any basic ~20kHz RC filter
on io7 to an amplifier will work.
