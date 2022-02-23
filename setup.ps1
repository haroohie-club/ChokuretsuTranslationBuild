Param(
  [string]$nitroPacker = "NitroPacker"
)

$nitroPackerArgs = @("-u", "original.nds", "rom", "HaruhiChokuretsu")
& $nitroPacker $nitroPackerArgs
Push-Location archives
mkdir original
Pop-Location
Copy-Item -Path "rom/data/dat.bin" -Destination "archives/original/dat.bin"
Copy-Item -Path "rom/data/evt.bin" -Destination "archives/original/evt.bin"
Copy-Item -Path "rom/data/grp.bin" -Destination "archives/original/grp.bin"
Copy-Item -Path "rom/data/scn.bin" -Destination "archives/original/scn.bin"
Copy-Item -Path "rom/arm9.bin" -Destination "asm/arm9.bin"
Copy-Item -Recurse -Path "rom/overlay/" -Destination "overlays/"