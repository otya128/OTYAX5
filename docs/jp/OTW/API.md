---
layout: default
title: OTYA WINDOW SYSTEM(OTW)
---
# OTYA WINDOW SYSTEM(OTW)
開発中
(OTW5.0)
ボタンもテキストボックスもみんなウィンドウ
定数は基本的に関数を使って取得する

## Control

### GetWindowControl()
Windowのコントロールを取得

### NewControl NAME$ OUT CTL,ERR
新しいコントロールを作る

### ExtendControl NAME$,PARENT OUT CTL,ERR
既存のコントロール(Windowなど)を継承

### CheckControl(CTL)
コントロールが正常かを確認

### DeleteControl(CTL)
コントロールを削除

### FindControl(NAME$)
文字列を使ってコントロールを取得

### IsControlExtend(CTL,PARENT)
CTLコントロールとPARENTコントロールが継承関係にあるかどうか

### GetControlName$(CTL)
コントロールの名前を取得


### Handler
Handlerの書式
COMMONは付ける

`` COMMON DEF XXX WND,CTL,TYPE,A1,A2``

|関数|説明|引数1|引数2|
|---|---|---|---|
|SetControlPainter(CTL,HANDLER$)|コントロールの描画イベントを処理する関数の登録|描画範囲XY|描画範囲WH(XY=0&&WH=0のとき全体)|
|SetControlLMouseUpHandler(CTL,HANDLER$)|左クリック(ボタンから離されたとき)のイベントを処理する関数の登録|X|Y|
|SetControlLMouseDownHandler(CTL,HANDLER$)|左クリック(ボタンが押されたとき)のイベントを処理する関数の登録|X|Y|
|SetControlMouseMoveHandler(CTL,HANDLER$)|マウスが移動したときのイベントを処理する関数の登録|XY|マウスの状態|
|SetControlNotificationHandler(CTL,HANDLER$)|通知(ボタンがクリックされた、Enterが押された)など|~~そのウィンドウのVar0~~そのウィンドウのWND||
|SetControlNotifHandler(CTL,HANDLER$)|=SetControlNotificationHandler|||
|SetControlKeyHandler(CTL,HANDLER$)|キーが押されたとき|BUTTON()から特殊キーを覗いた値||
|SetControlChFocusHandler(CTL,HANDLER$)|フォーカスが変わった時|フォーカスが移ったらTRUE||
|SetControlButtonHandler(CTL,HANDLER$)|ボタンが押されたとき|||
|SetControlCreateHandler(CTL,HANDLER$)|ウィンドウが作られたとき|||
|SetControlStrNotifHandler(CTL,HANDLER$)|文字列の通知(FileDialog等)|||
|SetControlDeleteHandler(CTL,HANDLER$)|ウィンドウが削除されたとき|||
|SetControlLDoubleClickHandler(CTL,HANDLER$)|左ダブルクリックをされたとき|||
|SetControlMouseLeaveHandler(CTL,HANDLER$)|マウスが離れた時|||
|SetControlResizeHandler(CTL,HANDLER$)|ウィンドウがリサイズされたとき||WH|
|SetControlFrameHandler(CTL,HANDLER$)|ウィンドウフレーム周りのなんか|||
|SetControlFramePainter(CTL,HANDLER$)|ウィンドウフレームの描画|||
|SetControlChildWindowHandler(CTL,HANDLER$)|子ウィンドウから送られてくるイベントを受信|type|arg|
|SetControlParentWindowHandler(CTL,HANDLER$)|親ウィンドウから送られてくるイベントを受信|type|arg|
|SetControlQueryFrameHandler(CTL,HANDLER$)|ウィンドウのフレームの大きさを返す|STYLE|0|

### 特殊Event Handler
#### ControlStrNotifHandler
A2$が文字列
```
COMMON DEF XXX WND,CTL,TYPE,A1,A2$
END
```

#### ControlQueryFrameHandler

WNDは0の場合があるので注意

```
COMMON DEF XXX WND,CTL,TYPE,STYLE,ZERO OUT W1,H1,W2,H2
END
```

### ControlChildWindowHandler
子ウィンドウに何か起こった時に呼ばれる
A1がtype

#### type:WindowMaximizeEvent()
ウィンドウが最大化されようとしたときに送られる(OTW30からWND自身の最大化イベントが送られてくるようになった)  

argに対象ウィンドウ  
rootウィンドウ

#### type:WindowMinimizevent()
ウィンドウが最小化されようとしたときに送られる(OTW30からWND自身の最大化イベントも送られてくるようになった)  
argに対象ウィンドウ

#### type:WindowActiveEvent()
ウィンドウがアクティブになったときに送られる
argに対象ウィンドウ

