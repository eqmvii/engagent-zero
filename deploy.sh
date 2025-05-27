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
echo "Updated dist to docs"

# Copy json directory to docs directory
if [ -d "json" ]; then
    cp -r json docs/json
    echo "Copied json directory to docs directory"
fi

# Fix asset paths for GitHub Pages
# GitHub Pages serves sites from a subdirectory (the repo name), so we need to make paths relative
# by removing leading slashes from asset paths
find docs -type f \( -name "*.html" -o -name "*.js" \) -exec sed -i "s|/assets/|assets/|g" {} \;
find docs -type f \( -name "*.html" -o -name "*.js" \) -exec sed -i "s|/json/|json/|g" {} \;
echo "removed leading slashes from asset paths"


echo "Deployment preparation completed successfully"
echo "You can now commit and push the changes to GitHub"
