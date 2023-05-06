#!/bin/bash

# Script continues here if running as root
script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
folders=("$script_path" "$script_path/os/linux")
destination_folder="$HOME"

for folder in "${folders[@]}"; do
  for file in "$folder"/*; do
    if [[ -f "$file" ]]; then
      target="$destination_folder/$(basename "$file")"
      if [[ -L "$target" ]]; then
        echo "Symbolic link '$(basename "$file")' already exists in the destination folder."
      elif [[ -e "$target" ]]; then
        echo "File '$(basename "$file")' already exists in the destination folder."
      else
        ln -s "$file" "$target"
        echo "Created symbolic link for $(basename "$file") in the root of the destination folder."
      fi
    fi
  done
done