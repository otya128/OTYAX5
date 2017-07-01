---
layout: default
title: Process API
---
# OTYAX5 Process API

## NewProcess NAME$,ARGS$ OUT PRC,ERR
プロセスNAME$をARGS$を引数として起動する。

## SetProcessVar DAT
プロセスの局所記憶変数を設定する。

## GetProcessVar()
プロセスの局所記憶変数を取得する。

## CheckProcess(PRC)
PRCが正常なプロセスかどうか調べる。

## GetProcessArgs$()
現在のプロセスの引数を取得する。

##  GetSTDIN OUT FILE
標準入力のファイルを取得する。

##  GetSTDOUT OUT FILE
標準出力のファイルを取得する。

##  GetSTDERR OUT FILE
標準エラー出力のファイルを取得する。

## SetProcessSTDIN PRC,FILE
PRCの標準入力のファイルを設定する

## SetProcessSTDOUT PRC,FILE
PRCの標準出力のファイルを設定する

## SetProcessSTDERR PRC,FILE
PRCの標準エラー出力のファイルを設定する

##  GetProcessSTDIN PRC OUT FILE
PRCの標準入力のファイルを取得する。

##  GetProcessSTDOUT PRC OUT FILE
PRCの標準出力のファイルを取得する。

##  GetProcessSTDERR PRC OUT FILE
PRCの標準エラー出力のファイルを取得する。

## GetPID()
現在のPIDを取得する。

## ExitProcess RESULT
現在のプロセスを終了する。

## KillProcess PRC OUT ERR
PRCを終了させる。

## ExecCommand LINE$ OUT PRC,ERR
コマンドを実行する。
```
name args [> filename] [< filename] | ...
```

## GetCommandArgsWithoutName$(ARGS$)
ARGS$から第一引数を抜いたものを取得する。

## GetCommandArg ARGS$,I OUT CMD$,INDEX
ARGS$からIを起点として引数をCMD$として取得する。
INDEXには引数が終了した場所が入る。

## CommandArgsToArray ARY$[],EXPAND OUT LEN
現在のプロセスの引数をARY$に書き込む。
EXPANDをTRUEにすると配列の要素が足りなかった際に拡張するようになる。
LENに引数数が入る。

## HasChildProcess(PRC)
PRCが子プロセスを持っていたらTRUE

## GetProcessTime(PRC)
PRCが使った時間(ms)

## GetProcessElapsedTime(PRC)
PRCが起動してからの時間(ms)
