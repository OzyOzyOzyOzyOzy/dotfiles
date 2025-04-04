#!/bin/bash

# Check that script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "Root priveleges recquired. Please run scipt with sudo or switch to root user."
    exit 1
fi

# Check if apt is available
if ! command -v apt &> /dev/null; then
    echo "apt not found. apt is recquired to run this script."
    exit 1
fi

# Prompt user for the software
read -p "Enter name of software to be installed: " SOFTWARE

# Give user detailed installation notes
echo "This script will install: $SOFTWARE"
read -p "Proceed with installation? (y/n): " CONFIRM
if [[ "$CONFIRM" != "y" ]]; then
    echo "Installation cancelled."
    exit 0
fi

# Check if software is already installed
if command -v "$SOFTWARE" &> /dev/null; then
    echo "A command named '$SOFTWARE' already exists on the system. Installation aborted to prevent conflicts."
    exit 1
fi

# Install software
apt update -y
apt install -y "$SOFTWARE"

# Verify installation
if command -v "$SOFTWARE" &> /dev/null; then
    echo "Installation complete"
else
    echo "Installation failed. Please see logs for errors."
    exit 1
fi
