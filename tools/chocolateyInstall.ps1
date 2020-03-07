$packageName = 'manifest-tool'
$url64 = 'https://github.com/estesp/manifest-tool/releases/download/v1.0.1/manifest-tool-windows-amd64.exe'
$checksum64 = '41c08bc1052534f07282eae1f2998e542734b53e79e8d84e4f989ac1c27b2861'
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
