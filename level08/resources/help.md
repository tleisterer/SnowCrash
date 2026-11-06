when you decompile it you see, that `level08` opens a file that does NOT contain the word token (provided via argv[1]). reads it and writes its content to the stdout.

Just create a symlink to `token`, not containing this word.

the thing in the token file is NOT ACTUALLY THE TOKEN, but rather its the password for flag08
