---
layout: default
title: Misc
---
## FindArray(ARY[],V)
ARYからVを検索し、場所を返す。
見つからなかった際は-1

## ShortToRGB(IN)
プチコン物理色をRGB値に変換する。

## RGBToShort(IN)
RGB値をプチコン物理色に変換する。

## SplitInt IN OUT X,Y
INの上位16bitをYに、下位16bitをXに入れる。

## _BIN$(IN)
INを二進数文字列にする。

## InsertStr$(BASE$,POS,INS$)
BASE$に対してPOSにINS$を挿入する。

## InsertStrB BASE$,POS,IN$
InsertStr$(BASE$,POS,INS$)の破壊的操作版。

## RemoveStr$(THIS$,POS,LEN)
THIS$に対してPOSからLEN文字削除する。

## RemoveStrB THIS$,POS,LEN
RemoveStr$(THIS$,POS,LEN)の破壊的操作版。

## ReplaceStr$(THIS$,STR$,TO$)
THIS$にあるSTR$をTO$に置換する。

## GetFileExtension(FILE$)
FILE$の拡張子を取得する。
何も拡張子がない場合空文字を返す。

## ArrayFill ARY[],V,OFF,LEN
FILLがないプチコンのバージョンにおいてはFORループより効率的にOFFからLEN文字分ARYをVにする。

## Split(STR$,SP$)
STR$をSP$によって分割し配列にして返す。

## ToUpper$(STR$)
STR$をASCII文字の範囲で大文字にする。

## ToUpper STR$
ToUpper$(STR$)の破壊的操作版。

## ToLower$(STR$)
STR$をASCII文字の範囲で小文字にする。

## ToLower STR$
ToLower$(STR$)の破壊的操作版。

## LASTINSTR(S1$,S2$)
S1$に対してS2$を逆方向から探査する。
見つからない場合は-1を返す。
