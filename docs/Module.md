---
layout: default
title: Module
---

## Module system
loadmodコマンドを使うとモジュールを読み込むことができる。


`loadmod -e path`で実行と読み込み

`loadmod path`で読み込みのみ

## API

### LoadModule FILE$ OUT ENTRYPOINT$,ERR
FILE$のモジュールを読み込む。
ENTRYPOINT$にはプロセス名が入る(なければ空文字)

### ExecModule FILE$ OUT PRC,ERR
FILE$のモジュールを読み込み実行する。

## Module File
SMILEBASICで実行できる内容。
最初にあるI_HOGEがENTRYPOINTになる。
プチコンのエラー防止のため配列は一回初期化されるので注意。
パースコスト軽減のため、変数宣言/関数宣言は行頭に置かないと認識されないのでほかにモジュールを読み込んだ時に変数が初期化されるので注意。
