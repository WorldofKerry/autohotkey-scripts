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
