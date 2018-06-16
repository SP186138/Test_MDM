if ($args.Count -gt 1) { Write-Host 'Only enter one filename'; exit }
if (Test-Path $args) {
    $text = @(Get-Content $args)
    $newtext = New-Object System.Collections.ArrayList
    for ($i=0;$i -lt $text.count; $i ++) { $newtext += "$($i + 1)| " + $text[$i] }
    $newtext
    }
else { Write-Host "$args does not exist" -ForegroundColor Red }