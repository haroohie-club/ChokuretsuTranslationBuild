Param(
  [string]$nitroPacker = $env:NITRO_PACKER_PATH,
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH
)

& "./build.exe" asm
if ($LASTEXITCODE -ne 0) {
  Write-Error "ASM Build failed."
  exit 1
}

Copy-Item -Path "rominfo.xml" -Destination "rom/HaruhiChokuretsu.xml"

$haruhiCliArgs = @("patch-overlays", "-i", "original/overlay", "-o", "rom/overlay", "-p", "overlay.xml", "-r", "rom/HaruhiChokuretsu.xml")
& "$haruhiCli"  $haruhiCliArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on patching overlays with exit code $LASTEXITCODE."
  exit 1
}

Write-Host "Packing ROM..."
$nitroPackerArgs = @("-p", "rom/HaruhiChokuretsu.xml", "HaruhiChokuretsu.nds")
& "$nitroPacker" $nitroPackerArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "NitroPacker failed with exit code $LASTEXITCODE."
  exit 1
}