#### type:WindowInactiveEvent()
ウィンドウが非アクティブになったときに送られる
argに対象ウィンドウ

#### type:WindowRestoreEvent()
ウィンドウが最小化最大化から戻されようとしたときに送られる(OTW30からWND自身の最大化イベントが送られてくるようになった)  

argに対象ウィンドウ

### ControlParentWindowHandler
親ウィンドウに何か起こったときに呼ばれる
A1がtype

#### type:ParentWindowResizeEvent()
ウィンドウがリサイズされたときに呼ばれる

### マウスの状態
```
   10
 0b00
 bit 0CTL_LBTNFLG
 bit 1CTL_RBTNFLG
```
1なら左クリック,2なら右クリック,3なら両方
```bas
 IF BTN AND GetControlStateLBtn()THEN ~左クリック
 IF BTN AND GetControlStateRBtn()THEN ~右クリック
```

## Window

### GetRootWindow()
ルートウィンドウを取得

### CheckWindow(WND)
ウィンドウが正常ならTRUE

### WindowBackFlag()
NewWindowで指定するフラグ, ウィンドウを後ろに配置する

### WindowFrontFlag()
NewWindowで指定するフラグ, ウィンドウを前に配置する

### WindowHideFlag()
NewWindowで指定するフラグ, ウィンドウを非表示にする

### WindowToolFlag()
NewWindowで指定するフラグ, ウィンドウを常にOwner windowより前に表示にする

### NewWindow CTL,NAME$,X,Y,WIDTH,HEIGHT,PARENT,FLG OUT WND,ERR
コントロールと名前と座標とサイズと親ウィンドウとフラグを使ってウィンドウを作成

### NewTopLevelWindow CTL,NAME$,WIDTH,HEIGHT OUT WND,ERR
コントロールと名前とサイズを使ってウィンドウを作成

### NewStyleWindowArg CTL,NAME$,X,Y,WIDTH,HEIGHT,PARENT,FLG,STYLE,A1,A2
引数を使ってスタイル指定されたウィンドウ作成

### NewStyleWindow CTL,NAME$,X,Y,WIDTH,HEIGHT,PARENT,FLG,STYLE
スタイル指定されたウィンドウ作成

### NewTopLevelStyleWindowArg CTL,NAME$,WIDTH,HEIGHT,FLG,STYLE,A1,A2
引数を使ってスタイル指定されたトップレベルウィンドウ作成

### NewTopLevelStyleWindow CTL,NAME$,WIDTH,HEIGHT,FLG,STYLE
スタイル指定されたトップレベルウィンドウ作成

### WindowMenuStyle()
メニュー付きにさせるフラグ

### WindowResizableStyle()
リサイズ可能にさせるフラグ

### WindowHideStyle()
非表示にさせるフラグ

### WindowNarrowStyle()
タイトルバーの幅を小さくさせるフラグ

### WindowTopMostStyle()
常に最前面に表示させるフラグ

### FrontWindow(WND)
ウィンドウを手前に持ってくる

### MoveWindow(WND,X,Y)
ウィンドウを指定座標に持っていく

### ResizeWindow(WND,W,H)
ウィンドウをリサイズ

### MoveResizeWindow(WND,W,H)
ウィンドウを移動してリサイズ

### SendWindowEvent(WND,TYPE,A1,A2)
ウィンドウへイベントを送信

### RepaintWindow(WND)
ウィンドウへ再描画イベントを送信

### RepaintFrameWindow(WND)
ウィンドウのフレーム部分への再描画イベントを送信

### CallBaseControlHandler(WND,CTL,TYPE,A1,A2)
(イベントのハンドラーで)親ハンドラを呼び出し

### PeekWindowEvent(WND)->OUT CTL,TYPE,A1,A2
ウィンドウのイベントキューの先頭を削除せずに帰す

### UpdateWindow(WND)
ウィンドウのイベントを処理

### GetWindowName$(WND)
ウィンドウの名前を取得

### GetWindowWidth(WND)
ウィンドウの幅を取得

### GetWindowHeight(WND)
ウィンドウの高さを取得

### GetWindowSize WND,FRM OUT W,H,E
ウィンドウの大きさを取得
FRM=TRUEの時フレームの大きさを含んでいる

### GetWinVer$()
バージョンを取得("5.0"など)

### GetWindowX(WND)
ウィンドウのX座標を取得

### GetWindowY(WND)
ウィンドウのY座標を取得

### GetNextWindow(WND)
次のウィンドウ(前面)を取得,失敗したら0が返る

### GetPrevWindow(WND)
次のウィンドウ(後面)を取得,失敗したら0が返る

### GetParentWindow(WND)
親ウィンドウを取得

