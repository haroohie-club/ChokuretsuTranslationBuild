Param(
  [string]$aviToMobiclip,
  [string]$inputVideo,
  [string]$inputAudio,
  [string]$outputMods
)

& $aviToMobiclip -in "$inputVideo" -audio "$inputAudio" -adpcm -out "$outputMods"