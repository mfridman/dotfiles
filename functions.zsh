cl() {
    local repo="$1"
    local dir_name
    
    if [[ -z "$repo" ]]; then
        echo "Usage: cl <repo-url-or-name>"
        return 1
    fi
    
    # Extract path from URL, preserving host/owner/repo structure
    if [[ "$repo" == https://* ]]; then
        # Remove https:// prefix
        dir_name="${repo#https://}"
    elif [[ "$repo" == git@*:* ]]; then
        # Convert git@host:owner/repo to host/owner/repo
        dir_name="${repo#git@}"
        dir_name="${dir_name/:///}"
    elif [[ "$repo" == *"/"* ]]; then
        # Use as-is if it contains slashes
        dir_name="$repo"
    else
        # Single name, use as-is
        dir_name="$repo"
    fi
    
    # Remove .git suffix if present
    dir_name="${dir_name%.git}"
    
    local target_dir="$HOME/src/$dir_name"
    
    # Clone if directory doesn't exist
    if [[ ! -d "$target_dir" ]]; then
        git clone "$repo" "$target_dir" || return 1
    fi
    
    cd "$target_dir"
}

fn_upgrade-go() {
    $HOME/.dotfiles/scripts/upgrade_go.bash "$@"
}

fn_docker-prune() {
    docker system prune -f --volumes && docker image prune -a -f
}
