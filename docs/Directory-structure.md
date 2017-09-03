---
layout: default
title: Directory structure
---
## Directory structure
基本的なディレクトリ構造(draft)

* `/TXT` 現在プロジェクトのTXTファイル
* `/DAT` 現在プロジェクトのDATファイル
* `/home`
  * `/user` ユーザー用
    * `/desktop` ODEのデスクトップ
    * `/programs` メニュー用のリンク置き場
* `/SYS` SYSプロジェクト、書き込めない
  * `/TXT` SYSプロジェクトのTXTファイル
  * `/DAT` SYSプロジェクトのDATファイル
* `/etc` 設定ファイルなどのディレクトリ
* `/usr`
  * `/share` リソースなどを置くディレクトリ
* `/PROJECTS` プロジェクト一覧、プチコンの制限によりファイルを開くことはできない
  * `/[DEFAULT]`
    * `/TXT` TXTファイル
    * `/DAT` DATファイル
* `/dev`
  * `/null`
  * `/zero`
  * `/stdin`
  * `/stdout`
  * `/stderr`
