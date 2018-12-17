About dbwebb CTF structure
============================

This is the basic structure for a dbwebb ctf.

Use the Makefile to work with the ctf.

You may install a test environment for only this ctf using `make install`.

Create a script `script/create.bash` which creates the ctf and puts it into the directory `target`. A dbwebb ctf should be one file that could be downloaded by the user. The script is executed by the target `make build`.

Create a file `flag.txt` which contain the flag.

A flag looks like this.

> `dbwebb-CTF{some message related to the ctf}`

Create a script `script/solve.bash` that solves the dbwebb ctf by using the file in `target/`. The script is executed by the target `make solve`.

Make the cft pass tests in `make test`.

Write instructions i the directory `doc/`. The file `doc/instruction.md` should contain details on the ctf and how to get started with solving it. The directory `doc/hint/` should contain files `1.md`, `2.md` and so on, one for each hint. The file `doc/meta.md` contains details and classifications of the ctf.
