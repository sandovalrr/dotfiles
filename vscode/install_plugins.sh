#!/bin/bash
# EXTENSIONS_FILE="$(dirname "$(realpath "${BASH_SOURCE[0]}")")/extensions.txt"
EXTENSIONS_FILE="vscode/extensions.txt"

extensions="$(cat "$EXTENSIONS_FILE")"

for extension in $extensions; do
  # TODO: add support version
  code --install-extension "${extension%@*}"
done

