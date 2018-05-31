---
layout: default
title: FileSystem
---

デフォルトでは"OFS"(階層型ファイルシステム),"SBFS"(プチコンのファイルシステム)が存在し、OFSがルートファイルシステムとなっている。  
mountコマンドを利用してマウントすることができる
```
mount filesystem [data] path
```
`mount SBFS TXT: /TXT`とすると/TXTにTXTファイルのみをマウントできる  
初期状態では

* /
 * /TXT
 * /DAT
 * /home
   * /user

となっている予定

## FileSystem一覧

### DEVFS
/devライクなファイルシステム

#### DATA$
無視される

### OFS
階層型ファイルシステム

#### DATA$
"PROJECT/"などと指定すると指定プロジェクトを利用できる(SMILETOOLのみ)

### SBFS
プチコンファイルシステム

#### DATA$
"TXT:"でカレントプロジェクトのTXT
"DAT:"でカレントプロジェクトのDAT
"TXT:SYS/"でSYSプロジェクトのTXT(読み込みのみ)
"DAT:SYS/"でSYSプロジェクトのDAT(読み込みのみ)
"//"でプロジェクト一覧(SMILETOOL以外ではプロジェクトとそのファイル一覧のみしか取得できない)

# API

## IsSmileTool()
SMILETOOL用のプログラム(COMMON除去版)ならTRUEが返る
それ以外ならFALSE

## NewFileSystem NAME$ OUT FS,ERR
NAME$に紐づけてファイルシステムを作成する
既にNAME$がある場合FS_ERROR_DUPFS
メモリ不足の際FS_ERROR_OUTOFMEM

## FindFileSystem(NAME$)
NAME$からFileSystemを検索  
存在しない場合はCALL "FS_INIT_"+NAME$する

## FSSetFileListHandler(FS,FUNC$)

### 関数の書式
>  DEF FUNC FS,DATA$,PATH$,FILELIST$[] OUT ERR

ファイル一覧が取得される際に呼ばれる
FILELIST$[]にファイルをPUSHする

## 戻り値
FSが不正な時FS_ERROR_INVALIDFS
FUNC$が不正な時FS_ERROR_INVALIDFUNC

## FSSetOpenFileHandler(FS,FUNC$)

### 書式
> DEF FUNC FS,DATA$,PATH$,OPTION$ OUT FILE,ERR

PATH$のファイルが開かれる際に呼ばれる
FILEにファイルERRにエラーを格納する

## 戻り値
FSが不正な時FS_ERROR_INVALIDFS
FUNC$が不正な時FS_ERROR_INVALIDFUNC

## FSSetMountHandler(FS,FUNC$)
Mountされる際に呼ばれる

### 書式
> DEF FUNC FS,DATA$,PATH$,MOUNTFS$,MOUNTDATA$ OUT ERR

未設定時のデフォルト挙動はERRにFS_ERROR_NOTSUPPORTEDを設定する

### 戻り値
FSが不正な時FS_ERROR_INVALIDFS
FUNC$が不正な時FS_ERROR_INVALIDFUNC

## FSSetGetFileSystemHandler(FS,FUNC$)

### 書式
> DEF FUNC FS,DATA$,PATH$ OUT OUTFS,OUTDATA$,OUTPATH$,ERR

未設定時の挙動はPATH$が存在すればERRを0にし、しなければERRに値を設定する  
OUTFSをFSにしてOUTDATA$をDATA$にしてOUTPATH$をPATH$にする

## FSSetNewDirHandler(FS,FUNC$)
1階層のみのディレクトリ作成のハンドラを設定

### 書式
> DEF FUNC FS,DATA$,PATH$ OUT ERR

## FSSetDeleteHandler(FS,FUNC$)
ファイル削除のハンドラを設定

### 書式
> DEF FUNC FS,DATA$,PATH$ OUT ERR

## FSSetRenameHandler(FS,FUNC$)
名前変更ハンドラを設定

### 書式
> DEF FUNC FS,DATA$,PATH$,NEWNAME$ OUT ERR

## FSSetGetTypeHandler(FS,FUNC$)
ファイルタイプ取得ハンドラを設定  

### 書式
> DEF FUNC FS,DATA$,PATH$ OUT TYPE$,ERR

## FSSetGetSBFileHandler(FS,FUNC$)
プチコンでのファイル名を取得

### 書式
> DEF FUNC FS,DATA$,PATH$ OUT FILE$,ERR

FILE$にはプチコンで有効なファイル名(DAT:HOGE.GRP,TXT:HOGE.PRG)

## FSSetSaveDATAFileHandler(FS,FUNC$)
DATAファイルを保存するハンドラを設定

### 書式
> DEF FUNC FS,DATA$,PATH$,ARRAY OUT ERR

## Mount(PATH$,FILESYSTEM$,DATA$)
FILESYSTEM$をPATH$にマウント

## 戻り値
FS_ERROR_NOTFOUND FS_ERROR_NOTSUPPORTED FS_ERROR_ACCESS FS_ERROR_NOSPACE FS_ERROR_CANCEL

# エラー

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

