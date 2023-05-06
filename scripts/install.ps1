# Check if the script is running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # Relaunch the script as an administrator
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$rootPath = Split-Path -Parent $scriptPath
$folders = @($rootPath, (Join-Path $rootPath "os\windows"))
$destinationFolder = $HOME

foreach ($folder in $folders) {
  foreach ($file in (Get-ChildItem $folder)) {
    $target = Join-Path $destinationFolder $file.Name
    if ($file.Attributes -band [System.IO.FileAttributes]::Directory) {
      Write-Host "Skipping directory $($file.Name)."
      continue
    }

    if (Test-Path $target) {
      Write-Host "Symbolic link '$($file.Name)' already exists in the destination folder."
    } else {
      $fileLink = Join-Path $folder $file.Name
      New-Item -ItemType SymbolicLink -Path $target -Target $fileLink
      Write-Host "Created symbolic link for $($file.Name) in the root of the destination folder."
    }
  }
}
