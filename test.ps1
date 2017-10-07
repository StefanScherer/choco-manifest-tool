"Running tests"
$ErrorActionPreference = "Stop"
$version = $env:APPVEYOR_BUILD_VERSION -replace('\.[^.\\/]+$')

"TEST: Version $version in manifest-tool.nuspec file should match"
[xml]$spec = Get-Content manifest-tool.nuspec
if ($spec.package.metadata.version.CompareTo($version)) {
  Write-Error "FAIL: rong version in nuspec file!"
}

"TEST: Package should contain only install script"
Add-Type -assembly "system.io.compression.filesystem"
$zip = [IO.Compression.ZipFile]::OpenRead("$pwd\manifest-tool.$version.nupkg")
if ($zip.Entries.Count -ne 5) {
  Write-Error "FAIL: Wrong count in nupkg!"
}
$zip.Dispose()

"TEST: Installation of package should work"
. choco install -y manifest-tool -source .

"TEST: Version of binary should match"
. manifest-tool --version
if (-Not $(manifest-tool --version).Contains("version $version")) {
  Write-Error "FAIL: Wrong version of manifest-tool installed!"
}

"TEST: Uninstall show remove the binary"
. choco uninstall manifest-tool
try {
  . manifest-tool
  Write-Error "FAIL: manifest-tool binary still found"
} catch {
  Write-Host "PASS: manifest-tool not found"
}

"TEST: Finished"
