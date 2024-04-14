#!/bin/bash

set -euo pipefail

# Bash script to delete multiple GitHub repositories using gh cli

# List of repositories to delete
REPO_LIST=(
    "mfridman/deleteme"
)

# Boolean variable to control deletion confirmation
SKIP_CONFIRMATION=false

# Function to delete a repository
delete_repo() {
    local repo_name="$1"
    # Check if repository exists before attempting to delete
    if gh repo view "$repo_name" &>/dev/null; then
        echo "Deleting $repo_name..."
        # Construct the delete command with or without confirmation
        delete_command="gh repo delete"
        if [ "$SKIP_CONFIRMATION" = true ]; then
            delete_command+=" --confirm"
        fi
        delete_command+=" \"$repo_name\""
        # Execute the delete command
        if eval "$delete_command"; then
            echo "Repository $repo_name deleted successfully."
        else
            echo "Failed to delete $repo_name. Check permissions or try again later."
        fi
    else
        echo "Repository $repo_name not found. Skipping deletion."
    fi
}

# Iterate through the list of repositories
for repo in "${REPO_LIST[@]}"; do
    delete_repo "$repo"
done
