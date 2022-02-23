# Suzumiya Haruhi no Chokuretsu - English Translation

This is the repository for the English for "Suzumiya Haruhi no Chokuretsu".

## Setup

Copy your rom inside the root and name it ``original.nds``, then run ``setup.ps1``. This will copy the necessary files in the correct folders.

You then need to install devKitPro and have a specific devKitARM version in order to build and inject the ASM Hacks.

Ask Ermelber for more detail.

## Environment Variables

You need to set the following environment variables to use the bat files:

- ``CHOKURETSU_ASSETS_ROOT``: Path of the folder containing the dat resx files.
- ``CHOKURETSU_STRINGS_ROOT``: Path of the folder containing the evt resx files.
- ``CHOKURETSU_CLI_PATH``: Path of the ``HaruhiChokuretsuCLI`` executable (eg. ``D:\tools\HaruhiChokuretsuEditor\HaruhiChokoretsuCLI.exe``).
- ``NITRO_PACKER_PATH``: Path of the ``NitroPacker`` executable (eg. ``D:\tools\NitroPacker\NitroPacker.exe``).

Alternatively, the ps1 files can be used with arguments.

## Build

- ``build_arc.ps1``: builds the Archive files and puts them in the ``rom/data`` folder
- ``build.ps1``: compiles the ASM Hack and builds the ROM named ``HaruhiChokuretsu.nds``