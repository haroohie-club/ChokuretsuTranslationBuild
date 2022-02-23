Param(
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH,
  [string]$stringsFolder = "$env:CHOKURETSU_STRINGS_ROOT",
  [string]$archiveFolder = $env:CHOKURETSU_ASSETS_ROOT,
  [string]$resxLangCode = "en"
)

$datResxArgs = @("--import-resx", "-i", "original\archives\dat.bin", "-o", "rom\data\dat.bin", "-f", "$stringsFolder\strings_dat", "-l", $resxLangCode, "--font-map", "$archiveFolder\misc\charset.json")
$datArgs = @("-r", "-i", "rom\data\dat.bin", "-o", "rom\data\dat.bin", "-f", "$archiveFolder\data")
$evtResxArgs = @("--import-resx", "-i", "original\archives\evt.bin", "-o", "rom\data\evt.bin", "-f", "$stringsFolder\strings", "-l", $resxLangCode, "--font-map", "$archiveFolder\misc\charset.json")
$grpArgs = @("-r", "-i", "original\archives\grp.bin", "-o", "rom\data\grp.bin", "-f", "$archiveFolder\graphics\shared")
$grpLocArgs = @("-r", "-i", "rom\data\grp.bin", "-o", "rom\data\grp.bin", "-f", "$archiveFolder\graphics\$resxLangCode")
$scnArgs = @("-r", "-i", "original\archives\scn.bin", "-o", "rom\data\scn.bin", "-f", "$archiveFolder\scn")

& $haruhiCli $datResxArgs
& $haruhiCli $datArgs
& $haruhiCli $evtResxArgs
& $haruhiCli $grpArgs
& $haruhiCli $grpLocArgs
& $haruhiCli $scnArgs