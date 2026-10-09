just find every file we can read containing `flag01`using this command:

```Shell
find / -type f ! -ipath '/rofs/*' -exec grep -InHE "flag01" {} + 2>/dev/null
```

then you find: /etc/passwd:41:flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash
42hDRfypTqqnw looks like a password to crack, sadly [dcode.fr](https://www.dcode.fr/en&v5) does not find anything valid. Thats why we use john, a cli hash cracker
