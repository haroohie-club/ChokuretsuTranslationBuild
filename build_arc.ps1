Param(
  [string]$haruhiCli = "HaruhiChokuretsuCLI",
  [string]$evtResxFolder,
  [string]$datResxFolder,
  [string]$resxLangCode = "en",
  [string]$fontMap = "font_replacement.json"
)

$datResxArgs = @("--import-resx", "-i", "archives\original\dat.bin", "-o", "rom\data\dat.bin", "-f", $datResxFolder, "-l", $resxLangCode, "--font-map", $fontMap)
$datArgs = @("-r", "-i", "rom\data\dat.bin", "-o", "rom\data\dat.bin", "-f", "archives\data")
$evtResxArgs = @("--import-resx", "-i", "archives\original\evt.bin", "-o", "rom\data\evt.bin", "-f", $evtResxFolder, "-l", $resxLangCode, "--font-map", $fontMap)
$grpArgs = @("-r", "-i", "archives\original\grp.bin", "-o", "rom\data\grp.bin", "-f", "archives\graphics")
$grpLocArgs = @("-r", "-i", "rom\data\grp.bin", "-o", "rom\data\grp.bin", "-f", "archives\graphics_loc\$resxLangCode")
$scnArgs = @("-r", "-i", "archives\original\scn.bin", "-o", "rom\data\scn.bin", "-f", "archives\scn")

& $haruhiCli $datResxArgs
& $haruhiCli $datArgs
& $haruhiCli $evtResxArgs
& $haruhiCli $grpArgs
& $haruhiCli $grpLocArgs
& $haruhiCli $scnArgs