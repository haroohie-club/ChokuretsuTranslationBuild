Param(
  [string]$nitroPacker = $env:NITRO_PACKER_PATH
)

$nitroPackerArgs = @("-u", "original.nds", "rom", "HaruhiChokuretsu")
& $nitroPacker $nitroPackerArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "NitroPacker failed with exit code $LASTEXITCODE."
  exit 1
}

New-Item -Path original -ItemType Directory
Push-Location original
New-Item -Path archives -ItemType Directory
Pop-Location

Copy-Item -Path "rom/data/dat.bin" -Destination "original/archives/dat.bin"
Copy-Item -Path "rom/data/evt.bin" -Destination "original/archives/evt.bin"
Copy-Item -Path "rom/data/grp.bin" -Destination "original/archives/grp.bin"
Copy-Item -Path "rom/data/scn.bin" -Destination "original/archives/scn.bin"
Copy-Item -Path "rom/arm9.bin" -Destination "src/arm9.bin"
Copy-Item -Recurse -Path "rom/overlay/" -Destination "original/"