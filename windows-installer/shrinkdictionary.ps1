
param(
	[Parameter(Mandatory=$true)][string]$from,
	[Parameter(Mandatory=$true)][string]$to
)

$content = Get-Content $from

$content | select -First 44502 | Out-File ($to)
