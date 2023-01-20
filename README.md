# Suzumiya Haruhi no Chokuretsu Translation Build

This is the repository containing the build scripts for making translation patches for Suzumiya Haruhi no Chokuretsu. In addition to the build scripts, it also contains all of the assembly hack source files.

### Prerequisites
* devkitARM, distributed by [devkitPro](https://devkitpro.org/)
* [CMake](https://cmake.org/)
* [HaruhiChokuretsuCLI](https://github.com/haroohie-club/ChokuretsuTranslationUtility) from the Chokuretsu Translation Utility
* NitroPacker (a tool created by Ermelber; you'll need to contact us in order to get it)

CMake can be installed via [Chocolatey](https://chocolatey.org/) on Windows for an easier experience.

Because NitroPacker is only available on Windows, the ROM can only be built on Windows. This will change in the future when NitroPacker is updated to be cross-plat and open source.

## Setup
Clone the [strings repo](https://github.com/haroohie-club/ChokuretsuTranslationStrings) and [assets repo]([HaruhiChokuretsuCLI](https://github.com/haroohie-club/ChokuretsuTranslationAssets). Both of these are private at the moment, so if you want to contribute, you should get in touch with us.

Copy your ROM inside the root and name it `original.nds`, then run `setup.ps1`. This will copy the necessary files in the correct folders.

Finally, you must set up environment variables for devkitPro. Specifically, you will need to set:

* `DEVKITPRO` &ndash; the path to your devkitPro directory
* `DEVKITARM` &ndash; the path to your devkitARM installation

## Build
The remaining scripts should be run in this order:

* `build_arc.ps1`: builds the archive files and puts them in the `rom/data` folder
* `copy-movies.ps1`: copies the subtitled movie files from the Assets repo into the `rom` folder so they'll be included in the final build
* `build.ps1`: compiles the ASM hacks and builds a ROM named `HaruhiChokuretsu.nds`

In detail:

### `build_arc.ps1`
`.\build_arc.ps1 -haruhiCli "PATH/TO/HaruhiChokuretsuCLI.exe" -stringsFolder "PATH/TO/ChokuretsuTranslationStrings" -assetsFolder "PATH/TO/ChokuretsuTranslationAssets" -devkitArm "PATH/TO/devkitARM" -resxLangCode "<LANGCODE>" -version "<VERSION>"`

* `LANGCODE` is an ISO 639-1 language code indicating the language you want to localize to, e.g. `en`.
* `VERSION` is the semantic version of the patch, e.g. `0.2`.

Additional options:
* `-noGraphics` &ndash; skips over producing `grp.bin` and uses one that's already been generated. Useful when trying to iterate quickly and not needing graphics replacement.

### `copy-movies.ps1`
`.\copy-movies.ps1 -assetsFolder "PATH/TO/ChokuretsuTranslationAssets" -langCode "<LANGCODE>"`

* `LANGCODE` is an ISO 639-1 language code indicating the language you want to localize to, e.g. `en`.

### `build.ps1`
`.\build.ps1 -nitroPacker "PATH/TO/NitroPacker.exe" -haruhiCli "PATH/TO/HaruhiChokuretsuCLI.exe" -stringsFolder "PATH/TO/ChokuretsuTranslationStrings" -fontReplacementMap "PATH/TO/ChokuretsuTranslationAssets/misc/charset.json" -resxLangCode "<LANGCODE>"`

* `LANGCODE` is an ISO 639-1 language code indicating the language you want to localize to, e.g. `en`.

Additional options:
* `-noVoiceSubs` &ndash; Removes the voiced line subtitle ASM hack from the build so no voiced line subs appear in the game