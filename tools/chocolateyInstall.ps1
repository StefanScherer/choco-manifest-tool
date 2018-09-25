$packageName = 'manifest-tool'
$url = 'https://github.com/estesp/manifest-tool/releases/download/v0.8.0/manifest-tool-windows-amd64.exe'
$url64 = $url
$checksum = 'd220568a8b5de402f26dab5d0e0e86b5f6594650fd38a6056c3012dbccb032f5'
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
