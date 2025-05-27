#!/bin/sh

# GitHub Pages Deployment Script

# Exit immediately if a command exits with a non-zero status
set -e

# Check if dist folder exists
if [ ! -d "dist" ]; then
    echo "Error: dist folder not found. Please run 'npm run build' first."
    exit 1
fi

# Remove existing docs folder if it exists
if [ -d "docs" ]; then
    rm -rf docs
fi

# Rename dist to docs
mv dist docs

# Copy public directory to docs
if [ -d "public" ]; then
    cp -r public/* docs/
    echo "Copied public directory to docs"
fi

echo "Updated dist to docs"

# TODO ERIC - doesn't work, manually edited file for test
# Function to update file paths in a file
update_paths() {
    local file="$1"
    # Create a temporary file
    local temp_file="${file}.tmp"
    
    # Update paths in the file
    sed \
        -e 's|"/json/|"engagent-zero/json/|g' \
        -e 's|/json/|engagent-zero/json/|g' \
        -e 's|src="/assets/|src="/engagent-zero/assets/|g' \
        -e 's|href="/assets/|href="/engagent-zero/assets/|g' \
        "$file" > "$temp_file"
    
    # Replace original file with the updated one
    mv "$temp_file" "$file"
}

export -f update_paths

# Find and update all HTML and JS files
find docs \( -name '*.html' -o -name '*.js' \) -type f -exec bash -c 'update_paths "$0"' {} \;

echo "Updated all asset paths"

echo "Deployment preparation completed successfully"
echo "You can now commit and push the changes to GitHub"
