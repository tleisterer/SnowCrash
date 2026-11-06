#!/usr/bin/env bash

normalize_number() {
    local number=$((10#$1))

    if [[ $number -lt 10 ]]; then
        number="0$number"
    fi

    echo "$number"
}

login() {
    local user=$1
    local level_token=$2

    echo "Logging in to $user..."

    local passfile="/tmp/$user.ssh_askpass"
    echo -e "echo \"$level_token\"" > "$passfile"
    chmod 777 "$passfile"
    SSH_ASKPASS=$passfile setsid ssh -p "$PORT" "$user@localhost"
}

main() {
    local level_to_check="$1"

    if [ -z "$level_to_check" ]; then
        echo "Usage: $0 <level_number>"
        exit 1
    fi

    # go to the root of the project
    cd "$(dirname "$0")/.."

    # set the port to the default value if not set
    local PORT=${PORT:-4000}

    local level_number=$(normalize_number "$level_to_check")
    local level_token_file="level$(normalize_number "$((10#$level_number - 1))")/flag"

    if [ $level_number == 00 ]; then
        login "level$level_number" "level00"
        exit 0
    fi
    if ! [ -f $level_token_file ] && [ $level_number != 00 ]; then 
        echo "Level $1 does not exist.";
        exit 1;
    fi
    local level_token=$(cat "$level_token_file")
    login "level$level_number" "$level_token"
}

main "$@"
