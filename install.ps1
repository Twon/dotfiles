$sourceFolder = Split-Path -Parent $MyInvocation.MyCommand.Path
$destinationFolder = "$env:userprofile"

Copy-Item $sourceFolder\* $destinationFolder -Recurse -Confirm