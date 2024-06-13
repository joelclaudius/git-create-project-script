# GitHub Project Automation Script

## Overview

This script automates the process of creating a new GitHub repository, initializing it with a README.md file, and pushing the initial commit to GitHub. It also renames the default branch from `master` to `main`.

## Prerequisites

Before using this script, ensure you have the following:

1. **GitHub Personal Access Token**: Generate a personal access token with `repo` scope from your GitHub account. Add this token to a `.env` file in the root directory of this script (see `.env.example` for reference).

   ```plaintext
   GITHUB_TOKEN=your_personal_access_token_here
   ```

   ## Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/your_username/your_repository.git
   ```

1. **Navigate to the Directory**

   ```bash
   cd your_repository
   ```

1. **Make the Script Executable**

   ```bash
   chmod +x create-github-project.sh
   ```

## Usage

1. **Run the script**

   ```bash
   ./create-github-project.sh
   ```

## Follow the Prompts

1. **Enter your GitHub username**.
2. **Enter the name of your new project**.
3. **Choose whether the repository should be private or public**.

## Features

- Creates a new GitHub repository via the GitHub API.
- Initializes the repository with a README.md file.
- Renames the default branch from `master` to `main`.
- Pushes the initial commit to the remote repository.

### Notes:

- Replace placeholders like `your_username`, `your_repository`, and `project_name` with actual values relevant to your setup.
- Ensure there is a `LICENSE` file in your repository containing the appropriate license text if you choose a license other than MIT, and adjust the reference in the README.md accordingly.
- Markdown format is widely used for GitHub repositories as it provides a structured way to format text, making it suitable for creating clear and organized documentation.
