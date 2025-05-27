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

# Update paths in index.html
sed -i 's|src="/assets/|src="/vibe-code-1/assets/|g' docs/index.html
sed -i 's|href="/assets/|href="/vibe-code-1/assets/|g' docs/index.html

echo "Updated asset paths in index.html"

echo "Deployment preparation completed successfully"
echo "You can now commit and push the changes to GitHub"
