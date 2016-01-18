#!/bin/bash

# Verify the script is ran as root
if [ "$(whoami)" != "root" ]
then
    echo "This script must be executed as root.";
    exit 0
fi

echo "================================================================================"
echo "=== Enabling i386 packages...                                                ==="
echo "================================================================================"
dpkg --add-architecture i386
apt-get update --assume-yes && apt-get upgrade --assume-yes

echo "================================================================================"
echo "=== Installing 32-bit libraries...                                           ==="
echo "================================================================================"
apt-get install --assume-yes build-essential ia32-libs libstdc++6:i386 libc6:i386 lib32z1-dev lib32z1
#ubuntu user: libncurses5:i386 libstdc++6:i386

echo "================================================================================"
echo "=== Installing additional packages                                           ==="
echo "================================================================================"
apt-get install --assume-yes screen rsync git unzip
