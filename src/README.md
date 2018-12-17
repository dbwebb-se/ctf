About dbwebb CTF structure
============================

Here you can see the basic structure for a dbwebb ctf. Check out the directory [0001](0001) for a sample dbwebb ctf.



make install
----------------------------

Use the Makefile to work with the ctf. You may install a test environment for a ctf using `make install`.



make build
----------------------------

Create the script `script/create.bash` which creates the ctf and puts it into the directory `target`. A dbwebb ctf should be one file that could be downloaded by the user.

The script is executed by the target `make build`.  The script should echo out the name of the target file.



flag.txt
----------------------------

Create a file `flag.txt` which contain the flag.

A flag looks like this.

> `dbwebb-CTF{some message related to the ctf}`



make solve
----------------------------

Create the script `script/solve.bash` that solves the dbwebb ctf by using the file in `target/`. The script is executed by the target `make solve`. The script should echo out the flag.

Use a temporary directory `build/solve` when solving the ctf, thats how the user will solve it.



make test
----------------------------

Make the cft pass tests in `make test`.



Instructions
----------------------------

Write instructions i `README.md`, together with some meta data for the ctf. The file should contain details on the ctf and how to get started with solving it.

The directory `hint/` should contain files `1.md`, `2.md` and so on, one for each hint.
