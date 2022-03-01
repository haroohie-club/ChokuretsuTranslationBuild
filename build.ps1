Param(
  [string]$nitroPacker = $env:NITRO_PACKER_PATH,
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH
)

& "./build.exe" asm

Copy-Item -Path "rominfo.xml" -Destination "rom/HaruhiChokuretsu.xml"

$haruhiCliArgs = @("patch-overlays", "-i", "original/overlay", "-o", "rom/overlay", "-p", "overlay.xml", "-r", "rom/HaruhiChokuretsu.xml")
& "$haruhiCli"  $haruhiCliArgs

$nitroPackerArgs = @("-p", "rom/HaruhiChokuretsu.xml", "HaruhiChokuretsu.nds")
& "$nitroPacker" $nitroPackerArgs