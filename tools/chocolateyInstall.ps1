$packageName = 'manifest-tool'
$url64 = 'https://github.com/estesp/manifest-tool/releases/download/v0.9.0/manifest-tool-windows-amd64.exe'
$checksum64 = 'c34688e5b074eaa36a885a19f96e8d4f2a4e29fd4ed8ccac5d2fc3049ba61ae6'
$checksumType64 = 'sha256'

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\manifest-tool.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile `
  -PackageName    $packageName `
  -FileFullPath   $file `
  -Url64bit       $url64 `
  -Checksum64     $checksum64 `
  -ChecksumType64 $checksumType64
