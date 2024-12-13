Param(
  [string]$haruhiCli = $env:CHOKURETSU_CLI_PATH,
  [string]$stringsFolder = "$env:CHOKURETSU_STRINGS_ROOT",
  [string]$assetsFolder = $env:CHOKURETSU_ASSETS_ROOT,
  [string]$devkitArm = $env:DEVKITARM,
  [string]$resxLangCode = "en",
  [string]$version,
  [switch]$dub,
  [switch]$noGraphics
)

$splashScreenArgs = @("version-screen", "-v", "$version", "-s", "$assetsFolder/graphics/$resxLangCode/splash/splash_screen.png", "-f", "$assetsFolder/graphics/$resxLangCode/splash/Nunito-Black.ttf", "-o", "$assetsFolder/graphics/$resxLangCode/8b7_newpal_tidx0_splash_screen.png")
$datResxArgs = @("import-resx", "-i", "original/archives/dat.bin", "-o", "rom/data/dat.bin", "-r", "$stringsFolder/strings_dat", "-l", $resxLangCode, "-f", "$assetsFolder/misc/charset.json")
$datArgs = @("replace", "-i", "rom/data/dat.bin", "-o", "rom/data/dat.bin", "-r", "$assetsFolder/data/shared")
$datLocArgs = @("replace", "-i", "rom/data/dat.bin", "-o", "rom/data/dat.bin", "-r", "$assetsFolder/data/$resxLangCode")
$evtReplArgs = @("replace", "-i", "original/archives/evt.bin", "-o", "rom/data/evt.bin", "-r", "$assetsFolder/events", "-v", "original/voice")
$evtResxArgs = @("import-resx", "-i", "rom/data/evt.bin", "-o", "rom/data/evt.bin", "-r", "$stringsFolder/strings", "-l", $resxLangCode, "-f", "$assetsFolder/misc/charset.json")
$grpArgs = @("replace", "-i", "original/archives/grp.bin", "-o", "rom/data/grp.bin", "-r", "$assetsFolder/graphics/shared")
$grpLocArgs = @("replace", "-i", "rom/data/grp.bin", "-o", "rom/data/grp.bin", "-r", "$assetsFolder/graphics/$resxLangCode")
$scnArgs = @("replace", "-i", "original/archives/scn.bin", "-o", "rom/data/scn.bin", "-r", "$assetsFolder/scn")
$vceArgs = @("replace", "-i", "original/voice/", "-o", "rom/data/vce", "-r", "$assetsFolder/voice/$resxLangCode")

if ($devkitArm) {
  $datArgs += ("-d", "$devkitArm")
  $datLocArgs += ("-d", "$devkitArm")
  $evtReplArgs += ("-d", "$devkitArm")
  $scnArgs += ("-d", "$devkitArm")
}

if (-not $noGraphics) {
  & $haruhiCli $splashScreenArgs
  if ($LASTEXITCODE -ne 0) {
    Write-Error "HaruhiChokuretsuCLI failed on creating splash screen with exit code $LASTEXITCODE."
    exit 1
  }
}
& $haruhiCli $datResxArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on string replacement in dat.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $datArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on global file replacement in dat.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $datLocArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on localized file replacement in dat.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $evtReplArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on file replacement in evt.bin with exit code $LASTEXITCODE."
  exit 1
}
& $haruhiCli $evtResxArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on string replacement in evt.bin with exit code $LASTEXITCODE."
  exit 1
}
if (-not $noGraphics) {
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
}
& $haruhiCli $scnArgs
if ($LASTEXITCODE -ne 0) {
  Write-Error "HaruhiChokuretsuCLI failed on file replacement in scn.bin with exit code $LASTEXITCODE."
  exit 1
}
if ($dub) {
  & $haruhiCli $vceArgs
  if ($LASTEXITCODE -ne 0) {
    Write-Error "HaruhiChokuretsuCLI failed on file replacement in vce/ with exit code $LASTEXITCODE."
    exit 1
  }
}
Copy-Item -Path "$assetsFolder/misc/banner/$resxLangCode.bin" -Destination "rom/banner.bin"
if (-not $noGraphics) {
  Remove-Item -Path "$assetsFolder/graphics/$resxLangCode/8b7_newpal_tidx0_splash_screen.png"
}