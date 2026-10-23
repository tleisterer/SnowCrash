#!/usr/bin/env bash

normalize_number() {
    local number=$(($1))

    if [[ $number -lt 10 ]]; then
        number="0$number"
    fi

    echo "$number"
}

login() {
    local level_number=$1
    local level_token=$2

    echo "Logging in to level$level_number..."

    local passfile="/tmp/level$level_number.ssh_askpass"
    echo -e "echo \"$level_token\"" > "$passfile"
    chmod 777 "$passfile"
    SSH_ASKPASS=$passfile setsid ssh -p "$PORT" "level$level_number@localhost"
}

main() {
    if [ -z "$1" ]; then
        echo "Usage: $0 <level_number>"
        exit 1
    fi

    # go to the root of the project
    cd "$(dirname "$0")/.."

    # set the port to the default value if not set
    local PORT=${PORT:-4000}
    local level_number=$(normalize_number "$1")
    local level_token_file="level$(normalize_number $(("$level_number" - 1)))/token.txt"

    if [[ $level_number == 00 ]]; then
        login "$level_number" "level00"
    else
        if [[ ! -f $level_token_file ]]; then 
            echo "Level $1 does not exist.";
            exit 1;
        fi
        local level_token=$(cat "$level_token_file")
        login "$level_number" "$level_token"
    fi
}

main "$@"
