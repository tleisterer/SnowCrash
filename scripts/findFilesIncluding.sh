#! /usr/bin/env bash

# for flags
# find / -type f ! -ipath '/rofs/*' -exec grep -InHE "flag[0-9]{2}" {} + 2>/dev/null
find / -type f -exec grep -InHE "$1" {} + 2>/dev/null