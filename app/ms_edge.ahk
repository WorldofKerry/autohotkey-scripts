; Application Switcher
;Switch MS Edge and cycle through its windows
F17::
!Capslock::
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