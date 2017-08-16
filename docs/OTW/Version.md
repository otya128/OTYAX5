---
layout: default
title: OTW version
---

# OTW5.0-2E

## 変更点
* ツールウィンドウ(常にOwner windowより前のウィンドウ)を実装
* WindowToolFlag()
* GetScrollBarWidth()
* GetScrollBarHeight()

# OTW5.0-2D

## 変更点
* 横スクロールバーを実装
* GetHScrollBarControl()
* NewHScrollBar PARENT,SIZ OUT WND.E
* NewHVScrollBar PARENT,SIZH,SIZV OUT WNDH,WNDV,E
* GSAVEImage X,Y,IMG
* ControlParentWindowHandlerを追加
* SetControlParentWindowHandler(CTL,HANDLER$)
* ParentWindowResizeEvent() (=1)
* SetScrollBarAutoResizeMode WND,MODE
* NewImage ARRAY,WIDTH,HEIGHT OUT IMG,EでWIDTHとHEIGHTを逆に設定していた問題を修正
* NewScrollBar系のAPIでSetScrollBarAutoResizeModeするように
* それに従いスクロールバーのリサイズ系のコードを削除
* メニューでチェック出来るようになった
* AddCheckMenuItem MENU,STR$,IVAR,CHECKED
* AddRadioMenuItem MENU,STR$,IVAR,CHECKED
* GetCheckedRadioMenuItem MENU,IVAR OUT IVAR2
* IsCheckedMenuItem(MENU,IVAR)
* GLOADImagePaletteWindow WND,X,Y,IMG,F
* GLOADImagePalette X,Y,IMG,PAL,F
* メニューで子要素があるアイテムをクリックしてもイベントが発生しないようになった
* GetImageWidth(IMG)
* GetImageHeight(IMG)
* GetImageArray IMG OUT ARY,ERR
* MessageBoxError()
 
# OTW5.0-2C

## 変更点
* 高度サウンドユニットを利用した描画の試験実装
* OTYFILでキー入力したときにエラーが出る場合がある問題を修正
* ウィンドウの影の表示タイミングを修正
* OTWTERMで水平タブを扱えるように
* いくつかのアイコン追加
* リッチテキストエディタでテーブルを正常に保存できるように
* リッチテキストエディタでドット単位でのスクロールができるようになった

# OTW5.0-2B
リッチテキストボックスでテーブルを割と扱えるようにした

## 変更点
* RTESetHeading WND,LEVELの改善
* RTEAddTable WND,ROW,COLの追加

# OTW5.0-2A

## 変更点
* Image APIの仕様変更
* NewImage ARRAY,WIDTH,HEIGHT OUT IMG,E
* LoadImage FILE$,W,H OUT IMG,E
* Link fileに画像を指定可能にした
* デスクトップでlink fileに画像が指定されているとき画像を表示するようにした
* GLOADImage X,Y,IMG,Fを追加
* GLOADImageWindow WND,X,Y,IMG,Fを追加
* TextBoxExCut WNDを追加
* RTEClear WNDを追加
* RTEIndent WND,INDENTを追加
* RTESetOrderedList WNDを追加
* RTESetUnorderedList WNDを追加
* RTESetHeading WND,LEVELを追加
* RTECopy WNDを追加
* RTEPaste WNDを追加
* RTECut WNDを追加
* ClipboardSetData$ TYPE$,V$を追加
* ClipboardGetData$ TYPE$ OUT DATA$,CONTAINSを追加
* RTESelectAll WNDを追加


# OTW5.0-29
OTW5.0-28と混ざってる

# OTW5.0-28

## 変更点
* TextBoxExのバグ修正/未実装部分実装
* SetWindowProperty WND,PNAME$,VAL
* SetWindowCursor(WND,X,Y)
* GetWindowCursor WND OUT X,Y,ERR
* 連文節変換IMEがSetWindowCursorに対応
* CalcWindowX(BASEWND,WND)
* CalcWindowY(BASEWND,WND)
* ボタンイベントのリピート処理がうまくいっていなかったので修正
* ListBoxがボタンで項目を選択できるようになった
* RichTextBoxControlの完成度の向上
* SetControlChildWindowHandler
* 連文節変換IMEの変換精度の向上
* OTWCLOCK(アナログ時計)を追加
* FrontWindowでActiveにならなくなった
* HideWindow/ShowWindowで子ウィンドウがあるとうまくいかない問題を修正
* NewWindowのバグを修正
* WindowMinMaxStyle()を追加
* GetWindowStyle(WND)を追加
* Windowの最大化/最小化が可能に
* MaximizeWindow(WND)を追加
* MinimizeWindow(WND)を追加
* GetWindowFrameSize WND OUT W1,H1,W2,H2,ERRを追加
* RTENew RTE
* RTEOpen RTE,FILE$ OUT ERR
* RTESave RTE,FILE$ OUT ERR

