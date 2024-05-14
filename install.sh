#!/bin/bash

# Stage 1: Cloning Project
# Ensure the directory exists before trying to remove .env
mkdir -p /home/ubuntu/workspace/Prod_kadmin_pipeline/
cd /home/ubuntu/workspace/Prod_kadmin_pipeline/ || exit 1

if [ -d ".git" ]; then
    remote_output=$(git remote -v)
    if [ -n "$remote_output" ]; then
        echo "Git repository is already initialized"
        git checkout production || git checkout -b prodution
        git pull origin production
    else
        echo "Remote git repository not initialized"
        echo "Initializing git repository"
        git remote add origin https://github.com/omik-simform/newhub.git
        git fetch origin production
        git checkout origin/production --track
    fi
else
    echo ".git directory does not exist."
    git init
    git remote add origin https://github.com/omik-simform/newhub.git
    git fetch origin production
    git checkout origin/production --track
fi

# Stage 2: Env Fetching
cp /home/ubuntu/env_files/kadmin.env /home/ubuntu/workspace/Prod_kadmin_pipeline/.env || exit 1
id
pwd
ls -alh

sudo apt update
echo "Hii all"