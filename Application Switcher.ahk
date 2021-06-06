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
; XButton1::
; Send {Volume_Down}
; Return

; XButton2::
; Send {Volume_Up}
; Return

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



; Application Switcher
;Switch MS Edge and cycle through its windows
F17::
SetTitleMatchMode, regEx
		    
Process, Exist, msedge.exe    
If (errorlevel = 0)
    Run, msedge.exe
else    
    GroupAdd, allmsedges, Microsoft.*Edge
    
if WinActive("Microsoft.*Edge")
    GroupActivate, allmsedges, r
else
    WinActivate, Microsoft.*Edge
return



; For GTAO
; Equips super heavy armor and exits menu
F13::
SendPlay, m
Sleep, 120
SendPlay {Down}{Enter}{Down}{Down}{Enter}
SendPlay {Down}{Down}{Down}{Down}{Enter}{m}
return

+F13::
; Opens snack menu
SendPlay, m
Sleep, 120
Send {Down{Enter}{Up}{Enter}
return



; For BTD Battles
; Reassigns hotkeys for better experience
#IfWinActive, ahk_exe Battles-Win.exe
s::
Send, {BackSpace}
return

d::
Send, {,}
return

f::
Send, {.}
return
q::
Send, 1
return

w::
Send, 2
return

e::
Send, 3
return

r::
Send, 4
return

