#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include, %A_ScriptDir%\app
#Include, notion.ahk
#Include, ms_edge.ahk
; #Include, btd_battles.ahk
; #Include, GTA_online.ahk

#Include, %A_ScriptDir%\utility
#Include, vertical_window_snap.ahk
#Include, jkl;_arrow_keys.ahk
#Include, replace_useless_keys.ahk
; #Include, xps_13_volume_small_hands.ahk



; Addtional change volume keys
; Volume up and down with side mouse buttons
; XButton1::
; Send {Volume_Down}
; Return

; XButton2::
; Send {Volume_Up}
; Return

F20::
Send ^{F13}
Return

F21::
Send ^{F14}
Return

F22::
Send ^{F15}
Return

F23::
Send ^{F16}
Return

F24::
Send ^{F17}
Return