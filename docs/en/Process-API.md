---
layout: default
title: Process API
---
# OTYAX5 Process API

## NewProcess NAME$,ARGS$ OUT PRC,ERR
Start process NAME$ with ARGS$ as an argument.

## SetProcessVar DAT
Set local memory variables of the process.

## GetProcessVar()
Get the local memory variable of the process.

## CheckProcess(PRC)
Determine if PRC is a normal process.

## GetProcessArgs$()
Get the argument of the current process.

##  GetSTDIN OUT FILE
Obtain standard input file.

##  GetSTDOUT OUT FILE
Get the file for standard output.

##  GetSTDERR OUT FILE
Get the standard error output file

## SetProcessSTDIN PRC,FILE
Set the standard input file of PRC

## SetProcessSTDOUT PRC,FILE
Set the standard output file of PRC

## SetProcessSTDERR PRC,FILE
Set the standard error output file of PRC

##  GetProcessSTDIN PRC OUT FILE
Get the standard input file of PRC.

##  GetProcessSTDOUT PRC OUT FILE
Get the standard output file of PRC.

##  GetProcessSTDERR PRC OUT FILE
Get the standard error output file of PRC.

## GetPID()
Get the current PID.

## ExitProcess RESULT
Terminate the current process.

## KillProcess PRC OUT ERR
Kill PRC.

## ExecCommand LINE$ OUT PRC,ERR
Execute a command
```
name args [> filename] [< filename] | ...
```

## GetCommandArgsWithoutName$(ARGS$)
Get ARGS$ without first argument.

## GetCommandArg ARGS$,I OUT CMD$,INDEX
Get argument as CMD$ with I as starting point from ARGS$.\
INDEX contains the position where the argument ended.

## CommandArgsToArray ARY$[],EXPAND OUT LEN
Write the arguments of the current process to ARY$.\
If EXPAND is set to TRUE, it expands when the elements of the array are not enough.\
LEN contains the number of arguments.

## HasChildProcess(PRC)
TRUE if PRC has a child process

## GetProcessTime(PRC)
Time spent by PRC (ms)

## GetProcessElapsedTime(PRC)
Time since PRC started (ms)

## GetProcessPID(PRC)
Get PID of PRC\
On error, 0 is returned

## GetParentProcess(PRC)
Get parent process of PRC\
On error, 0 is returned

## GetProcessName$(PRC)
Get name of PRC\
"" Is returned when an error occurs

## GetRootProcess()
Get root process

## GetChildProcesses(PRC,ARY[],R)
Get child process of PRC

|argument|description|
|---|---|
|ARY[]|output array (automatically expanded)|
|R|TRUE to get child process recursively|

### 戻り値
Number of process
