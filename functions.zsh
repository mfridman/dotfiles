cl() {
    # https://github.com/felixge/cl
    cloned=$(command cl -dir "$HOME/src" "$1")
    cd "$cloned"
}

fn_upgrade-go() {
    $HOME/.dotfiles/scripts/upgrade_go.bash "$@"
}

fn_docker-prune() {
    docker system prune -f --volumes && docker image prune -a -f
}
