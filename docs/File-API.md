---
layout: default
title: File API
---
# OTYAX5 File API

## LoadFile PATH$ OUT RESULT$,ERR
PATH$のファイルを開き全文読み込んだものがRESULT$に入る

## SaveFile PATH$,T$ OUT ERR
PATH$のファイルを開きT$を書き込む

## RenameFile PATH$,NEW$ OUT ERR
PATH$のファイルの名前をNEW$にする

## GetCurrentDir$ OUT DIR$
カレントディレクトリを取得

## SetCurrentDir DIR$ OUT ERR
カレントディレクトリを設定

## CombinePath$(BASE$,PATH$)
BASE$とPATH$を結合する

## GetAbsolutePath$(PATH$)
PATH$をカレントディレクトリと結合する

## GetAbsoluteDir$(PATH$)
GetAbsolutePath$(PATH$)をして必ず最後に/を付ける

## GetFiles DIR$ OUT ARY$,ERR
DIR$のファイル一覧を取得(FILES互換)

## NewDir DIR$ OUT ERR
DIR$を作成(一階層のみ)

## Mount DIR$,FS$,DATA$ OUT ERR
DIR$にファイルシステムをマウントする

## DeleteFile PATH$ OUT ERR
PATH$を削除する

## RenameFile PATH$,NAME$ OUT ERR
PATH$のファイル名をNAME$に変更する

## GetFileType PATH$ OUT TYPE$,ERR
ファイルタイプを取得する

|TYPE$|種類|
|---|---|
|" "|DAT|
|"*"|TXT|
|"/"|ディレクトリ|

## GetSBFile PATH$ OUT FILE$,ERR
PATH$のプチコンでのファイル名を取得(DAT:HOGE.GRP,TXT:HOGE.PRG)

## GetHomeDir$()
現在のホームディレクトリを取得

## FileOpen NAME$,FLG OUT FILE,ERR
ファイルを開く  
FLGには以下のものを使用できる

### FileReadFlag() (=1)
読み出し

### FileWriteFlag() (=2)
書き込み

### FileAppendFlag() (=4)
追記

## FileWrite FILE,DAT$ OUT ERR
ファイルにDAT$を書き込む

## FileRead FILE,LEN OUT DAT$,ERR
ファイルからLEN文字分読み込む

## FileClose FILE OUT ERR
ファイルを閉じる

## IsFileEOF(FILE)
ファイルがEOFか確認

## DupFile(FILE)
ファイルを複製

## CheckFile(FILE)
ファイルが正常ならTRUE

## FileSeekCur FILE,LEN OUT ERR
ファイルを現在位置を基準にシークする

## GetFilePos FILE OUT POS,ERR
ファイルの現在位置を取得

## PrintConsole STR$
標準出力に出力

## PrintConsoleln STR$
標準出力に改行コードを加えて出力

## InkeyConsole$(LEN)
標準入力からLEN文字読み込む

# ファイルストリーム作成API

## AllocFile OUT FILE,ERR
ファイルを割り当て

## SetWriter FILE,FUNC$ OUT ERR
ファイルに書き込む際に実行される関数を設定

### 書式
> DEF WRITER FILE,DAT$ OUT ERR

## SetFileData FILE,DAT
ファイルの内部データを設定

## GetFileData(FILE)
ファイルの内部データを取得
エラーの時-1

## SetFileDataStr FILE,DAT$
ファイルの内部文字列を設定

## GetFileDataStr$(FILE)
ファイルの内部文字列を取得
エラーの時空文字

## SetFileName FILE,DAT$
ファイル名を設定

## GetFileName$(FILE)
ファイル名を取得  
エラーの時空文字

## SetFileEOF FILE,EOF
ファイルのEOFフラグを設定

## SetReader FILE,FUNC$ OUT ERR
ファイルから読み込む際に呼ばれる関数の設定

### 書式
> DEF READER FILE,LEN OUT DAT$,ERR

## SetReadln FILE,FUNC$ OUT ERR
ファイルから1行読み込む際に呼ばれる関数を設定

### 書式
> DEF READLN FILE OUT DAT$,ERR

## SetClose FILE,FUNC$ OUT ERR
ファイルが閉じられる際に呼ばれる関数を設定

### 書式
> DEF CLOSE FILE
