#!/usr/bin/env bash

echo "==> Installing global npm packages"
while read -r in; do npm install -g "$in"; done < ../dependencies/npm
tldr --update
