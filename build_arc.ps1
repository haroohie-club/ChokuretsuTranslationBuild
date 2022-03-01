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
& $haruhiCli $datArgs
& $haruhiCli $evtResxArgs
& $haruhiCli $grpArgs
& $haruhiCli $grpLocArgs
& $haruhiCli $scnArgs