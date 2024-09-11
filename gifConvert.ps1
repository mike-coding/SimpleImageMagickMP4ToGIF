$CurrentDir = Get-Location


$InputFile = Get-ChildItem -Path $CurrentDir -Filter *.mp4 | Select-Object -First 1
$InputPath = $InputFile.FullName


$BaseName = $InputFile.BaseName
$ProcessedName = $BaseName -replace '^preGIF ', ''

$OutputPath = Join-Path -Path $CurrentDir -ChildPath "..\..\gifs\$ProcessedName.gif"

Write-Output "[Beginning conversion of $BaseName.mp4 to $ProcessedName.gif]"
Write-Output ""
Write-Output "..."
Write-Output ""

magick convert $InputPath -coalesce -resize 800x -layers Optimize $OutputPath

Write-Output "Conversion complete"