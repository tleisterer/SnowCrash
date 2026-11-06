decompile level10. You see they check with access if we are allowed to open the file and then open it. This leaves enought room for a TOCTOU (time-of-check-time-of-use) vulnaribility. Means we whait until access is checked for a file with have access to and then swap out the file.

just use the script for that

```Shell
# a.out is the compiled TOCTOU.c
# If you have trouble compiling it in ~
# compile it in /tmp/somedir

./TOCTOU.sh ./a.out
```

It is very propable that you need to run this script multiple times to get it work, the timing really depends on a lot of stuff we cannot control
