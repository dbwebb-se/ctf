Capture the flag with dbwebb (dbwebb ctf)
===================

[![Latest Stable Version](https://poser.pugx.org/dbwebb/ctf/v/stable)](https://packagist.org/packages/dbwebb/ctf)
[![Join the chat at https://gitter.im/dbwebb-se/ctf](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/dbwebb-se/ctf?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://travis-ci.org/dbwebb-se/ctf.svg?branch=master)](https://travis-ci.org/dbwebb-se/ctf)
[![CircleCI](https://circleci.com/gh/dbwebb-se/ctf.svg?style=svg)](https://circleci.com/gh/dbwebb-se/ctf)

Course material for using Capture The Flag (CTF), ctf exercises, for education purpose.

The repo provides a collection of ctf-exercises, aligned in the same structure to ease producing new ctfs. The idea is to provide a course created with a set of ctf exercises to select from when creating course material.

Relased as part of a University teaching material at https://dbwebb.se/kurser/capture-the-flag

<!--
The ctfs can be applied and managed using the [dbwebb command line utility](https://dbwebb.se/dbwebb-cli).
-->



Table of content
-------------------

* [Try out your first dbwebb ctf](#Try-out-your-first-dbwebb-ctf)
* [Create a new dbwebb ctf](#Create-a-new-dbwebb-ctf)
* [Acknowledgement](#Acknowledgement)
* [License](#License)



Try out your first dbwebb ctf
-------------------

Learn the concept by finding your first flag by solving a your first dbwebb ctf.

The flag you are looking for looks something like this, each ctf has its own flag.

> dbw3bb-CTF{some text related to the flag}
> dbw3bb-CTF{50m3 73x7 r3l473d 70 7h3 fl46}

You can start by solving [a sample dbwebb ctf](src/0001/README.md).



Create a new dbwebb ctf
-------------------

You can contribute by adding more ctf to this repo.

All ctfs are in the the directory `src/XXXX`. You can duplicate the directory ctf `src/0001` and start working from that base. 

You can read about the dbwebb ctf structure in [`src/README.md`](src/README.md).

Ensure that your dbwebb ctf passes `make test` before you commit it.



Acknowledgement
-------------------

This is a co-effort of several people using freely available documentation and tools from the open source community. 

For contributors, see the commit history and the issues.

Feel free to help building up the repository with more content suited for training and education.



License
-------------------

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. See [LICENSE.txt](LICENSE.txt).



```                                                            
 .                                                             
..:  Copyright (c) 2018 - 2019 Mikael Roos, mos@dbwebb.se      
```                                                            
