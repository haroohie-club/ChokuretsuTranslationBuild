Param(
  [switch]$buildOnly
)

git clone https://github.com/haroohie-club/ChokuretsuTranslationUtility.git /utility
git clone https://github.com/haroohie-club/NitroPacker.git /nitropacker

dotnet build /utility/HaruhiChokuretsuCLI/HaruhiChokuretsuCLI.csproj
dotnet build /nitropacker/HaroohieClub.NitroPacker.Cli/HaroohieClub.NitroPacker.Cli.csproj

Set-Location /build

if (!$buildOnly) {
    & ./clean.ps1

    & ./setup.ps1 -nitroPacker /nitropacker/HaroohieClub.NitroPacker.Cli/bin/Debug/net8.0/NitroPacker
    
    & ./build_arc.ps1 -haruhiCli /utility/HaruhiChokuretsuCLI/bin/Debug/net8.0/HaruhiChokuretsuCLI -stringsFolder /strings -assetsFolder /assets -devkitArm /opt/devkitpro/devkitARM/ -resxLangCode $env:LANG -version $env:ROM_VERSION
    
    & ./copy-movies.ps1 -assetsFolder /assets -langCode $env:LANG    
}

$charset = "/assets/misc/charset/shared.json"
if (Test-Path "/assets/misc/charset/$env:LANG.json") {
  $charset = "/assets/misc/charset/$env:LANG.json"
}

& ./build.ps1 -nitroPacker /nitropacker/HaroohieClub.NitroPacker.Cli/bin/Debug/net8.0/NitroPacker -haruhiCli /utility/HaruhiChokuretsuCLI/bin/Debug/net8.0/HaruhiChokuretsuCLI -stringsFolder /strings -fontReplacementMap $charset -langCode $env:LANG

& xdelta3 -f -e -S -s ./original.nds ./HaruhiChokuretsu.nds "./chokuretsu-patch-$env:ROM_VERSION-$env:LANG.xdelta"