#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



; Set lock keys permanently

; Num Lock
SetNumlockState, AlwaysOn
Return



; Turn underutilized keys to more useful functions

; Control + Capslock --> Capslock
^Capslock::
SetCapsLockState, % GetKeyState("Capslock","t") ? "Off" : "On" ;toggle capslock
Return

; Shift + Capslock and Control + Shift + Capslock --> new web browser gmail tab and also highlight url field
+Capslock::
{
 Run, http://mail.google.com
 Sleep 100
 Send, ^l
 Return
}
^+Capslock::
{
 Run, http://mail.google.com
 Sleep 100
 Send, ^l
 Return
}

; Other keys for more efficient inputs
Capslock::
Send {enter}
Return

^Numlock::
Send {Numlock}
Return

Numlock::
Send {backspace}
Return

^Pause::
Send {Pause}
Return

Pause::
Send {tab}
Return



; Two additional sets of arrow kwys with their relevant Control and Shift functions
; Alt + jkl; and Alt + asdf --> arrow keys
!j::
Send {left}
Return

!k::
Send {up}
Return

!l::
Send {down}
Return

!;::
Send {right}
Return

!+j::
Send +{left}
Return

!+k::
Send +{up}
Return

!+l::
Send +{down}
Return

!+;::
Send +{right}
Return

!^j::
Send ^{left}
Return

!^k::
Send ^{up}
Return

!^l::
Send ^{down}
Return

!^;::
Send ^{right}
Return

!+^j::
Send +^{left}
Return

!+^k::
Send +^{up}
Return

!+^l::
Send +^{down}
Return

!+^;::
Send +^{right}
Return

!a::
Send {left}
Return

!s::
Send {up}
Return

!d::
Send {down}
Return

!f::
Send {right}
Return

!+a::
Send +{left}
Return

!+s::
Send +{up}
Return

!+d::
Send +{down}
Return

!+f::
Send +{right}
Return

!^a::
Send ^{left}
Return

!^s::
Send ^{up}
Return

!^d::
Send ^{down}
Return

!^f::
Send ^{right}
Return

!+^a::
Send +^{left}
Return

!+^s::
Send +^{up}
Return

!+^d::
Send +^{down}
Return

!+^f::
Send +^{right}
Return

; Additional windows key functions for jkl; arrow keys
!^#J::
Send ^#{left}
Return

!^#;::
Send ^#{right}
Return


; Addtional change volume keys
; Volume up and down with side mouse buttons
XButton1::
Send {Volume_Down}
Return

XButton2::
Send {Volume_Up}
Return

; Volume up and down with ctrl + pgup/pgdn (useful for XPS 13 as single-handed volume change is difficult for small handed people)
^PgUp::
Send {Volume_Up}
Return

^PgDn::
Send {Volume_Down}
Return


; Vertical splitscreen (similar to Windows Key + Left/Right Arrow but for Up and down splitscreen)
; Not own coding, taken from source than can no longer find

; Move window up
+#Up::
WinGet MinMax, MinMax, A
if (MinMax != 0) WinRestore,A
WinMaximize,A
WinGetPos,X,Y,W,H,A,,,

SysGet, MonitorCount, MonitorCount
Loop, % MonitorCount
{
SysGet, MonitorWorkArea, MonitorWorkArea, % A_Index
L := MonitorWorkAreaLeft
R := MonitorWorkAreaRight
T := MonitorWorkAreaTop
B := MonitorWorkAreaBottom
MidX := Round(X+(W/2))
MidY := Round(Y+(H/2))
;MsgBox % "L:`t" . L . "`n" . "MidX:`t" . MidX . "`n" . "R:`t" . R . "`n" . "T:`t" . T . "`n" . "MidY:`t" . MidY . "`n" . "B:`t" . B . "`n"

if (L <= MidX and MidX < R and T <= MidY and MidY < B) {
X := L - 5
Y := T
W := R - L + 10
H := Round((B - T)/2)
WinMove,A,,X,Y,W,H
return
}
}
return