### GetChildWindow(WND)
子ウィンドウを取得(一番後ろ)

### GetControl(WND)
ウィンドウのコントロールを取得

### IsFocusWindow(WND)
ウィンドウがフォーカスされていればTRUE

### IsActiveWindow(WND)
ウィンドウがアクティブであればTRUE

### ShowWindow(WND)
非表示ウィンドウを表示させる

### HideWindow(WND)
ウィンドウを非表示にする(bug?)

### SetWindowBackColor WND,RGB
ウィンドウの背景色を設定

### SetWindowBackColor(WND)
ウィンドウの背景色を取得

### GetBackColor()
ウィンドウのデフォルト背景色を取得

### GetSelectionColor()
選択時の背景色を取得

### GetSelectionTextColor()
選択時のテキスト色を取得

### GetWorkspaceColor()
作業領域背景色を取得

### GetWindowMinSize WND OUT W,H
ウィンドウの最小サイズを取得(リサイズ用)

### SetWindowMinSize WND,W,H
ウィンドウの最小サイズを設定(リサイズ用)

### SetCapture(WND)
WNDに対してマウスキャプチャを開始,MouseMoveイベントが全てWNDに対して送られるようになる。但しマウスをクリックすると解除.返り値は前にキャプチャされたウィンドウ

### GetCapture()
現在マウスキャプチャされているウィンドウを取得

### ReleaseCapture(WND)
WNDに対してのマウスキャプチャを終了,失敗すると0、成功すると1が返る

### SetCaptureEx(WND,FRM)
FRM=TRUEの時ウィンドウフレームに対してキャプチャ

### GetCaptureEx OUT WND,FRM
FRM=TRUEの時ウィンドウフレームに対してキャプチャ

### SetSysWindowProperty WND,PNAME$,VAL OUT ERR
実装依存のプロパティ設定、OTW5.0-28では"SHADOW"を指定すると影の有無を切り替えられる

### CalcWindowX(BASEWND,WND)
BASEWNDに対するWNDの位置を取得

### CalcWindowY(BASEWND,WND)
BASEWNDに対するWNDの位置を取得

### GetActiveWindow()
現在のアクティブウィンドウを取得

### HasActiveWindow(WND)
子ウィンドウ孫ウィンドウがアクティブならばTRUE

### MaximizeWindow(WND)
ウィンドウを最大化

### MinimizeWindow(WND)
ウィンドウを最小化

### RestoreWindow(WND)
ウィンドウを最大最小化から復元

### GetWindowStyle(WND)
ウィンドウスタイルを取得

### GetWindowFrameSize WND OUT W1,H1,W2,H2,ERR
ウィンドウフレームサイズを取得

### QueryWindowFrameSize WND OUT W1,H1,W2,H2,E
ウィンドウフレームサイズを計算
GetWindowFrameSizeは実際の大きさを返すのに対しこの関数は計算をする

### FindWindowByControl(WND,CTL,EXTEND)
WNDの子ウィンドウからCTLコントロールに一致するウィンドウを取得、EXTEND=TRUEの時IsControlExtendで判定(再帰的に探索しない)

### GetWindowMouseX(WND)
WNDからのマウスの相対座標を取得

### GetWindowMouseY(WND)
WNDからのマウスの相対座標を取得

### GetOwnerWindow(WND)
WindowGroupOwnerがあればそれを、無ければParentWindowを返す

### DisableWindowClipping(WND)
ウィンドウをクリッピングしない、ウィンドウが重ならない時にこれを指定すると効率化する

### EnableWindowClipping(WND)
ウィンドウをクリッピングさせる

### GetWindowVar(WND,I)
SPVARのようなWND固有の記憶域(0<=I<=7)

### SetWindowVar WND,I,V
SPVARのようなWND固有の記憶域


## Window Property
WindowVarは軽量だがキーと値が整数のみで利用しづらい場面がある

### SetProp WND,NAME$,V
ウィンドウプロパティに値を設定(文字列をキーとして整数実数文字列を格納できる)

### SetProp2(WND,NAME$,V)
ウィンドウプロパティに値を設定(前の値が返る)

### GetProp(WND,NAME$)
ウィンドウプロパティの値を取得(SetPropされていないNAME$であった場合暗黙的に(0,"",0.0)がSetPropされる)

### TryGetProp WND,NAME$ OUT V,F
ウィンドウプロパティの値を取得(SetPropされていないNAME$であった場合SetPropされずV=0 F=FALSE)

### SetProp$ WND,NAME$,V
文字列版

### SetProp2$(WND,NAME$,V)
文字列版

### GetProp$(WND,NAME$)
文字列版

### TryGetProp$ WND,NAME$ OUT V$,F
文字列版

