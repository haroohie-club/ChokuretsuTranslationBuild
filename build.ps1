Param(
  [string]$nitroPacker = $env:NITRO_PACKER_PATH,
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH,
  [switch]$noVoiceSubs
)

if ($noVoiceSubs) {
  Move-Item -Path src/source/subtitles_asm.s -Destination ../
  Move-Item -Path src/source/subtitles.c -Destination ../
}

& "./build.exe" asm
if ($LASTEXITCODE -ne 0) {
  Write-Error "ASM Build failed."
  exit 1
}

if ($noVoiceSubs) {
  Move-Item -Path ../subtitles_asm.s -Destination src/source/
  Move-Item -Path ../subtitles.c -Destination src/source/
}

Copy-Item -Path "rominfo.xml" -Destination "rom/HaruhiChokuretsu.xml"

$haruhiCliArgs = @("assemble-overlay-code", "-s", "src/overlays", "-l", "original/overlay", "-o", "overlay.xml")
& "$haruhiCli"  $haruhiCliArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on patching overlays with exit code $LASTEXITCODE."
  exit 1
}

$haruhiCliArgs = @("patch-overlays", "-i", "original/overlay", "-o", "rom/overlay", "-p", "overlay.xml", "-r", "rom/HaruhiChokuretsu.xml")
& "$haruhiCli"  $haruhiCliArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on patching overlays with exit code $LASTEXITCODE."
  exit 1
}

Remove-Item "overlay.xml"

Write-Host "Packing ROM..."
$nitroPackerArgs = @("-p", "rom/HaruhiChokuretsu.xml", "HaruhiChokuretsu.nds")
& "$nitroPacker" $nitroPackerArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "NitroPacker failed with exit code $LASTEXITCODE."
  exit 1
}