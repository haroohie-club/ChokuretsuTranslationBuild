Param(
  [string]$assetsFolder = $env:CHOKURETSU_ASSETS_ROOT,
  [string]$langCode = "en"
)

Write-Host "Copying movies..."
Copy-Item -Recurse -Path "$assetsFolder/movie/$langCode/*.mods" -Destination "rom/data/movie"