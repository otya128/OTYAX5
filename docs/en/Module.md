---
layout: default
title: Module
---

## Module system
You can load modules using the `loadmod` command.


`loadmod -e path` load and execute

`loadmod path` load only

## API

### LoadModule FILE$ OUT ENTRYPOINT$,ERR
Load the module from FILE$\
ENTRYPOINT$ contains the process name (otherwise empty string)

### ExecModule FILE$,ARGS$ OUT PRC,ERR
Read and execute the module from FILE$.

## Module File
What you can do with SmileBASIC.\
The first I_HOGE is the ENTRYPOINT.\
Note that to prevent PetitCom errors the array is initialized once.\
Note that variable and function declarations are not recognized unless they are placed at the beginning of the line (in order to reduce the parsing cost)
