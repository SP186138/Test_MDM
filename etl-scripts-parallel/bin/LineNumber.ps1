# This script will take a file name as an input, and prepend a 
# line number to each line.  This is displayed in the console, but
# could be redirected to Out-File.
# Usage:
# .\LineNumber.ps1 Myscript.ps1
# .\LinNumber.ps1 Myscript.ps1 | Out-File MyNumberedScript.txt
#
# Written by BigTeddy 14 October 2012
# Version 1.0

if ($args.Count -gt 1) { Write-Host 'Only enter one filename'; exit }
if (Test-Path $args) {
    $text = @(Get-Content $args)
    $newtext = New-Object System.Collections.ArrayList
    for ($i=0;$i -lt $text.count; $i ++) { $newtext += "$($i + 1)| " + $text[$i] }
    $newtext
    }
else { Write-Host "$args does not exist" -ForegroundColor Red }