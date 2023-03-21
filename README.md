# Suzumiya Haruhi no Chokuretsu Translation Build

This is the repository containing the build scripts for making translation patches for Suzumiya Haruhi no Chokuretsu. In addition to the build scripts, it also contains all of the assembly hack source files.

There are two ways to run this repo locally: you can run the [scripts manually](#baremetal) or you can run them in a [Docker container](#docker-container).
The Docker container method is provided to make configuration of the prerequisites easier.

# Baremetal

## Prerequisites
* devkitARM, distributed by [devkitPro](https://devkitpro.org/)
* [CMake](https://cmake.org/)
* [HaruhiChokuretsuCLI](https://github.com/haroohie-club/ChokuretsuTranslationUtility) from the Chokuretsu Translation Utility
  - This depends on the [.NET 6.0 runtime](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
* [NitroPacker](https://github.com/haroohie-club/NitroPacker/)
* [PowerShell](https://github.com/PowerShell/PowerShell) must be installed on non-Windows systems

## Setup
Clone the [strings repo](https://github.com/haroohie-club/ChokuretsuTranslationStrings) and [assets repo](https://github.com/haroohie-club/ChokuretsuTranslationAssets). Both of these are private at the moment, so if you want to contribute, you should get in touch with us.

Copy your ROM inside the root of this repo and name it `original.nds`, then run `setup.ps1`. This will copy the necessary files in the correct folders.

Finally, you must set up environment variables for devkitARM. Specifically, you will need to set:

* `DEVKITPRO` &ndash; the path to your devkitPro directory
* `DEVKITARM` &ndash; the path to your devkitARM installation

## Build
The remaining scripts should be run in this order:

* `build_arc.ps1`: builds the archive files and puts them in the `rom/data` folder
* `copy-movies.ps1`: copies the subtitled movie files from the Assets repo into the `rom` folder so they'll be included in the final build
* `build.ps1`: compiles the ASM hacks and builds a ROM named `HaruhiChokuretsu.nds`

In detail:

### `build_arc.ps1`
`./build_arc.ps1 -haruhiCli "PATH/TO/HaruhiChokuretsuCLI" -stringsFolder "PATH/TO/ChokuretsuTranslationStrings" -assetsFolder "PATH/TO/ChokuretsuTranslationAssets" -devkitArm "PATH/TO/devkitARM" -resxLangCode "<LANGCODE>" -version "<VERSION>"`

* `LANGCODE` is an ISO 639-1 language code indicating the language you want to localize to, e.g. `en`.
* `VERSION` is the semantic version of the patch, e.g. `0.4`.

Additional options:
* `-noGraphics` &ndash; skips over producing `grp.bin` and uses one that's already been generated. Useful when trying to iterate quickly and not needing graphics replacement.

### `copy-movies.ps1`
`./copy-movies.ps1 -assetsFolder "PATH/TO/ChokuretsuTranslationAssets" -langCode "<LANGCODE>"`

* `LANGCODE` is an ISO 639-1 language code indicating the language you want to localize to, e.g. `en`.

### `build.ps1`
`./build.ps1 -nitroPacker "PATH/TO/NitroPacker" -haruhiCli "PATH/TO/HaruhiChokuretsuCLI" -stringsFolder "PATH/TO/ChokuretsuTranslationStrings" -fontReplacementMap "PATH/TO/ChokuretsuTranslationAssets/misc/charset.json" -resxLangCode "<LANGCODE>"`

* `LANGCODE` is an ISO 639-1 language code indicating the language you want to localize to, e.g. `en`.

Additional options:
* `-noVoiceSubs` &ndash; Removes the voiced line subtitle ASM hack from the build so no voiced line subs appear in the game

# Docker Container

## Prerequisites
On Linux and Mac, you will need to install the [Docker Engine](https://docs.docker.com/engine/install/). On Windows, you will first need to
install [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install). Once you've installed that, you should open WSL
and install the Docker Engine following the instructions for the distro you installed (e.g., [Ubuntu](https://docs.docker.com/engine/install/ubuntu/)).

## Setup
Clone the [strings repo](https://github.com/haroohie-club/ChokuretsuTranslationStrings) and [assets repo](https://github.com/haroohie-club/ChokuretsuTranslationAssets). Both of these are private at the moment, so if you want to contribute, you should get in touch with us.

Copy your ROM inside the root of this repo and name it `original.nds`.

## Running
To run, open the build repo in your terminal (in WSL on Windows), then run `sudo ./docker/run.sh PATH/TO/BUILD_REPO /PATH/TO/ASSETS_REPO PATH/TO/STRINGS_REPO LANGCODE VERSION`. The capitalized arguments should be replaced with:
* `PATH/TO/BUILD_REPO` &ndash; the path to your copy of ChokuretsuTranslationBuild
* `PATH/TO/ASSETS_REPO` &ndash; the path to your copy of ChokurestuTranslationAssets
* `PATH/TO/STRINGS_REPO` &ndash; the path to your copy of ChokuretsuTranslationStrings
* `LANGCODE` &ndash; an ISO 639-1 language code indicating which language to translate to, e.g. `en`
* `VERSION` &ndash; the version of the patch (displayed on the splash screen)