### SetProp# WND,NAME$,V
実数版

### SetProp2#(WND,NAME$,V)
実数版

### GetProp#(WND,NAME$)
実数版

### TryGetProp# WND,NAME$ OUT V#,F
実数版

### HasProp(WND,NAME$)
WNDがNAME$のプロパティを持っていればTRUE

### RemoveProp WND,NAME$
ウィンドウプロパティを削除

### APIから設定されるプロパティ

#### SetWorkArea(WND,X,Y,W,H)
作業領域(画面からタスクバーなどが除かれた領域)を設定

#### GetWorkArea WND OUT X,Y,W,H,ERR
作業領域(画面からタスクバーなどが除かれた領域)を取得
特に設定されていなければX=0,Y=0,W=GetWindowWidth(WND),H=GetWindowHeight(WND)を返す

##### `"WRKAREAXY"`
上位ワードにX下位ワードにY

##### `"WRKAREAWH"`
上位ワードにwidth下位ワードにheight

#### WindowDefPosFlag()
NewWindowに指定

##### `"NEWWINXY"`
ウィンドウのX座標Y座標を指定せずにNewWindowしたときに指定される座標

上位ワードにX下位ワードにY

## Timer

### SetTimer WND,TIMEOUT,ARG,FUNC$ OUT TIMER,ERR
WNDに対してTIMEOUT ms後に実行するFUNC$を設定する

#### FUNC$
```
COMMON DEF TIMERFUNC WND,TIMER,ARG
END
```

### DeleteTimer(TIMER)
TIMERを削除する

### CheckTimer(TIMER)
TIMERが正常ならTRUE

## Graphic

### GBeginWindow(WND)
描画開始を明示的に宣言する

### GEndWindow(WND)
描画終了を明示的に宣言する(GEndWindowEx(WND,TRUE)と等価)

### GEndWindowEx(WND,CWCF)
描画終了を明示的に宣言する(CWCF=TRUEの時子ウィンドウのクリッピング処理を実行)

### SetWindowDrawPos WND,X,Y
描画の始点を変更(デフォルトで左上(0,0))

### GPSETWindow WND,X,Y,COL
ウィンドウに点を書く

### GFILLWindow WND,X,Y,X2,Y2,COL


### GBOXWindow WND,X,Y,X2,Y2,COL


### GLINEWindow WND,X,Y,X2,Y2,COL


### GetConsolePalette(PAL)
コンソールの色を取得

### GPRINTWindowCC WND,X,Y,STR$,PAL
コンソール色で文字を表示

### GPRINTWindow WND,X,Y,STR$,COL


### GPRINTBWindow WND,X,Y,STR$,COL,BC
背景色を指定してGPRINT

### GPUTCHRWindow WND,X,Y,A,COL


### GPUTCHRSizeWindow WND,X,Y,A,SX,SY,COL
サイズ(SX:SY)を指定してGPUTCHR

### GPUTCHRSize1Window WND,X,Y,A,SX,COL
サイズ(S:S)を指定してGPUTCHR

### GPUTCHRBWindow WND,X,Y,A,COL,BC
背景色を指定してGPUTCHR

### GLOADWindow WND,X,Y,W,H,IMG[],FLG,MODE


### ~~GCOPYWindow WND...~~
廃止予定

### GTRIWindow WND,X,Y,X2,Y2,X3,Y3,COL


### GCIRCLEWindow WND,X,Y,R,COL


### GCIRCLE2Window WND,X,Y,R,S,E,F,COL


### GLOADImageWindow WND,X,Y,IMG,F
画像をウィンドウに描画

### GLOADImagePaletteWindow WND,X,Y,IMG,F
画像をパレットPALを用いてウィンドウに描画

### GCLSWindow WND,COL


### GCLIPWindow WND,X1,Y1,X2,Y2

### Graphic(その他)

#### DrawButton WND,X,Y,W,H,PUSHF
ボタンの枠を描画(PUSHF=TRUEの時押下状態)
中身の部分にGCLIPWindowとSetWindowDrawPosされる

## 標準GUI部品

### GetWindowControl()
ウィンドウを表示するコントロール

### GetButtonControl()
ボタンを表示するコントロール

### GetToggleButtonControl()
トグルボタンを表示するコントロール

### GetTextBoxControl()
テキストボックスを表示するコントロール

### GetLabelControl()
文字を表示するコントロール

### SetLabelAlignCenter LABEL
文字を中央

### SetLabelAlignLeft LABEL
文字を左寄せ(デフォルト)

### SetLabelAlignRight LABEL
文字を右寄せ


