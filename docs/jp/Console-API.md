---
layout: default
title: Console API
---
# Console API
コンソールを叩くAPI。
初期状態ではプチコンのコンソール画面に出力させるConsoleが設定されている。
コンソールは子プロセスに引き継がれる。

## SetConsole CON
現在のプロセスのコンソールを設定する。

## GetConsole CON
現在のプロセスのコンソールを取得する。

## PutConsole CON,BUF$ OUT ERR
コンソールにBUF$を出力

## ReadConsole CON,LEN OUT BUF$,ERR
コンソールからLEN文字読み取る。LEN文字読み取れない場合は待機せずにそのままRETURNする。

## GetConsoleSize CON OUT W,H,ERR
コンソールサイズを取得する。

## GetConsoleCursor CON OUT X,Y,ERR
コンソールのカーソル位置を取得する。

## SetConsoleCursor CON,X,Y OUT ERR
コンソールのカーソル位置を設定する。

## GetConsoleForeColor CON OUT C,ERR
コンソール文字前景色を取得する。

## SetConsoleForeColor CON,C OUT ERR
コンソール文字前景色を設定する。

## GetConsoleBackColor CON OUT C,ERR
コンソール文字背景色を取得する。

## SetConsoleBackColor CON,C OUT ERR
コンソール文字背景色を設定する。

## NewConsole OUT CON,ERR
コンソールを作成する。

## DupConsole CON OUT ERR,CON2
コンソールを複製する。

### ERR
CONが不正な時CON_ERROR_INVALIDCON、NewConsoleに出るエラーを引き継ぐ

## CheckConsole(CON)
CONが不正な値かどうか確認する。正常ならTRUE、不正ならFALSE。

##  DeleteConsole CON OUT ERR
コンソールを破棄する。

### ERR
CONが不正な時CON_ERROR_INVALIDCON

## SetGetConsoleSizeHandler(CON,FUNC$)
コンソールのサイズを取得するハンドラを設定する。

### ERR
FUNC$が不正な時CON_ERROR_INVALIDFUNC  
CONが不正な時CON_ERROR_INVALIDCON  

## SetPutConsoleHandler(CON,FUNC$)
コンソールに出力するハンドラを設定する。

## SetReadConsoleHandler(CON,FUNC$)
コンソールからの入力を取得するハンドラを設定する。

## SetGetConsoleCursorHandler(CON,FUNC$)
コンソールのカーソル位置を取得するハンドラを設定する。

## SetSetConsoleCursorHandler(CON,FUNC$)
コンソールのカーソル位置を設定するハンドラを設定する。

## SetGetConsoleBackHandler(CON,FUNC$)
コンソール文字背景色を取得するハンドラを設定する。

## SetSetConsoleBackHandler(CON,FUNC$)
コンソール文字背景色を設定するハンドラを設定する。

## SetGetConsoleForeHandler(CON,FUNC$)
コンソール文字前景色を取得するハンドラを設定する。

## SetSetConsoleForeHandler(CON,FUNC$)
コンソール文字前景色を設定するハンドラを設定する。

## SetConsoleVar CON,V OUT ERR
コンソール変数を設定する。

### ERR
CONが不正な時CON_ERROR_INVALIDCON

## SetConsoleVar$ CON,V$ OUT ERR
コンソール変数を設定する。

### ERR
CONが不正な時CON_ERROR_INVALIDCON

## GtConsoleVar CON OUT V,ERR
コンソール変数を取得する。

### ERR
CONが不正な時CON_ERROR_INVALIDCON

## GtConsoleVar$ CON OUT V$,ERR
コンソール変数を取得する。

### ERR
CONが不正な時CON_ERROR_INVALIDCON

## SetProcessConsole PRC,CON OUT ERR
コンソールを指定プロセスに設定する。

### ERR
PRCが不正な時ERROR_NO_PROC  
CONが不正な時CON_ERROR_INVALIDCON

## GetProcessConsole PRC OUT CON,ERR
指定プロセスのコンソールを取得する。

### ERR
PRCが不正な時ERROR_NO_PROC  
CONが不正な時CON_ERROR_INVALIDCON
