Param(
  [string]$nitroPacker = "NitroPacker"
)

$nitroPackerArgs = @("-u", "original.nds", "rom", "HaruhiChokuretsu")
& $nitroPacker $nitroPackerArgs

mkdir original
Push-Location original
mkdir archives
Pop-Location

Copy-Item -Path "rom/data/dat.bin" -Destination "original/archives/dat.bin"
Copy-Item -Path "rom/data/evt.bin" -Destination "original/archives/evt.bin"
Copy-Item -Path "rom/data/grp.bin" -Destination "original/archives/grp.bin"
Copy-Item -Path "rom/data/scn.bin" -Destination "original/archives/scn.bin"
Copy-Item -Path "rom/arm9.bin" -Destination "src/arm9.bin"
Copy-Item -Recurse -Path "rom/overlay/" -Destination "original/"