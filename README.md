# Suzumiya Haruhi no Chokuretsu Translation Build

This is the repository containing the build scripts for making translation patches for Suzumiya Haruhi no Chokuretsu. In addition to the build scripts, it also contains all of the assembly hack source files.

## Setup

Copy your rom inside the root and name it `original.nds`, then run `setup.ps1`. This will copy the necessary files in the correct folders.

You then need to install devKitPro.

## Build

- `build_arc.ps1`: builds the archive files and puts them in the `rom/data` folder
- `build.ps1`: compiles the ASM hacks and builds a ROM named `HaruhiChokuretsu.nds`