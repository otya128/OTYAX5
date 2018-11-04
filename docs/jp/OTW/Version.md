---
layout: default
title: OTW version
---
# OTW 5.0-37
## 変更点
* カーソル変更処理を実装
* SetCursor(IMG)を追加
* SetWindowCursor(WND,IMG)を追加
* GetWindowCursor(WND)を追加
* メニューの諸々を修正
* ウィンドウの枠でカーソルが変化するように
* ValidateMML MML$ OUT CHR,ERRを実装
* DeleteImageのエラーコードを修正
* TextBox TextBoxEx RichTextEditorでBeamのカーソルを表示させるように
* NewImageArrayFromDATA D,PHYSICAL OUT ARY,W,Hを追加
* NewImageFromDATA OUT IMG,ERRを追加
* OTYMINEとマウスカーソルで上のAPIを使って画像を生成するように
* RotateImage IMG,FLG OUT NEW_IMG,ERRを追加
* SetImageAttr IMG,ATTR OUT ERRを追加
* GetImageAttr IMG OUT ATTR,ERRを追加
* GetImageFormat IMG OUT DIMEN,PHY,ERRを追加
* SetImageHotspot IMG,X,Y OUT ERRを追加
* GetImageHotspot IMG OUT X,Y,ERRを追加
* GetImageSize IMG OUT W,H,ERRを追加
* ImageAttr2Dim() ImageAttr1Dim() ImageAttrLogColor() ImageAttrPhysicalColor() ImageAttrPhy1Dim() ImageAttrHideShadow()を追加

## 破壊的変更
* NewImage ARRAY,WIDTH,HEIGHT OUT IMG,EからNewImage ATTR,ARRAY,WIDTH,HEIGHT OUT IMG,E
* (旧)SetWindowCursorからSetWindowIMCursor
* (旧)GetWindowCursorからGetWindowIMCursor

# OTW5.0-36
## 変更点
* TextBoxでスクロール、選択、メニューなど出来るように
* SetControlContextMenuHandlerを追加
* メニューの諸々を修正
* NewDialogBoxWithArgでCreateイベントが二回呼び出されていた問題を修正
* IsParentWindowを追加
* IsChildWindowを追加
* WindowGroupActiveEvent()を追加
* WindowGroupInactiveEvent()を追加
* window controlの移動処理を修正
* ウィンドウ移動枠の描画処理を修正
* OTW_SMOOTH_MOVE_WINDOWに移動処理を対応
* TextBoxEx RichTextEditorがコンテキストメニューイベントに対応
* TSKBARでメニュー項目が何もないとき<NONE>が表示されるように
* OTYMINEの描画を高速化
* Eyesで幅高さが0の時エラーが出る問題を修正

# OTW5.0-35
## 変更点
* Window frame描画の書き直し#4(大体完了)
 * メニューがくぼむように
 * メニューの選択処理を修正
 * windowが移動中にメニューなどが選択されないように
 * 非アクティブになったときウィンドウの色を暗くするように
* IsMenuShown(MENU)を追加
* メニューが表示されているときに新たにメニューが表示されようとしたとき正常に表示されるように修正
* ContainsSubMenu(MENU,MENUC)を追加
* GetMenuFromWindow(WND)を追加
* GetMenuOwner(MENU)を追加
* HasActiveWindow(WND)を追加
* DeleteWindowでアクティブウィンドウを削除するとき親ウィンドウにフォーカスが当たるように修正
* WindowInactiveEvent()を追加
* FocusWindowでフォーカスが当たる先が同じウィンドウに属する場合WindowActiveEventとWindowInactiveEventが送られないように
* window移動枠描画で枠が残ることがあった問題を修正
* SetPropで無限ループに陥るバグを修正

# OTW5.0-34
## 変更点
* Window frame描画の書き直し#3
 * window captionをクリッピングするように
 * 最大化対応
 * ボタンがくぼむように
 * メニューを選択し表示できるように
 * window移動枠描画処理をCALL命令で実装
* ShowMenu MENU,WND,X,Yを追加
* IsMenuWindow(WND)を追加
* QueryWindowFrameSize WND OUT W1,H1,W2,H2,Eを追加
* GetCaptureEx OUT WND,FRMを追加
* SetCaptureEx(WND,FRM)を追加
* GCLIPWindowがGBeginFrameWindowに対応
* RIMで変換候補ウィンドウの高さが微妙だったのを修正

## 破壊的変更
* EnumerateMenu MENU,C OUT STR$,C2,EからEnumerateMenu MENU,C OUT STR$,C2,CHILD,E

