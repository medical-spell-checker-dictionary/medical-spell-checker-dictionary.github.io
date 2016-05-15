
$sourcePath = "..\US-English-Medical-Dictionary.dic"

$content = Get-Content $sourcePath 

$content | select -First 44502 | Out-File ($sourcePath.Replace(".dic",".min.dic"))
