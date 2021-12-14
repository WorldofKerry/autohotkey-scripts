; Application Switcher
;Switch MS Edge and cycle through its windows
; F17::
!Capslock::
SetTitleMatchMode, regEx
		    
Process, Exist, msedge.exe    
If (errorlevel = 0)
    Run, msedge.exe
Else    
    GroupAdd, allmsedges, Microsoft.*Edge
    
If WinActive("Microsoft.*Edge")
    GroupActivate, allmsedges, r
Else
    WinActivate, Microsoft.*Edge
Return


#IfWinActive  ahk_exe msedge.exe
F13::
Send ^{w}
Return

F14::
Send ^{Click}
Return

; F14 up::
; Send {Ctrl up}
; Return