# OTW5.0-33
## 変更点
* Window frame描画の書き直し#2(当たり判定処理を追加)
* EYESの描画処理を差分だけにしたらヌルヌル動いて気持ちが悪い
* CheckMenu(MENU)でMENUが0の時必ずFALSEを返す
* EnumerateMenu MENU,C OUT STR$,C2,Eを追加
* GetWindowSize WND,FRM OUT W,H,Eを追加
* NewWindowMoveFrame(WND,X,Y,WIDTH,HEIGHT,MODE,CALLBACK$)を追加
* window移動枠描画処理をスプライトとXOR描画選択可能に
* SetWindowStyle WND,STYLEを追加
* メニューでエラーを返す処理を修正

# OTW5.0-32
## 変更点
* Window frame描画の書き直し#1
 * borderを1pixel太く
 * 拡張性を上げた
* WindowMaximizedStyle()を追加
* WindowMinimizedStyle()を追加

# OTW5.0-31

## 変更点
* メニューでマウスが離れたときに選択が解除されるように
* SetMenuItem MENU,STR$,IVARを追加
* DisableMenuItem MENU,IVARを追加
* EnableMenuItem MENU,STR$,IVARを追加
* NewWindow周りのリファクタリングの実施
* SetControlQueryFrameHandler(CTL,HANDLER$)を追加
* AddSubMenuItemID MENU,STR$,SUBMENU,IVARを追加
* GetSubMenuByPos MENU,POS OUT SUBを追加
* GetSubMenuByID MENU,ID OUT SUBを追加
* GPRINTPWindowでエラーが出た問題を修正
* windowを作成したプロセスが死んだときにwindowを削除するように修正
* GetWorkspaceColor()を追加
* TSKBARでwindowが削除されたときに再描画するように
* TSKBARでOwnerWindowが親windowでないとき表示させないように
* TSKBARでWorkAreaが1ピクセル大きく設定されていた問題を修正
* ODEとTSKBARで影を非表示に(見た目に影響はない)
* OTYMINEで十字キーでマウスを移動できるように
* OTWTERMで若干高速化
* FREEMEMで視覚的に
* DLGEDでいろいろ追加削除できるように

## 破壊的変更
* WindowMaxmizeEvent()->WindowMaximizeEvent()
* WindowHideFlag()を削除(WindowHideStyle()で代替可能)

# OTW5.0-30

## 変更点
* ListBoxのwindow var周りをリファクタリング
* SetChItemListBoxNotifが機能してなかったので廃止、常にListBoxChItemイベントが送られる
* SaveImage(IMG,PATH$)
* DisableWindowClipping(WND)
* EnableWindowClipping(WND)
* TXTEDとPRGEDで上書き保存ができたりするようになった
* NumUpDownControlでTimer対応
* RIMでローマ字入力中に非ローマ字モードに切り替えた場合そのまま入力されるように
* RIMで変換結果の文字列を全部消した場合おかしくなる問題を修正
* GEndWindowEx
* Window Property APIを追加
* SetWorkArea
* GetWorkArea
* WindowDefPosFlag() NewTopLevelWindowと同等のことをするフラグ
* WindowRestoreEvent()
* RestoreWindow
* window controlの改良(最大化のまともな対応、復元の対応、ダブルクリックで最大化/復元)
* WindowTopMostStyle()
* TSKBARのメニューに時間を表示させた
* TSKBARがページ送り対応
* TSKBARが最小化対応
* TSKBARが常に最前面に表示されるように
* GCLIPWindow
* SetMenuItem
* TOPMOSTを追加(ただの試験用)
* DLGEDを追加(まだボタンの大きさ変更と移動が出来るだけ)

## 破壊的変更
* SetWindowProperty->SetSysWindowProperty
* WindowMinimizevent() WindowMaximizeEvent()がwindow自身にも送られるように

# OTW5.0-2F

## 変更点
* tool windowを持つウィンドウでのFrontWindow(WND)を最適化処理を実装
* SetScrollBarPosition WND,POSの範囲確認処理を修正
* 左クリックをしてもCaptureが解放されなくなった
* ODEで起動メッセージ出すようにした
* RichTextEditorでプレーンテキストを挿入させたときに書式がおかしくなることがある問題を修正
* DeleteWindow(WND)で特定で条件下でウィンドウ構造が破壊される問題を修正
* OTWFREEMEMを追加
* WINLISTを追加
* EYESを追加
* ListBoxでボタンを使って項目を選択した場合にイベントが発生しない問題を修正
* ListBoxで何もないところをダブルクリックしてもイベントが発生しなくなった
* GetWinVer$()がやっと実装された "5.0 rev47"などが返る
* OpenFileDialogEx OWNER,TYPE$,ID,LIST$[] OUT E
* SaveFileDialogEx OWNER,TYPE$,ID,LIST$[] OUT E
* DeleteFileDialogInfo(FDINFO)
* GetFileDialogInfoFile$(FDINFO)
* GetFileDialogInfoType$(FDINFO)

# OTW5.0-2E