# OTW5.0-27

## 変更点
* メニューが画面からはみ出さなくなった
* AddSubMenuItem MENU,ITEM$,SUBMENU
* DeleteWindowでウィンドウグループ周りの未実装部分を実装
* NewWindowでChFocusイベントが発生するようになった
* 連文節変換IME作った

# OTW5.0-26

## 変更点
* IM APIを実装
* CheckIM(IM)
* SetIMKeyHandler(IM,FUNC$)
* SetIMDeleteHandler(IM,FUNC$)
* DeleteIM(IM)
* NewIM OUT IM,ERR
* ProcessIM(IM)
* SendIMText(IM,TEXT$)
* ClearListBox WND
* GetSelectionColor()
* GetSelectionTextColor()
* OTWTERMを追加
* TSKBARを改善
* ファイラとファイルダイアログが多階層ファイルシステムに対応
* ODE(O Desktop Environment)を追加
* ExecFile(FILE$)
* AssociateFile(TYP$,EXT$,NAME$)のTYP$引数が"TXT"/"DAT"ではなく" ","*","/"を受け取るようになった
* GetAssociateProgram$(TYP$,EXT$)のTYP$引数が"TXT"/"DAT"ではなく" ","*","/"を受け取るようになった
* ファイラでコマンドラインからディレクトリを指定できるようになった
* MoveResizeWindowで正常に再描画できていなかった問題を修正

# OTW5.0-25

## 変更点
* OTYMINEを作成
* メニューを作りアイテムを何も加えないとおかしくなる問題を修正
* MessageBox APIを実装
* MessageBoxOK()
* CalcTextSize TEXT$ OUT W,H
* MessageBoxNotifID()
* MessageBoxNotifOK()
* MessageBoxNotifCancel()
* MessageBox(WND,TITLE$,TEXT$,FLAG)
* CREATEOTWのインデント修正
* PRUNでプログラムの一時中断機能を試験実装
* OTYMINEを追加

# OTW5.0-24

## 変更点
* ウィンドウを画面の下に移動させると描画がおかしくなる問題を修正?

# OTW5.0-23

## 変更点
* GBeginDirect(WND)
* GEndDirect(WND,X1,Y1,X2,Y2,X3,Y3,MODE)
* GCopyDirect(WND,X1,Y1,X2,Y2,X3,Y3,MODE)
* SetControlFrameHandlerを追加
* IM APIの初期化を実装
* Image APIをOTYAXの新API AllocSBArrayをベースに変更
* LoadGRPImage FIL$ OUT IMG,Eを実装
* 必要な部分だけ再描画できるように
* RepaintFrameWindow(WND)
* RepaintWindowWithARect(WND,AX,AY,AX2,AY2)
* ファンクションキー1番でキーボードの無効有効を切り替えられるように
* TextBoxExでウィンドウが削除されたときにメモリを開放するように
* OTYFILでキーを入力したときにその文字が先頭にあるファイルにカーソルが移動するように
* PRUNの状態保存の方式を省メモリな実装に
* IMGVIEWが実装途中

## TODO
* [ ] TextBoxExの未実装機能実装
* [ ] RichTextBoxでとりあえずまともなTextEditorとして機能させたい

# OTW5.0-22

## 変更点
* OTYFILを作り直した
* OTYFILのOpen,Delete,Renameを実装
* ファイル関連付けの実装
* ファイルをコピー出来るような実装を一応した
* EditorSelectorの実装

## TODO
* [X] OTYFILの作り直し
* [X] ファイル関連付けの実装

# OTW5.0-21
OTW-R5

## 変更点
```
 PAINTで遊んだまま未修正
 MoveWindowで間違えてOTW_DrawMapを二度呼んでいる
 TextBoxExで選択コピー貼り付け実装
 ClipBook Viewer追加
 LauncherでListBoxを使用し、リサイズにも対応
 ListBoxがリサイズに対応
```
修正

+ AddMenuItemSeparator MENU実装
+ メニューで特定条件の時選択されても描画が更新されなかった問題を修正
+ メニューの外見を立体的にした
+ 影付きウィンドウを実装(OTW_ENABLE_SHADOW)
 + SetWindowOption("ENABLE_SHADOW",TRUE)実装したい
  + CALL "WinOptSet"+"ENABLE_SHADOW",TRUEのような実装
