---
layout: default
title: OTYAX package manager
---
# OTYAX Package manager
名称未定

* teabag nanasi
* teapack tosuke
* teabucket nanasi
* Qse citringo

とりあえずpmというコマンドであると仮定

```
pm install packagename
インストール
pm uninstall packagename
アンインストール
pm uninstall -f packagename
構成するファイルを削除する
remove(ななし案)
pm upgrade
更新する
pm creare -description hogehoge -depend OTW * -file DAT:XXXX.GRP -program TXT:HOGE
パッケージの生成
```

# ファイル構造
プログラムとパッケージ情報を分ける場合
`pkgname.PKGS`に

|名前|値|
|---|---|
|description|説明|
|depends|依存関係たち|
|files|構成するファイル|
|programs|構成するプログラム|

``` json
{
 "description":"hogehoge",
 "depends":
 [
  {
   "name":"OTW",
   "version":"*"
  }
 ],
 "files":"DAT:XXXX.GRP",
 "programs":"TXT:HOGE"
}
```
