#!/bin/bash
echo -e "Deploying ~/Hugo/Sites/chaos/public updates to GitHub..."
# Build the project.
cd ~/Hugo/Sites/chaos
hugo
# Go To Public folder
cd public
# Add changes to git.
git add --all
# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
then msg="$1"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin master
# Come Back
cd ..

