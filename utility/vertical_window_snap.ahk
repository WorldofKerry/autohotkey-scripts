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