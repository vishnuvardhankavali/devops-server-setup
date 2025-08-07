#!/bin/bash

# Fix DNS if needed
echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing now..."
    sudo apt update
    sudo apt install -y git

    if command -v git &> /dev/null; then
        echo "✅ Git successfully installed!"
        git --version
    else
        echo "❌ Git installation failed."
    fi
else
    echo "✅ Git is already installed."
    git --version
fi
