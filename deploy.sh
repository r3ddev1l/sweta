#!/bin/bash

# Stop on error
set -e

# Build Flutter web
flutter build web

# Create a temporary directory for gh-pages
rm -rf ../gh-pages-temp
mkdir ../gh-pages-temp

# Copy the web build to the temp directory root
cp -r build/web/* ../gh-pages-temp/

# Add CNAME file for the custom domain
echo 'www.srijanmaharjan.com.np' > ../gh-pages-temp/CNAME

# Push to gh-pages branch
cd ../gh-pages-temp
git init
git remote add origin git@github.com:r3ddev1l/my_portfolio.git
git checkout -b gh-pages
git add .
git commit -m "$commit_message"
git push --force origin gh-pages

# Cleanup
cd ..
rm -rf ../gh-pages-temp

echo "Deployed successfully!"