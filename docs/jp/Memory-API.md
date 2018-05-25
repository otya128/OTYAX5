---
layout: default
title: Memory API
---
# Memory API

## NewArray[234]?[#$%]?
配列を作成する。
型を省略した際は整数型となる。

## malloc SIZE OUT PTR
SIZE分メモリを割り当てる。
扱いにくいので効率を求めないのであればSBArrayを利用したほうが良い。

## free PTR
PTRを開放する。
もしPTRが0の場合何もしない。

## GetRawMemory()
mallocに利用する配列を取得する。
PTRが添え字に相当する。

## ReadArray PTR,ARRAY[],POS,LEN
PTRをLEN分POSを起点としてARRAYにコピーする。

## WriteArray PTR,ARRAY[],POS,LEN
PTRにLEN分POSを起点としてARRAYを書き込む。

## WriteInt PTR,VALUE
PTRをVALUEを書き込む。

## ReadInt(PTR)
PTRから整数を読み込む。

# String

## AllocString STR$ OUT PTR
STR$を割り当てる。

## SetString PTR,STR$
PTRにSTR$を割り当てる。

## GetString$(PTR)
PTRに割り当てわれているSTR$を取得。

## FreeString PTR
PTRを開放する。

# Array

## AllocSBArray OUT PTR
プチコン配列を確保する。

## FreeSBArray PTR
PTRを開放する。

## GetSBArray[](PTR)
PTRに割り当てられている配列変数を取得する。

## SetSBArray PTR,ARY[]
PTRに配列変数を割り当てる。