### Sample
```BAS
 VAR TESTOTWCTL,TESTOTWWND
 DEF I_TEST
  IF!CHKCALL("IsWinRunning")||!IsWinRunning()THEN'OTWが存在するか、存在した場合動いているか
   ExitProcess 1
   RETURN
  ENDIF
  VAR E
  ExtendControl "TEST",GetWindowControl() OUT TESTOTWCTL,E'Windowコントロールを継承する
  IF E THEN ExitProcess 1RETURN
  E=SetControlPainter(TESTOTWCTL,"TESTOTWPainter")
  NewTopLevelWindow TESTOTWCTL,"TEST",64,64 OUT TESTOTWWND,E
  IF E THEN ExitProcess 1
 END
 DEF TESTOTWPainter WND,CTL,T,A1,A2
  VAR E=CallBaseControlHandler(WND,CTL,T,A1,A2)'親のハンドラを呼び出す(これを呼ばないと枠が描画されない)
  IF E THEN RETURN
  E=GBeginWindow(WND)
  IF E THEN RETURN
  GFILLWindow WND,0,0,64,64,RGB(0,0,0)
  GPRINTWindow WND,0,0,"HELLO",RGB(255,255,255)
  E=GEndWindow(WND)
 END
 DEF L_TEST
  IF UpdateWindow(TESTOTWWND)THEN ExitProcess 1'ウィンドウが閉じられたりした
 END
```
## flag memo

- CTL_FRMBTNHANDLER
- CTL_LBTNFLG=4
- CTL_RBTNFLG=8
- CTL_BTNDWNFLG=1
- CTL_BTNUPFLG=2
- CTL_LEAVEFLG=64
- CTL_DBLFLG=128

## 標準コントロール
これらのコントロールを継承する際は親コントロールのHandlerを呼び出す必要がある

### Window

|event|説明|
|---|---|
|Paint|枠を描画|
|ChFocus|前面に移動|

### Button

|event|説明|
|---|---|
|Paint|ボタンを描画|
|LMouseUp|親ウィンドウにNotifを送信|

#### 操作

##### SetButtonAlignLeft WND
ボタンの文字を左寄りにする

##### SetButtonAlignRight WND
ボタンの文字を右寄りにする

##### SetButtonAlignCenter WND
ボタンの文字を中央に配置する

##### IsCheckedButton(WND)
トグルボタンがチェックされているか

##### UnCheckButton WND
トグルボタンのチェックを外す

##### CheckButton WND
トグルボタンをチェックさせる


### Label

### Scroll

#### GetVScrollBarControl()
縦スクロールバーコントロールを取得

#### GetHScrollBarControl()
横スクロールバーコントロールを取得

#### NewVScrollBar PARENT,SIZ OUT WND,E
縦スクロールバーをPARENTに長さSIZで作成(ScrollBarAutoResizeModeは1)

#### NewHScrollBar PARENT,SIZ OUT WND,E
横スクロールバーをPARENTに長さSIZで作成(ScrollBarAutoResizeModeは1)

#### NewHVScrollBar PARENT,SIZH,SIZV OUT WNDH,WNDV,E
縦横スクロールバーを長さSIZV,SIZHで作成(ScrollBarAutoResizeModeは2)

#### SetScrollBarSize WND,SIZ
縦スクロールバーのサイズを設定

#### GetScrollBarSize(WND)
縦スクロールバーのサイズを取得

#### IncScrollBarSize WND
スクロールバーのサイズを1増加させる

#### SetScrollBarPosition WND,POS
縦スクロールバーの位置を設定

#### GetScrollBarPosition(WND)
縦スクロールバーの位置を取得

#### SetScrollBarAutoResizeMode WND,MODE
MODEが0なら自動リサイズしない、MODEが1なら画面いっぱいリサイズ、MODEが2なら縦横にスクロールバーがある前提

#### GetScrollBarWidth()
スクロールバーのデフォルト幅を取得

#### GetScrollBarHeight()
スクロールバーのデフォルト高さを取得

### ListBox

#### GetListBoxControl()
リストボックスのコントロールを取得

#### AddListBoxItem WND,ITEM$
リストボックスにITEM$を追加

#### AddArrayListBoxItem WND,ITEM$
リストボックスに配列ITEM$を追加

#### ListBoxChItem()
選択アイテムが変化すると親ウィンドウにNotif(A1=WND,A2=ListBoxChItem)を送る

#### GetListBoxSelectedText$(WND)
リストボックスで選択されているアイテム名を取得

#### ClearListBox WND
リストボックスの項目を初期化

#### SelectListBoxItem WND,INDEX
INDEXのリストボックスの項目を選択

### NumUpDown

#### GetNumUpDowCnontrol()
NumUpDownのコントロールを取得

#### GetNumUpDownValue(WND)
NumUpDownの値を取得

