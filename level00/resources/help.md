Based on the video you have to find the only file that can be accessed by flag00

```Shell
find / -user flag00 2> /dev/null
# /usr/sbin/john
# /rofs/usr/sbin/john

cat /usr/sbin/john
# cdiiddwpgswtgt
```

This code has to be decoded: Use [dcode.fr](https://www.dcode.fr/en&v5)
