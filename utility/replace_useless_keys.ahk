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