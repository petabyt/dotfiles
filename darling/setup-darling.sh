#!/bin/sh

yes | xcode-select --install

# Allow running brew setup as root
touch /.dockerenv

yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/root/.profile
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> /Users/root/.profile
eval "$(/usr/local/bin/brew shellenv)"
