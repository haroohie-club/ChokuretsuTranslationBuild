Param(
  [string]$buildPath,
  [string]$assetsPath,
  [string]$stringsPath,
  [string]$langCode,
  [string]$version,
  [switch]$buildOnly
)

if ($buildOnly) {
  docker run -v ${buildPath}:/build -v ${assetsPath}:/assets -v ${stringsPath}:/strings -e LANG=$langCode -e ROM_VERSION=$version ghcr.io/haroohie-club/chokuretsu-devkitarm:main pwsh /build/docker/docker-run.ps1 -buildOnly
} else {
  docker run -v ${buildPath}:/build -v ${assetsPath}:/assets -v ${stringsPath}:/strings -e LANG=$langCode -e ROM_VERSION=$version ghcr.io/haroohie-club/chokuretsu-devkitarm:main pwsh /build/docker/docker-run.ps1
}
