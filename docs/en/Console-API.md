---
layout: default
title: Console API
---
# Console API
API to hit the console.
In the initial state Console to be outputted on the console screen of PetitCon is set.
The console is inherited by the child process.

## SetConsole CON
Set up the console of the current process.

## GetConsole CON
Get the console of the current process.

## PutConsole CON,BUF$ OUT ERR
Output BUF$ to the console

## ReadConsole CON,LEN OUT BUF$,ERR
Read LEN characters from the console. If LEN character can not be read, RETURN as it is without waiting.

## GetConsoleSize CON OUT W,H,ERR
Get console size.

## GetConsoleCursor CON OUT X,Y,ERR
Gets the cursor position of the console.

## SetConsoleCursor CON,X,Y OUT ERR
Set the cursor position of the console.

## GetConsoleForeColor CON OUT C,ERR
Console character Get foreground color.

## SetConsoleForeColor CON,C OUT ERR
Set console character foreground color.

## GetConsoleBackColor CON OUT C,ERR
Get console character background color.

## SetConsoleBackColor CON,C OUT ERR
Set the console character background color.

## NewConsole OUT CON,ERR
Create a console.

## DupConsole CON OUT ERR,CON2
Duplicate the console.

### ERR
When CON is invalid CON_ERROR_INVALIDCON, take over the error that appears in NewConsole

## CheckConsole(CON)
Confirm whether CON is an invalid value. TRUE if normal, FALSE if invalid.

##  DeleteConsole CON OUT ERR
Discard the console.

### ERR
CON is invalid CON_ERROR_INVALIDCON

## SetGetConsoleSizeHandler(CON,FUNC$)
Set handler to get console size.

### ERR
When FUNC$ is invalid CON_ERROR_INVALIDFUNC
CON is invalid CON_ERROR_INVALIDCON

## SetPutConsoleHandler(CON,FUNC$)
Set the handler to be output to the console.

## SetReadConsoleHandler(CON,FUNC$)
Set handler to get input from the console.

## SetGetConsoleCursorHandler(CON,FUNC$)
Sets the handler that gets the cursor position of the console.

## SetSetConsoleCursorHandler(CON,FUNC$)
Set a handler to set the cursor position of the console.

## SetGetConsoleBackHandler(CON,FUNC$)
Set handler to acquire console character background color.

## SetSetConsoleBackHandler(CON,FUNC$)
Set handler to set console character background color.

## SetGetConsoleForeHandler(CON,FUNC$)
Console character Sets the handler that acquires the foreground color.

## SetSetConsoleForeHandler(CON,FUNC$)
Console character Sets the handler to set the foreground color.

## SetConsoleVar CON,V OUT ERR
Set console variables.

### ERR
CON is invalid CON_ERROR_INVALIDCON

## SetConsoleVar$ CON,V$ OUT ERR
Set console variables.

### ERR
CON is invalid CON_ERROR_INVALIDCON

## GtConsoleVar CON OUT V,ERR
Get the console variable.

### ERR
CON is invalid CON_ERROR_INVALIDCON

## GtConsoleVar$ CON OUT V$,ERR
Get the console variable.

### ERR
CON is invalid CON_ERROR_INVALIDCON

## SetProcessConsole PRC,CON OUT ERR
Set the console to the specified process.

### ERR
When PRC is invalid ERROR_NO_PROC
CON is invalid CON_ERROR_INVALIDCON

## GetProcessConsole PRC OUT CON,ERR
Get the console of the specified process.

### ERR
When PRC is invalid ERROR_NO_PROC
CON is invalid CON_ERROR_INVALIDCON
