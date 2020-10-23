#!/bin/bash
echo -e "Deploying ~/Hugo/Sites/chaos updates to GitHub..."
cd ~/Hugo/Sites/chaos
# Get current status before commit all
git status
# Add changes to git.
git add -A
# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
then msg="$1"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin master
# Get current status after commit all
git status
