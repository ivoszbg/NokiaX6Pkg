#!/bin/bash
#
# Based on the instructions from edk2-platform
#
set -e

# Set workspace variables
export PACKAGES_PATH=$PWD/edk2:$PWD/edk2-platforms:$PWD
export WORKSPACE=$PWD/Build

# Compile BaseTools
. edk2/edksetup.sh
make -C ./edk2/BaseTools

# Compile the implementation
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p NokiaX6Pkg/NokiaX6.dsc
