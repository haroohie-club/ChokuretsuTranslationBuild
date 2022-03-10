Param(
  [string]$originalVideo,
  [string]$subs,
  [string]$outputName
)

ffmpeg -i $originalVideo -vf "subtitles=$($subs):fontsdir=C\\:/Windows/Fonts" -an -r 30 -qscale:v 1 "$outputName.mpg"