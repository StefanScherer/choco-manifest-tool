$packageName = 'manifest-tool'
$url64 = 'https://github.com/estesp/manifest-tool/releases/download/v1.0.0/manifest-tool-windows-amd64.exe'
$checksum64 = '983d4ebde6a654ab1fd92d4a69c69ae934ceba9b810ca10ab0d08c6b520a1787'
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
