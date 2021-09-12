; Shortcut keys to open programs
; For Notion
!^+N::
WinActivate, ahk_exe Notion.exe
return

; For Notion
; Allows mouse macros
#IfWinActive, ahk_exe Notion.exe
XButton1::
Send, ^[
Return

XButton2::
Send, ^]
Return
#IfWinActive