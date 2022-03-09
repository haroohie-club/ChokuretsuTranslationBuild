Param(
  [string]$archiveFolder = $env:CHOKURETSU_ASSETS_ROOT,
  [string]$langCode = "en"
)

Write-Host "Copying movies..."
Copy-Item -Recurse -Path "$archiveFolder\movie\$langCode\*.mods" -Destination "rom\data\movie"