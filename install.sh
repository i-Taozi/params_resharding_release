#!/bin/bash

# params_resharding automatic installation script

set -e

echo "Starting params_resharding module installation..."

# Detect Python version
PYTHON_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
echo "Detected Python version: $PYTHON_VERSION"

# Supported Python versions
SUPPORTED_VERSIONS=("3.8" "3.9" "3.10" "3.11")

# Check if version is supported
VERSION_SUPPORTED=false
for version in "${SUPPORTED_VERSIONS[@]}"; do
    if [ "$PYTHON_VERSION" = "$version" ]; then
        VERSION_SUPPORTED=true
        break
    fi
done

if [ "$VERSION_SUPPORTED" = false ]; then
    echo "Error: Unsupported Python version $PYTHON_VERSION"
    echo "Supported versions: ${SUPPORTED_VERSIONS[*]}"
    exit 1
fi

# Check architecture
ARCH=$(uname -m)
if [ "$ARCH" != "x86_64" ]; then
    echo "Error: Unsupported architecture $ARCH"
    echo "Only x86_64 architecture is supported"
    exit 1
fi

# Copy corresponding .so files
PYTHON_DIR="python_${PYTHON_VERSION//./}"
if [ -d "$PYTHON_DIR" ]; then
    echo "Copying compiled files for Python $PYTHON_VERSION..."
    cp $PYTHON_DIR/*.so params_resharding/
    echo "Installation completed!"
else
    echo "Error: Compiled files for Python $PYTHON_VERSION not found"
    exit 1
fi
