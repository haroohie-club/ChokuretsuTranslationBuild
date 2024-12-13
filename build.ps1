Param(
  [string]$nitroPacker = $env:NITRO_PACKER_PATH,
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH,
  [string]$stringsFolder = "$env:CHOKURETSU_STRINGS_ROOT",
  [string]$fontReplacementMap = "$env:CHOKURETSU_ASSETS_ROOT/misc/charset.json",
  [string]$langCode = "en",
  [switch]$noVoiceSubs,
  [switch]$useDocker
)

if ($noVoiceSubs) {
  Move-Item -Path src/source/subtitles_asm.s -Destination ../
  Move-Item -Path src/source/subtitles.c -Destination ../
}
try {
  $haruhiCliArgs = @("localize-sources", "-s", "src/", "-r", "$stringsFolder/asm_strings.$langCode.resx", "-f", "$fontReplacementMap", "-t", "src-backup")
  & "$haruhiCli" $haruhiCliArgs

  $nitroPackerArgs = @("patch-arm9", "-i", "./src", "-o", "./rom", "-a", "02005ECC", "--override-suffix", "$langCode")
  if ($useDocker) {
    $nitroPackerArgs += @("-d", "latest")
  }
  & "$nitroPacker" $nitroPackerArgs
  if ($LASTEXITCODE -ne 0) {
    Write-Error "ASM Build failed."
    exit 1
  }

  if ($noVoiceSubs) {
    Move-Item -Path ../subtitles_asm.s -Destination src/source/
    Move-Item -Path ../subtitles.c -Destination src/source/
  }

  $nitroPackerArgs = @("patch-overlays", "-i", "original/overlay", "-o", "rom/overlay", "-s", "src/overlays", "-r", "rom/HaruhiChokuretsu.json", "--override-suffix", "$langCode")
  if ($useDocker) {
    $nitroPackerArgs += @("-d", "latest")
  }
  & "$nitroPacker" $nitroPackerArgs
  if ($LASTEXITCODE -ne 0) {
    Write-Error "NitroPacker failed on patching overlays with exit code $LASTEXITCODE."
    exit 1
  }
}
finally {
  Get-Content "src-backup/map.json" | ConvertFrom-Json | ForEach-Object {
    Copy-Item -Path "src-backup/$($_.Name)" -Destination "$($_.OriginalLocation)" 
  }
  Remove-Item -Recurse -Force "src-backup"
}

Write-Host "Packing ROM..."
$nitroPackerArgs = @("pack", "-p", "rom/HaruhiChokuretsu.json", "-r", "HaruhiChokuretsu.nds")
& "$nitroPacker" $nitroPackerArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "NitroPacker failed with exit code $LASTEXITCODE."
  exit 1
}

Write-Host "Getting MD5 hash of completed ROM..."
Get-FileHash -Path "HaruhiChokuretsu.nds" -Algorithm MD5