#### SetNumUpDownRange WND,MIN,MAX
NumUpDownの範囲を設定


### DropDownList (DROPDOWNLIST)

#### GetDropDownListControl()
DropDownListのコントロールを取得

#### GetDropDownListBox(WND)
DropDownListのListBox WNDを取得(これに対して項目を追加する)

#### GetDropDownListHeight()
DropDownListのデフォルト高さを取得

## Menu

IVARで識別する

ラジオボタンは非ラジオボタンのメニューアイテム(Separatorなど)が区切りとなって認識される

### NewMenu OUT MENU,E
MENUを作成

### SetMenuBar WND,MENU
未実装

### ShowMenu MENU,WND,X,Y
MENUをWNDからの相対座標X,Yに表示

### ShowMenuXY MENU,WND,X,Y
MENUを絶対座標X,Yに表示

### ShowMenuXY2 MENU,WND,X,Y
ShowMenuXYと違いMENUの下部Yの座標を指定する

### GetWindowMenu(WND)
WNDのMENUを取得

### AddMenuItem MENU,STR$,IVAR
MENUにSTR$を追加,IVARはWindowNotifEventの時にARG2に指定される

### AddMenuItemSeparator MENU
MENUにSeparatorを追加

### SetMenuItem MENU,STR$,IVAR
IVARのメニュー項目のSTR$を変更

### CheckMenu(MENU)
MENUが存在すればTRUE

### NewTopLevelMenuWindow CTL,NAME$,WIDTH,HEIGHT OUT WND,ERR


### ShowContextMenu MENU,WND
コンテキストメニューを表示

### AddSubMenuItem MENU,STR$,SUBMENU
メニューにサブメニューを追加

### AddCheckMenuItem MENU,STR$,IVAR,CHECKED
メニューにチェックボックスを追加

### AddRadioMenuItem MENU,STR$,IVAR,CHECKED
メニューにラジオボタンを追加

### GetCheckedRadioMenuItem MENU,IVAR OUT IVAR2
IVARが属するラジオボタングループでチェックされているIVARを返す

### IsCheckedMenuItem(MENU,IVAR)
IVARがチェックされていればTRUE

### AddSubMenuItemID MENU,STR$,SUBMENU,IVAR
サブメニューをID付きで追加

### SetMenuItem MENU,STR$,IVAR
メニューの項目の文字列を変更

### DisableMenuItem MENU,IVAR
メニューの項目を無効化

### EnableMenuItem MENU,STR$,IVAR
メニューの項目を有効化

### GetSubMenuByPos MENU,POS OUT SUB
サブメニューを位置POS(zero-based)から検索して取得(存在しなければ0)

### GetSubMenuByID MENU,ID OUT SUB
サブメニューをIDから検索して取得(存在しなければ0)

### EnumerateMenu MENU,C OUT STR$,C2,CHILD,E
メニューの項目を列挙していく
列挙中に項目を追加してはならない
C2が0であれば列挙が終了したことを示す

```
WHILE C
 EnumerateMenu MENU,C OUT STR$,C,CHILD,E
WEND
```

### IsMenuWindow(WND)
WNDがメニューそのもののウィンドウであればTRUE

### GetMenuOwner(MENU)
MENUを表示しているWNDを返す、MENUが表示されていなければ0を返す

### GetMenuFromWindow(WND)
メニューそのもののウィンドウからMENUを返す

### ContainsSubMenu(MENU,MENUC)
MENUがサブメニューをMENUCを含んでいればTRUE(再帰的に探索しない)

### IsMenuShown(MENU)
MENUが表示されていればTRUE

## Window Group
ウィンドウグループ、これに入れると親子関係にないウィンドウもまとめて扱うことができるようになる

### JoinWindowGroup(WND,WND2)


### LeaveWindowGroup WND
未実装

### GetWindowGroupOwner(WND)


### GetWindowGroupMember(WND)
WNDが持っているウィンドウグループのウィンドウを取得

### GetNextWindowGroupMember(WND)
WNDの次のウィンドウグループのウィンドウを取得

### GetPrevWindowGroupMember(WND)
WNDの前のウィンドウグループのウィンドウを取得


## Dialog

### NewDialogBoxWithArg CTL,NAME$,WIDTH,HEIGHT,OWNER,FLAG,A1,A2 OUT WND,ERR
FLAG=1のときModeless, FLAG=0のときModal

### NewDialogBox CTL,NAME$,WIDTH,HEIGHT,OWNER,FLAG OUT WND,ERR
FLAG=1のときModeless, FLAG=0のときModal

### NewModalDialogBox(CTL,NAME$,WIDTH,HEIGHT,OWNER)
モーダルダイアログボックスを作成

