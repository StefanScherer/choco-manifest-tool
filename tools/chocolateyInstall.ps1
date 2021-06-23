$packageName = 'manifest-tool'
$url64 = 'https://github.com/estesp/manifest-tool/releases/download/v1.0.3/manifest-tool-windows-amd64.exe'
$checksum64 = 'e0b9782a32cd7fc4f0b78699b6db6bb24904063dd3d4f74c0fb9c77ee29ac2f8'
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