+ コンテキストメニューの実装
+ スクロールバーで稀に0除算エラーが出る問題をとりあえず修正
+ スクロールバーのサイズを変更するとはみ出た場合は自動で修正されるようになった

|関数|説明|
|---|---|
|ShowContextMenu MENU,WND|コンテキストメニューを表示|

## マウスイベントの変更点
LMouseUPイベントがアクティブウィンドウではなくマウス下にあるウィンドウに対して送られるようになった
前のようにするにはSetCapture(WND)をする必要がある

# OTW5.0-20

## 変更点
タスクバー(TSKBAR)をとりあえず見た目だけ作った
NewMenuでメニューを割り当てられない時にエラーMENU_NOALLOCを出すように

### 追加しかけ
+ DROPDOWNLIST

## 追加

|関数|説明|
|---|---|
|ShowWindow(WND)||
|HideWindow(WND)||

```
 OTW5.0-1E
 TODO:
 SetWindowVisible WND,FLG
 GetWindowVisible(WND)
```

忘れている

|関数|説明|
|---|---|
|GetBackColor()|色コード|
|SetButtonAlignLeft WND||
|SetButtonAlignRight WND||
|SetButtonAlignCenter WND||

## バグ
PAINTで遊んだまま未修正
MoveWindowで間違えてOTW_DrawMapを二度呼んでいる

# OTW5.0-1F

## 変更点
OTYDOCのバグ修正
斜体描画をさらに高速化,向きを修正
描画の始点を変更可能にする準備

## 追加
GCOPYWindow

# OTW5.0-1E
放置してたら結構バージョン進んでた

## 変更点
OTYDOCのバグ修正

OTYDOCがまともに使えるようになった

GetWindowX(WND)	

GetWindowY(WND)

が絶対座標を返していた問題を修正

常に非表示のウィンドウが生成可能に

## 追加
NumUpDownコントロール(spin box,spinner)
WindowHideFlag()
WindowHideStyle()
TODO:
SetWindowVisible WND,FLG
GetWindowVisible(WND)

# OTW5.0-19

## 追加
+ メニュー
+ ウィンドウグループ
+ ダイアログ
+ ControlCreateHandler

### Menu

|関数|説明|
|---|---|
|NewMenu OUT MENU,E||
|SetMenuBar WND,MENU|未実装|
|ShowMenu MENU,WND|未実装,引数の順番が定まっていない|
|GetWindowMenu(WND)||
|AddMenuItem MENU,STR$,IVAR||
|AddMenuItemSeparator MENU||
|CheckMenu(MENU)||
|NewTopLevelMenuWindow CTL,NAME$,WIDTH,HEIGHT OUT WND,ERR||

### Window Group

|関数|説明|
|---|---|
|JoinWindowGroup(WND,WND2)||
|LeaveWindowGroup WND|未実装|
|GetWindowGroupOwner(WND)||

### Dialog

|関数|説明|
|---|---|
|NewDialogBox(CTL,NAME$,WIDTH,HEIGHT,OWNER,FLAG)||
|NewModalDialogBox(CTL,NAME$,WIDTH,HEIGHT,OWNER)||
|NewModelessDialogBox(CTL,NAME$,WIDTH,HEIGHT,OWNER)||

### Event

|関数|説明|
|---|---|
|SetControlCreateHandler(CTL,HANDLER$)||

## 修正
ウィンドウの座標が-の時にエラーが出るのを不完全に修正(子ウィンドウを所持しているとエラー)

# OTW5.0-18

## 追加
OTYFILにスクロールバーを追加

|関数|説明|
|---|---|
|GetVScrollBarControl()|縦スクロールバーコントロールを取得|
|NewVScrollBar PARENT,SIZ OUT WND,E||
|SetScrollBarSize WND,SIZ||
|SetScrollBarPostion WND,POS|->Position| 
|GetWindowX(WND)||
|GetWindowY(WND)||
|GetNextWindow(WND)||
|GetPrevWindow(WND)||
|GetParentWindow(WND)||
|GetChildWindow(WND)||

### WindowOP
ウィンドウに対しての操作を効率化する
子ウィンドウを一々削除していたら再描画リクエストが一々確認されたりして非常に遅い
それをEndWindowOPでまとめてやる

|関数|説明|
|---|---|
|BeginWindowOP(WND)||
|EndWindowOP(WND)||
|MoveWindow2(WND,X,Y)|->MoveWindowOP(WND,X,Y)|

## ToDo
+ OTYFILでファイルを開けるように
+ 横スクロールバー
+ スクロールバーの移動をボタン以外で出来るように
+ MOUSEMOVEでの移動が範囲外でもクリックしている場合は取得出来るように
+ メニューの実装