### NewModelessDialogBox(CTL,NAME$,WIDTH,HEIGHT,OWNER)
モーダレスダイアログボックスを作成


## File dialog

### OpenFileDialog(OWNER,TYPE$,ID)
ファイルを開くダイアログを表示  
TYPE$にファイル種別(TXT/DAT)  
選択された場合IDをA1、ファイル名をA2$に入れてStrNotifが呼ばれる

### OpenFileDialogEx OWNER,TYPE$,ID,LIST$[] OUT E
ファイルを開くダイアログを表示
LIST$[]にはファイル種別配列を入れる
選択された場合IDをA1、FileDialogInfoをA2に入れてNotifが呼ばれる

### SaveFileDialog(OWNER,TYPE$,ID)
ファイル保存ダイアログを表示  
TYPE$にファイル種別(TXT/DAT)  
選択された場合IDをA1、ファイル名をA2$に入れてStrNotifが呼ばれる

### SaveFileDialogEx OWNER,TYPE$,ID,LIST$[] OUT E
ファイル保存ダイアログを表示
LIST$[]にはファイル種別配列を入れる
選択された場合IDをA1、FileDialogInfoをA2に入れてNotifが呼ばれる

## FileDialogInfo

### DeleteFileDialogInfo(FDINFO)
FileDialogInfoを削除、必ず削除する必要がある

### GetFileDialogInfoFile$(FDINFO)
ファイル名を取得

### GetFileDialogInfoType$(FDINFO)
ドロップダウンリストで選択した項目を取得

## WindowOP
ウィンドウに対しての操作を効率化する
子ウィンドウを一々削除していたら再描画リクエストが一々確認されたりして非常に遅い
それをEndWindowOPでまとめてやる

|関数|説明|
|---|---|
|BeginWindowOP(WND)||
|EndWindowOP(WND)||
|MoveWindow2(WND,X,Y)|->MoveWindowOP(WND,X,Y)|

## 拡張コントロール群
標準コントロールの機能拡張版

### TextBoxEx
複数行編集、シンタックスハイライトに対応した拡張版

#### GetTextBoxExControl()
TextBoxExControlを取得

#### TextBoxExSetText WND,TXT$
WNDにTXT$を設定

#### TextBoxGetText  WND OUT TXT$
WNDのTextを取得

#### SetTextBoxExPRGMode WND,FLG
FLGがTRUEならばシンタックスハイライトを有効化

#### TextBoxExSetSelectedText WND,TXT$
現在選択されているTextにTXT$を設定

#### TextBoxExGetSelectedText WND OUT TXT$
現在選択されているTextを取得

#### TextBoxExCopy WND
クリップボードにコピー

#### TextBoxExCut WND
クリップボードに切り取り

#### TextBoxExPaste WND
クリップボードから貼り付け


### RICHTEXTEDITOR

#### RichTextBold()
フラグ

#### RichTextItalic()
フラグ

#### RichTextStrike()
フラグ

#### RichTextUnderline()
フラグ

#### RICHTEXT X,Y,C,STYLE,SIZE,COL
RICHTEXTを表示

#### RTESetBold WND,F


#### RTESetItalic WND,F


#### RTESetStrike WND,F


#### RTESetUnderline WND,F


#### RTESetTextColor WND,COL


#### RTESetAlignLeft WND


#### RTESetAlignCenter WND


#### RTESetAlignRight WND


#### RTESetFontSize WND


#### RTENew RTE
初期化

#### RTEOpen RTE,FILE$ OUT ERR
FILE$を開く

#### RTESave RTE,FILE$ OUT ERR
FILE$に保存する

#### RTEClear WND
インデントや見出しなどを消す

#### RTEIndent WND,INDENT
インデントをINDENT px増やす

#### RTESetOrderedList WND
* こういうリスト

#### RTESetUnorderedList WND
1. こういうリスト

#### RTESetHeading WND,LEVEL
LEVEL(1<=LEVEL<=6)見出しを付ける

#### RTECopy WND
コピー

#### RTEPaste WND
ペースト

#### RTECut WND
切り取り

#### RTESelectAll WND
すべて選択

#### RTEAddTable WND,ROW,COL
ROW行COL列の表を作成

## ダイアログ

### MessageBox(WND,TITLE$,TEXT$,FLAG)
メッセージボックスを作成

### MessageBoxOK()
OKボタンのフラグ

### MessageBoxError()
エラーメッセージボックスのフラグ

### MessageBoxNotifOK()
OKボタンが押されたときにWNDへ送信される

### MessageBoxNotifCancel()
キャンセルされたときにWNDへ送信される

### MessageBoxNotifID()
MessageBoxが閉じられたときにWNDへ送信されるNotifID

