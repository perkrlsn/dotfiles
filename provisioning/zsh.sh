#!/usr/bin/env bash

zsh_dotfiles_dir="$HOME/.templates/zsh"
target="$HOME"

for file in $(ls $zsh_dotfiles_dir); do
  if [ -f "$target/$file" ]; then
    rm "$target/$file"
  fi
done

for file in $zsh_dotfiles_dir/.z*; do
  ln -s "$file" "$target"
done