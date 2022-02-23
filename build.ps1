Param(
  [string]$nitroPacker = "NitroPacker",
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH
)

& "./build.exe" asm

Copy-Item -Path "rominfo.xml" -Destination "rom/HaruhiChokuretsu.xml"

$haruhiCliArgs = @("-p", "-i", "overlay.xml", "-f", "original/overlay", "-o", "rom/overlay", "--rom-info", "rom/HaruhiChokuretsu.xml")
& "$haruhiCli"  $haruhiCliArgs

$nitroPackerArgs = @("-p", "rom/HaruhiChokuretsu.xml", "HaruhiChokuretsu.nds")
& "$nitroPacker" $nitroPackerArgs