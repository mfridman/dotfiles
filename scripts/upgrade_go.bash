#!/bin/bash

set -euo pipefail

# This script upgrades Go to the specified version,
# if no version is specified, it will upgrade to the
# latest version. It Go is installed in /usr/local/go.

# Ask for the administrator password upfront.
echo "Password required to install to /usr/local/go ..."
sudo -v

# Check if the version argument is set, otherwise use the latest version.
if [ $# -eq 0 ]; then
    version=$(curl -s https://go.dev/dl/?mode=json | jq -r '.[0].version')
    echo "Upgrading to $version ..."
else
    version=$1
    echo "Upgrading to $version ..."
fi

# Confirm the current version is not the same as the new version.
if [ -x "$(command -v go)" ]; then
    current_version=$(go version | awk '{print $3}')
    if [ "$current_version" = "$version" ]; then
        echo "$version is already installed"
        exit 0
    fi
fi

# Default to the amd64 architecture.
# TODO: Add support for other architectures.
source_url="https://go.dev/dl/$version.darwin-arm64.tar.gz"

# Temporary directory to download the archive.
tmpdir=$(mktemp -d) && trap "rm -rf $tmpdir" EXIT

# Download the archive.
echo "Downloading $source_url ..."
if ! curl -sSL "$source_url" | tar -C "$tmpdir" -xz; then
    echo "Failed to download $source_url"
    exit 1
fi

# Remove existing Go installation, if any.
if [ -d "/usr/local/go" ]; then
    echo "Removing existing Go installation ..."
    sudo rm -rf /usr/local/go
fi

# Move the new version to /usr/local.
sudo mv "$tmpdir/go" /usr/local

# Confirm the new version.
if [ $? -eq 0 ]; then
    echo "Successfully upgraded to $version"
else
    echo "Failed to upgrade to $version"
    exit 1
fi
