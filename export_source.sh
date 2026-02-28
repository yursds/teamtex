#!/bin/bash

# TeamTex Source Exporter
# This script creates a clean ZIP archive of your LaTeX source code, 
# excluding git history, devcontainer configs, and build artifacts.

OUTPUT_NAME="teamtex_source.zip"

echo "Creating clean source archive: $OUTPUT_NAME..."

# Check if zip is installed
if ! command -v zip &> /dev/null
then
    echo "Error: 'zip' command not found. Please install it or run this inside the Dev Container."
    exit 1
fi

# Remove old zip if exists
rm -f "$OUTPUT_NAME"

# Create the zip with exclusions
zip -r "$OUTPUT_NAME" . \
    -x "build/*" \
    -x ".git/*" \
    -x ".vscode/*" \
    -x ".devcontainer/*" \
    -x ".github/*" \
    -x ".gitignore" \
    -x "docs/*" \
    -x "README.md" \
    -x "export_source.sh"

echo "Done! You can now download '$OUTPUT_NAME'."
