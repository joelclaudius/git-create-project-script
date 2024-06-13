#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Load environment variables from .env file in the current directory
if [ -f ".env" ]; then
    echo "Loading environment variables from .env in the current directory"
    source ".env"
else
    echo "No .env file found in the current directory"
    exit 1
fi

# Check if GITHUB_TOKEN is set in the environment
if [ -z "$GITHUB_TOKEN" ]; then
    echo "GITHUB_TOKEN is not set. Please provide it in the .env file."
    exit 1
fi

# Prompt for GitHub username and project name
read -p "Enter your GitHub username: " github_username
read -p "Enter the name of your new project: " project_name
read -p "Do you want the repository to be private? (y/n): " private_repo

# Determine if the repository should be private or public
if [ "$private_repo" == "y" ] || [ "$private_repo" == "Y" ]; then
    private_flag=true
else
    private_flag=false
fi

# Create a new directory for the project and navigate into it
mkdir "$project_name"
cd "$project_name"

# Initialize a new Git repository
git init

# Rename the default branch to 'main'
git branch -M main

# Create a README.md file with a project title
echo "# $project_name" > README.md

# Stage and commit the README.md file
git add README.md
git commit -m "Initial commit"

# Create the GitHub repository using the GitHub API via cURL
response=$(curl -s -o /dev/null -w "%{http_code}" \
    -H "Authorization: token $GITHUB_TOKEN" \
    -d "{\"name\": \"$project_name\", \"private\": $private_flag}" \
    https://api.github.com/user/repos)

# Check the response code
if [ "$response" -eq 201 ]; then
    echo "GitHub repository '$project_name' created successfully."
else
    echo "Failed to create GitHub repository. HTTP response code: $response"
    exit 1
fi

# Add the remote GitHub repository to the local repository
git remote add origin https://github.com/$github_username/$project_name.git

# Push the initial commit to the remote repository
git push -u origin main

# Inform the user how to navigate to the new project directory
echo "Project '$project_name' has been pushed to GitHub successfully."

# Print instructions to switch to the project directory
echo "To switch to the project directory, run the following command:"
echo "cd $project_name"
