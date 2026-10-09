#! /usr/bin/env bash
main() {
    local tmpFile=$(mktemp)

    echo "Using TempFile: $tmpFile"
    echo "$@" > "$tmpFile"
    echo -n "Decripting..."
    john --encoding=UTF-8 "$tmpFile" > /dev/null
    echo -e " \e[32mDone\e[0m"
    john --show "$tmpFile"
}

main "$@"