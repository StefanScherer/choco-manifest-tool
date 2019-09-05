#!/bin/bash

if [ "$1" = "" ]; then
  echo "Usage: $0 version"
  echo "Update the choco package to a given version"
  echo "Example: $0 1.10.3"
  exit 1
fi

if [[ "${OSTYPE}" != "darwin"* ]]; then
  echo "This version does only support Mac."
  exit 2
fi

version=$1

url="https://github.com/estesp/manifest-tool/releases/download/v${version}/manifest-tool-windows-amd64.exe"

checksum=$(curl -L "${url}" | shasum -a 256 - | cut -f 1 -d " ")

sed -i.bak "s/<version>.*<\/version>/<version>${version}<\/version>/" manifest-tool.nuspec

sed -i.bak "s/version: .*{build}/version: ${version}.{build}/" appveyor.yml

sed -i.bak "s!^\$url64 = '.*'!\$url64 = '${url}'!" tools/chocolateyInstall.ps1
sed -i.bak "s/^\$checksum64 = '.*'/\$checksum64 = '${checksum}'/" tools/chocolateyInstall.ps1
