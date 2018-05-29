---
layout: default
title: OTW Input Method API
---
# Input Method API
とりあえずローマ字変換と~~KANJITBLを使っただけの軽量単漢字変換を実装~~
連文節変換IME作ったのでそれ使う

```bas
 '一括変換
 OTY_KANATOKANJI INPUT$ OUT BUNSETSU$[]
```

## API

とりあえず実装された

|Function|Description|
|---|---|
|SetWindowCursor(WND,X,Y)|カーソル位置を設定(コンポジションウィンドウの位置)|
|GetWindowCursor WND OUT X,Y,ERR|カーソル位置を取得、設定されていない場合はERRが0以外の値になる|
|CheckIM(IM)|IMが正常かどうか|
|SetIMKeyHandler(IM,FUNC$)|キーハンドラを設定|
|SetIMDeleteHandler(IM,FUNC$)|削除ハンドラを設定|
|DeleteIM(IM)|IMを削除|
|NewIM OUT IM,ERR|IMを作成|
|ProcessIM(IM)|IMのイベントを処理|
|SendIMText(IM,TEXT$)|IMに文字列を送信|

## KeyHandler
`DEF handler IM,KEY`
KEYを受け取る

## Sample

```BAS
DEF TESTIM_KEY IM,KEY
 SendIMKey IM,CHR$(KEY)
END
DEF I_TESTIM
 VAR IM,ERR
 NewIM "TESTIM_KEY" OUT IM,ERR
 IF ERR THEN
  ExitProcess 1
  RETURN
 ENDIF
END
DEF L_TESTIM
END
```

キーを受け取って返すだけのIM