## 変更点
* ツールウィンドウ(常にOwner windowより前のウィンドウ)を実装
* WindowToolFlag()
* GetScrollBarWidth()
* GetScrollBarHeight()
* タイトルバーの狭いウィンドウを実装
* WindowNarrowStyle()
* MoveMouse X,Y
* ListBoxでメモリのある限り項目を追加できるようになった
* File dialogでDATを指定できなかった問題を修正
* GetDirectGPAGE WND OUT PAGE1,PAGE2,ERR
* GBeginDirectでエラー時に正常にエラーを返せていなかった問題を修正
* FindWindowByControl(WND,CTL,EXTEND)
* GetDropDownListHeight()
* DropDownListBoxが消えなかったりする不具合を修正
* GetControlName$(CTL)
* DeleteWindow(WND)でwindow groupに所属するウィンドウを削除できていなかった問題を修正
* SelectListBoxItem WND,INDEX
* GetWindowMouseX(WND)
* GetWindowMouseY(WND)
* SetTimer WND,TIMEOUT,ARG,FUNC$ OUT TIMER,ERR
* DeleteTimer(TIMER)
* CheckTimer(TIMER)
* Paintイベントをまとめる最適化処理を実装

## 破壊的変更
* NewDialogBox(CTL,NAME$,WIDTH,HEIGHT,OWNER,FLAG)から NewDialogBox CTL,NAME$,WIDTH,HEIGHT,OWNER,FLAG OUT WND,ERRへ

# OTW5.0-2D

## 変更点
* 横スクロールバーを実装
* GetHScrollBarControl()
* NewHScrollBar PARENT,SIZ OUT WND,E
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

# OTW5.0-1D
+ ClearClipboard
+ ClipboardContainsText()
+ ClipboardGetText()
+ ClipboardSetText V$
+ SetWindowBackColor WND,RGB
+ GetWindowBackColor(WND)
+ windowのクリッピング処理を結構修正
+ WindowResizableStyle()で枠を太く
+ カーソル追加(暫定)
+ マウスに影を追加
+ SetControlDeleteHandler(CTL,HANDLER$)
+ SetControlLDoubleClickHandler(CTL,HANDLER$)
+ SetControlMouseLeaveHandler(CTL,HANDLER$)
+ window frameでマウスが離れたときにCTL_LEAVEFLGがセットされる
+ ODSK追加

# OTW5.0-1C
プチコン3.1対応版

+ 余分に1ピクセルマウスをクリッピングしていた問題を修正
+ GCIRCLE2Window WND,X,Y,R,S,E,F,COL
+ GTRIWindow WND,X,Y,X2,Y2,X3,Y3,COL
+ GPRINTWindow GPRINTBWindow GPUTCHRWindow GPUTCHRBWindowでGPUTCHRを使うように
+ window描画を若干修正
+ OTYFILの更新
+ TRIAN追加(GTRIのテスト)

# OTW5.0-1B
+ OTWの起動時に初期化メッセージを表示するように
+ IMAGE APIを追加
+ NewImage WIDTH,HEIGHT OUT IMG,E
+ CheckImage(IMG)
+ DeleteImage(IMG)
+ FindControl(NAME$)
+ GCLIPを戻す処理で1ピクセル縦に余分にクリッピングしていた問題を修正
+ GetWindowName$をSetWindowNameでウィンドウの確認をするように
+ GSAVEImage IMG,WND,X,Y,W,H,IX,IY
+ GLINEArrayMemoryで色を物理色に変換するように
+ 起動音追加
+ LAUNCHERに項目を追加
+ OTYDOCの色々
+ MPLAYを追加

## 破壊的変更
+ NewOpenFileDialog(OWNER)からOpenFileDialog(OWNER,TYPE$)

# OTW5.0-1A

## 変更点
+ SetControlStrNotifHandler
+ SendStrNotifWindow(WND,A1,STR$)
+ ListBoxコントロールを追加
+ GetListBoxControl()
+ WindowMenuStyle()
+ WindowResizableStyle()
+ DeleteControl(CTL)でエラーが出る問題を修正
+ windowでLMouseDown/LMouseUpではなくChFocusイベント時にFrontWindowを呼ぶように
+ NewTopLevelStyleWindow
+ TextBoxExのsyntaxhighlightに予約語を追加
+ TextBoxExSetText WND,TXT$
+ TXTED/PRGEDにメニューを追加
+ NewModalDialogBox(CTL,NAME$,WIDTH,HEIGHT,OWNER)を追加
+ NewModelessDialogBox(CTL,NAME$,WIDTH,HEIGHT,OWNER)を追加
+ ActiveWindow(WND)
+ IsFocusWindow(WND)を追加
+ IsActiveWindow(WND)の挙動が親ウィンドウがアクティブになっていてもTRUEを返すように
+ AddListBoxItem WND,ITEM$
+ IncScrollBarSize W
+ NewOpenFileDialog(OWNDER)を追加

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

# OTW5.0-17
有史以前の記録はcommit差分を見よ