; Move window down
+#Down::
WinGet MinMax, MinMax, A
if (MinMax != 0) WinRestore,A
WinMaximize,A
WinGetPos,X,Y,W,H,A,,,

SysGet, MonitorCount, MonitorCount
Loop, % MonitorCount
{
SysGet, MonitorWorkArea, MonitorWorkArea, % A_Index
L := MonitorWorkAreaLeft
R := MonitorWorkAreaRight
T := MonitorWorkAreaTop
B := MonitorWorkAreaBottom
MidX := Round(X+(W/2))
MidY := Round(Y+(H/2))
;MsgBox % "L:`t" . L . "`n" . "MidX:`t" . MidX . "`n" . "R:`t" . R . "`n" . "T:`t" . T . "`n" . "MidY:`t" . MidY . "`n" . "B:`t" . B . "`n"

if (L <= MidX and MidX < R and T <= MidY and MidY < B) {
X := L - 5
Y := T + Round((B - T)/2) + 1
W := R - L + 10
H := Round((B - T)/2)
WinMove,A,,X,Y,W,H
return
}
}
return


; Hotkey for specific chrome windows (work in progress)
^F1::
IfWinNotExist, ahk_exe chrome.exe
    Run, chrome.exe
Sendinput {LWin & 6}
Return

^F2::
IfWinNotExist, ahk_exe chrome.exe
    Run, chrome.exe
Send {#, down}
Sleep, 50
Send {6}
Sleep, 50
Send {6}
Sleep, 50
Send {#, up}
Return

^F3::
IfWinNotExist, ahk_exe chrome.exe
    Run, chrome.exe
Send {#, down}
Sleep, 50
Send {6}
Sleep, 50
Send {6}
Sleep, 50
Send {6}
Sleep, 50
Send {#, up}
Return

^F4::
IfWinNotExist, ahk_exe chrome.exe
    Run, chrome.exe
Send {#, down}
Sleep, 50
Send {6}
Sleep, 50
Send {6}
Sleep, 50
Send {6}
Sleep, 50
Send {6}
Sleep, 50
Send {#, up}

; !1::
; IfWinNotExist, ahk_class CabinetWClass
; 	Run, explorer.exe
; GroupAdd, kerryexplorers, ahk_class CabinetWClass
; if WinActive ("ahk_exe Explorer.EXE")
; 	GroupActivate, kerryexplorers, r
; else WinActivate ahk_class CabinetWClass
; Return

; !2::
; IfWinNotExist, ahk_class Chrome_WidgetWin_1
; 	Run, chrome.exe
; if WinActive("ahk_class Chrome_WidgetWin_1")
; 	Send ^{tab}
; else
; 	WinActivate ahk_class Chrome_WidgetWin_1
; Return

; F8::
; IfWinNOtExist, ahk_class Qt5QWindowIcon
; 	Run, Resolve.exe
; WinActivate ahk_class Qt5QWindowIcon
; Return    


; Multiple alt-tab macros
; ^F1::
; send,{LAlt down}
; send,{TAB}
; Sleep, 50
; send,{TAB}
; send,{LAlt up}
; Return

; ^F2::
; send,{LAlt down}
; send,{TAB}
; Sleep, 50
; send,{TAB}
; Sleep, 50
; send,{TAB}
; send,{LAlt up}
; Return

; ^F3::
; send,{LAlt down}
; send,{TAB}
; Sleep, 50
; send,{TAB}
; Sleep, 50
; send,{TAB}
; Sleep, 50
; send,{TAB}
; send,{LAlt up}
; Return

; ^F4::
; send,{LAlt down}
; send,{TAB}
; Sleep, 50
; send,{TAB}
; Sleep, 50
; send,{TAB}
; Sleep, 50
; send,{TAB}
; Sleep, 50
; send,{TAB}
; send,{LAlt up}
; Return