---
layout: default
title: File API
---
# OTYAX5 File API

## LoadFile PATH$ OUT RESULT$,ERR
Open the file of PATH$ and read the full text into RESULT$

## SaveFile PATH$,T$ OUT ERR
Open the file PATH$ and write T$

## RenameFile PATH$,NEW$ OUT ERR
Make the file name of PATH$ NEW$

## GetCurrentDir$ OUT DIR$
Get current directory

## SetCurrentDir DIR$ OUT ERR
Set the current directory

## CombinePath$(BASE$,PATH$)
Combine BASE$ and PATH$

## GetAbsolutePath$(PATH$)
Combine PATH$ with the current directory

## GetAbsoluteDir$(PATH$)
Make GetAbsolutePath$(PATH$) and always add / at the end

## GetFiles DIR$ OUT ARY$,ERR
Get the file list of DIR$ (FILES compatible)

## NewDir DIR$ OUT ERR
Create DIR$ (one level only)

## Mount DIR$,FS$,DATA$ OUT ERR
Mount the file system to DIR$

## DeleteFile PATH$ OUT ERR
Delete PATH$

## RenameFile PATH$,NAME$ OUT ERR
Change the file name of PATH$ to NAME$

## GetFileType PATH$ OUT TYPE$,ERR
Get file type

|TYPE$|Type|
|---|---|
|" "|DAT|
|"*"|TXT|
|"/"|Directory|

## GetSBFile PATH$ OUT FILE$,ERR
Acquire the filename of PATH$ in PATH$
(DAT:HOGE.GRP,TXT:HOGE.PRG)

## SaveDATAFile PATH$,ARRAY OUT ERR
Save ARRAY in PATH$

## GetHomeDir$()
Get the current home directory

## FileOpen NAME$,FLG OUT FILE,ERR
Open the file  
The following can be used for FLG

### FileReadFlag() (=1)
reading

### FileWriteFlag() (=2)
writing

### FileAppendFlag() (=4)
appending

### FileCreateFlag() (=8)
creating

## FileWrite FILE,DAT$ OUT ERR
Write DAT$ to the file

## FileRead FILE,LEN OUT DAT$,ERR
Read LEN characters from file

## FileClose FILE OUT ERR
Close the file

## IsFileEOF(FILE)
Check if the file is EOF

## DupFile(FILE)
Duplicate the file

## CheckFile(FILE)
TRUE if the file is normal

## FileSeekCur FILE,LEN OUT ERR
Seel file based on current position

## GetFilePos FILE OUT POS,ERR
Get current file position

## PrintConsole STR$
Output to standard output

## PrintConsoleln STR$
Output by adding a line feed code to standard output

## InkeyConsole$(LEN)
Read LEN characters from standard input

# File stream creation API

## AllocFile OUT FILE,ERR
Allocate files

## SetWriter FILE,FUNC$ OUT ERR
Set function to be executed when writing to file

### Format
> DEF WRITER FILE,DAT$ OUT ERR

## SetFileData FILE,DAT
Set internal data of file

## GetFileData(FILE)
Retrieve internal data of file
On error -1

## SetFileDataStr FILE,DAT$
Set internal string of file

## GetFileDataStr$(FILE)
Get internal string of file
Space-time character of error

## SetFileName FILE,DAT$
Set file name

## GetFileName$(FILE)
Get file name
Space-time character of error

## SetFileEOF FILE,EOF
Set EOF flag of file

## SetReader FILE,FUNC$ OUT ERR
Setting function called when reading from file

### Format
> DEF READER FILE,LEN OUT DAT$,ERR

## SetReadln FILE,FUNC$ OUT ERR
Set function called when reading one line from file

### Format
> DEF READLN FILE OUT DAT$,ERR

## SetClose FILE,FUNC$ OUT ERR
Set function called when file is closed

### Format
> DEF CLOSE FILE
