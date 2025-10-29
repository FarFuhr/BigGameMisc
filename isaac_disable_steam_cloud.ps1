$documents = [environment]::getfolderpath("mydocuments")
$optionsFile = Join-Path -Path $documents -ChildPath 'My Games\Binding of Isaac Repentance+\options.ini'
if (-Not ([System.IO.File]::Exists($optionsFile))) {
	write "Could not find file: $optionsFile"
	pause
	exit -1
} else {
	(gc $optionsFile) -replace 'SteamCloud=1', 'SteamCloud=0' | Out-File -encoding ASCII $optionsFile
	write "Steam Cloud disabled"
	pause
	exit 0
}
