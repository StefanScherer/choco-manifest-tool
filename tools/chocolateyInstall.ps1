$packageName = 'manifest-tool'
$url64 = 'https://github.com/estesp/manifest-tool/releases/download/v1.0.2/manifest-tool-windows-amd64.exe'
$checksum64 = 'bb457dd18186c1f93a24612cae6a32bd7439ddab7ef13d8c9c1c2c4022f53317'
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
