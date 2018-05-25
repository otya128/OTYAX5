---
layout: default
title: FileSystem
---

By default, "OFS" (hierarchical file system), "SBFS" (Petit computer file system) exist, OFS is the root file system.
You can mount using the mount command
```
mount filesystem [data] path
```
`mount SBFS TXT: / TXT` allows you to mount only TXT files in / TXT
In the initial state

* /
 * /TXT
 * /DAT
 * /home
   * /user

It is scheduled to be

# API

## NewFileSystem NAME$ OUT FS,ERR
Create a file system based on NAME$
If NAME$ already exists FS_ERROR_DUPFS
When memory is insufficient FS_ERROR_OUTOFMEM

## FindFileSystem(NAME$)
Search FileSystem for NAME$
If it does not exist, CALL "FS_INIT_"+NAME$

## FSSetFileListHandler(FS,FUNC$)

### Function format
>  DEF FUNC FS,DATA$,PATH$,FILELIST$[] OUT ERR

Called when file list is acquired
PUSH the file to FILELIST$[]

## Return value
When FS is invalid FS_ERROR_INVALIDFS
When FUNC$ is invalid FS_ERROR_INVALIDFUNC

## FSSetOpenFileHandler(FS,FUNC$)

### Format
> DEF FUNC FS,DATA$,PATH$,OPTION$ OUT FILE,ERR

Called when a PATH$ file is opened
Store error in file ERR in FILE

## Return value
When FS is invalid FS_ERROR_INVALIDFS
When FUNC $ is invalid FS_ERROR_INVALIDFUNC

## FSSetMountHandler(FS,FUNC$)
Called to be Mount

### Format
> DEF FUNC FS,DATA$,PATH$,MOUNTFS$,MOUNTDATA$ OUT ERR

Default behavior when not set is FS_ERROR_NOTSUPPORTED in ERR

### Return value
When FS is invalid FS_ERROR_INVALIDFS
When FUNC $ is invalid FS_ERROR_INVALIDFUNC

## FSSetGetFileSystemHandler(FS,FUNC$)

### Format
> DEF FUNC FS,DATA$,PATH$ OUT OUTFS,OUTDATA$,OUTPATH$,ERR

Behavior at the time of unsetting sets ERR to 0 if PATH$ exists, and sets a value in ERR if not
Let OUTFS be FS and set OUTDATA$ to DATA$ and set OUTPATH$ to PATH$

## FSSetNewDirHandler(FS,FUNC$)
Set handler for directory creation for only one hierarchy

### Format
> DEF FUNC FS,DATA$,PATH$ OUT ERR

## FSSetDeleteHandler(FS,FUNC$)
Set handler for file deletion

### Format
> DEF FUNC FS,DATA$,PATH$ OUT ERR

## FSSetRenameHandler(FS,FUNC$)
Set name change handler

### Format
> DEF FUNC FS,DATA$,PATH$,NEWNAME$ OUT ERR

## FSSetGetTypeHandler(FS,FUNC$)
Set file type acquisition handler

### Format
> DEF FUNC FS,DATA$,PATH$ OUT TYPE$,ERR

## FSSetGetSBFileHandler(FS,FUNC$)
Get filename in PetitCon

### Format
> DEF FUNC FS,DATA$,PATH$ OUT FILE$,ERR

FILE$ is a valid filename for PetitCon(DAT:HOGE.GRP,TXT:HOGE.PRG)

## FSSetSaveDATAFileHandler(FS,FUNC$)
Set handler to save DATA file

### Format
> DEF FUNC FS,DATA$,PATH$,ARRAY OUT ERR

## Mount(PATH$,FILESYSTEM$,DATA$)
Mount FILESYSTEM$ at PATH$

## Return value
FS_ERROR_NOTFOUND FS_ERROR_NOTSUPPORTED FS_ERROR_ACCESS FS_ERROR_NOSPACE FS_ERROR_CANCEL

# Error

## FS_ERROR_NOTFOUND
0x6001

## FS_ERROR_NOTSUPPORTED
0x6002

## FS_ERROR_ACCESS

## FS_ERROR_NOSPACE

## FS_ERROR_CANCEL

## FS_ERROR_INVALIDFS

## FS_ERROR_DUPFS

## FS_ERROR_OUTOFMEM

## FS_ERROR_INVALIDFUNC