## Clipboard

### ClearClipboard
クリップボードを初期化

### ClipboardContainsText()
クリップボードに文字列が格納されているか

### ClipboardGetText$()
クリップボードに格納された文字列を取得(無ければ空文字)

### ClipboardSetText V$
クリップボードに文字列を格納

### ClipboardContaisFile()
クリップボードにファイルが格納されているか

### ClipboardGetFile OUT ISCUT,PATH$)
クリップボードに格納されたファイルを取得(無ければ空文字)ISCUTがTRUEならば切り取り

### ClipboardSetFile ISCUT,PATH$
クリップボードにファイルを格納、ISCUTがTRUEならば切り取り

### ClipboardSetData$ TYPE$,V$
クリップボードにTYPE$の文字列データを設定

### ClipboardGetData$ TYPE$ OUT DATA$,CONTAINS
クリップボードからTYPE$の文字列データを取得、CONTAINSがFALSEなら含まれていない


### ClipboardData
### "RichText"
リッチテキスト文字列が入っている

## Image

### NewImage ARRAY,WIDTH,HEIGHT OUT IMG,E
画像を作成

### LoadImage FILE$,W,H OUT IMG,E
画像を二次元配列DATファイルから読み込み

### GLOADImage X,Y,IMG,F
現在のグラフィック面にX,YにIMGを描画(FがTRUEの場合透明色も描画)

### GLOADImagePalette X,Y,IMG,PAL,F
現在のグラフィック面にX,YにIMGをパレットPALで描画(FがTRUEの場合透明色も描画)

### GSAVEImage X,Y,IMG
現在のグラフィック面のX,YをIMGにコピー

### CheckImage(IMG)
画像が正常か確認

### DeleteImage(IMG)
画像を削除

### GetImageWidth(IMG)
画像の幅を取得、エラーの時0

### GetImageHeight(IMG)
画像の幅を取得、エラーの時0

### GetImageArray IMG OUT ARY,ERR
画像の生配列を取得

### SaveImage(IMG,PATH$)
IMGをGRP形式でPATH$に保存

## 関連付け

### GetAssociatedProgram$(TYP$,EXT$)
TYP$とEXT$に関連付けられたものを取得

### AssociateFile(TYP$,EXT$,NAME$)
拡張子をNAME$に関連付けるTYP$に" "/"*"/"/",EXT$に拡張子(e.g.TXT)成功するとFALSE

### ExecFile(PATH$)
PATH$に関連付けられたプログラムをPATH$を引数に設定して起動

## 直接描画

### GBeginDirect(WND)
直接描画を可能にする(GPSETなどが使える)

### GCopyDirect(WND,X,Y,W,H,X3,Y3,MODE)
直接描画を終了し、GBeginWindow(WND)をして転送

### GetDirectGPAGE WND OUT PAGE1,PAGE2,ERR
直接描画に使っている表示ページ、描画ページを取得


## フォント
フォント周りのAPI

### CalcTextSize
`CalcTextSize TEXT$ OUT W,H`
デフォルトフォントでのテキストのサイズを計算

## IM
[こちらを参照](IM)

## Mouse

### GetMouseX()
マウスのX座標を取得

### GetMouseY()
マウスのY座標を取得

### MoveMouse X,Y
マウスを(X,Y)に移動

### SetMouseMode MODE
MODEがTRUEなら絶対座標でのマウス移動

## Sound
BGMPLAYをBEEPのように自由に鳴らせるようにするAPI

## IsValidMML(MML$)
MML$が正常なMMLならTRUE

### PlayMML MML$ OUT MUSIC,ERR
MML$を再生してMUSICを返す

### IsMusicPlaying(MUSIC)
MUSICを再生する

### PauseMusic MUSIC
MUSICの再生を一時停止する

### ContMusic MUSIC
MUSICの再生を再開する

### SetMusicVar MUSIC,NO,V
MMLの内部変数への書き込み

### GetMusicVar(MUSIC,NO)
MMLの内部変数の読み出し

### SetMusicVolume MUSIC,VOL
MUSICの音量を設定する(0~127)

### StopMusic MUSIC
MUSICの再生を止める

## その他
### NewWindowMoveFrame(WND,X,Y,WIDTH,HEIGHT,MODE,CALLBACK$)
XとYはマウスからの距離
WIDTHとHEIGHTは未使用
CALLBACK$は移動終了時にOTWのプロセスから呼び出される

```
COMMON DEF CALLBACK WND,X,Y,W,H
```


MODE=1の時移動
MODE>=2の時下図方向に大きさを変更

```
 2      3      4
  +-----------+
  |           |
 5|           |6
  |           |
  +-----------+
 7      8      9

```
