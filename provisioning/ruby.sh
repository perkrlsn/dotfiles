#!/usr/bin/env bash

echo "Installing Gems"
echo "==============="
while read -r in; do sudo gem install "$in"; done < "$HOME"/.dependencies/gem
