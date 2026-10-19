#!/usr/bin/env bash
token=$(<./token)
for ((i=0; i < ${#token}; i++)); do
    printf -v char "%d" "'${token:$i:1}"
    printf "%b" "$(printf '\x%x\n' "$(($char - $i))" 2>/dev/null)"
done