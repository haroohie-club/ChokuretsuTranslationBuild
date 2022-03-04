Param(
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH,
  [string]$stringsFolder = "$env:CHOKURETSU_STRINGS_ROOT",
  [string]$archiveFolder = $env:CHOKURETSU_ASSETS_ROOT,
  [string]$resxLangCode = "en"
)

$datResxArgs = @("import-resx", "-i", "original\archives\dat.bin", "-o", "rom\data\dat.bin", "-r", "$stringsFolder\strings_dat", "-l", $resxLangCode, "-f", "$archiveFolder\misc\charset.json")
$datArgs = @("replace", "-i", "rom\data\dat.bin", "-o", "rom\data\dat.bin", "-r", "$archiveFolder\data")
$evtResxArgs = @("import-resx", "-i", "original\archives\evt.bin", "-o", "rom\data\evt.bin", "-r", "$stringsFolder\strings", "-l", $resxLangCode, "-f", "$archiveFolder\misc\charset.json")
$grpArgs = @("replace", "-i", "original\archives\grp.bin", "-o", "rom\data\grp.bin", "-r", "$archiveFolder\graphics\shared")
$grpLocArgs = @("replace", "-i", "rom\data\grp.bin", "-o", "rom\data\grp.bin", "-r", "$archiveFolder\graphics\$resxLangCode")
$scnArgs = @("replace", "-i", "original\archives\scn.bin", "-o", "rom\data\scn.bin", "-r", "$archiveFolder\scn")

& $haruhiCli $datResxArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on string replacement in dat.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $datArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on file replacement in dat.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $evtResxArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on string replacement in evt.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $grpArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on global image replacement in grp.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $grpLocArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on localized image replacement in grp.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $scnArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on file replacement in scn.bin with exit code $LASTEXITCODE."
  exit 1
}