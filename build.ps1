Param(
  [string]$nitroPacker = $env:NITRO_PACKER_PATH,
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH,
  [string]$stringsFolder = "$env:CHOKURETSU_STRINGS_ROOT",
  [string]$fontReplacementMap = "$env:CHOKURETSU_ASSETS_ROOT/misc/charset.json",
  [string]$langCode = "en",
  [switch]$noVoiceSubs
)

if ($noVoiceSubs) {
  Move-Item -Path src/source/subtitles_asm.s -Destination ../
  Move-Item -Path src/source/subtitles.c -Destination ../
}

$haruhiCliArgs = @("localize-sources", "-s", "src/", "-r", "$stringsFolder/asm_strings.$langCode.resx", "-f", "$fontReplacementMap", "-t", "src-backup")
& "$haruhiCli" $haruhiCliArgs

$haruhiCliArgs = @("patch-arm9", "-i", "./src", "-o", "./rom", "-a", "02005ECC")
& "$haruhiCli" $haruhiCliArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "ASM Build failed."
  exit 1
}

if ($noVoiceSubs) {
  Move-Item -Path ../subtitles_asm.s -Destination src/source/
  Move-Item -Path ../subtitles.c -Destination src/source/
}

Copy-Item -Path "rominfo.xml" -Destination "rom/HaruhiChokuretsu.xml"

$haruhiCliArgs = @("patch-overlays", "-i", "original/overlay", "-o", "rom/overlay", "-s", "src/overlays", "-r", "rom/HaruhiChokuretsu.xml")
& "$haruhiCli" $haruhiCliArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on patching overlays with exit code $LASTEXITCODE."
  exit 1
}

$localizedFileMap = Get-Content "src-backup/map.json" | ConvertFrom-Json | ForEach-Object {
  Copy-Item -Path "src-backup/$($_.Name)" -Destination "$($_.OriginalLocation)" 
}
Remove-Item -Recurse -Force "src-backup"

Write-Host "Packing ROM..."
$nitroPackerArgs = @("-p", "rom/HaruhiChokuretsu.xml", "HaruhiChokuretsu.nds")
& "$nitroPacker" $nitroPackerArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "NitroPacker failed with exit code $LASTEXITCODE."
  exit 1
}

Write-Host "Getting MD5 hash of completed ROM..."
Get-FileHash -Path "HaruhiChokuretsu.nds" -Algorithm MD5