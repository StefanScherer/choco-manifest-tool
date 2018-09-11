$packageName = 'manifest-tool'
$url = 'https://github.com/estesp/manifest-tool/releases/download/v0.7.0/manifest-tool-windows-amd64.exe'
$url64 = $url
$checksum = '3dab4002c49e900e3e8feab79b9cd7dd84c4866e4956458be8b9eccd9fe01cf3'
$checksum64 = $checksum
$checksumType = 'sha256'
$checksumType64 = $checksumType

$destination = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$file = "$($destination)\manifest-tool.exe"

if (![System.IO.Directory]::Exists($destination)) {[System.IO.Directory]::CreateDirectory($destination)}

Get-ChocolateyWebFile `
  -PackageName    $packageName `
  -FileFullPath   $file `
  -Url            $url `
  -Url64bit       $url64 `
  -Checksum       $checksum `
  -Checksum64     $checksum64 `
  -ChecksumType   $checksumType `
  -ChecksumType64 $checksumType64
