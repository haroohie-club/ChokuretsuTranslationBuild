Param(
  [string]$nitroPacker = "NitroPacker",
  [string]$haruhiCli = "HaruhiChokuretsuCLI"
)

Push-Location asm
mkdir rom
& "./build.exe" asm
Copy-Item -Path "rom/arm9.bin" -Destination "../rom/arm9.bin"
Remove-Item -Path "rom/arm9.bin"
Remove-Item -Path rom -Recurse -Force
Pop-Location

Copy-Item -Path "rominfo.xml" -Destination "rom/HaruhiChokuretsu.xml"

$haruhiCliArgs = @("-p", "-i", "overlay.xml", "-f", "overlays", "-o", "rom/overlay", "--rom-info", "rom/HaruhiChokuretsu.xml")
& "$haruhiCli"  $haruhiCliArgs

$nitroPackerArgs = @("-p", "rom/HaruhiChokuretsu.xml", "HaruhiChokuretsu.nds")
& "$nitroPacker" $nitroPackerArgs