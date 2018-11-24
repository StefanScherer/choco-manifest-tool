$packageName = 'manifest-tool'
$url = 'https://github.com/estesp/manifest-tool/releases/download/v0.9.0/manifest-tool-windows-amd64.exe'
$url64 = $url
$checksum = 'c34688e5b074eaa36a885a19f96e8d4f2a4e29fd4ed8ccac5d2fc3049ba61ae6'
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
