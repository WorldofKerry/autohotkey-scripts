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

If WinActive("Microsoft.*Edge")
    F13::
    Send ^{Tab}
    Return
    F14::
    Send ^+{Tab}
    Return
Return