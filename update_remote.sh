#! /bin/bash
git add .
read -p "Please enter commit message: " commit_message
git commit -m "$commit_message"
git push
echo "Finished Update"

