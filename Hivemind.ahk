#NoEnv
#SingleInstance force

^!r::Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return

:O:bjgp::Brian Jurgen Gonzalez Padilla
; Send % "Brian Jurgen Gonzalez Padilla"
; return
:O:jugo::Jurgen Gonzalez
:O:dti9::desarrolloti9_lem@castores.com.mx
:O:cas2::Castores2**


#c::
if WinExist("Calculator ahk_class CalcFrame") or WinExist("Calculator ahk_class ApplicationFrameWindow")
    WinActivate
else
    Run calc.exe
return

#IfWinActive, ahk_exe SQLyog.exe

:O:cam::camiones
:O:per::personal
:O:bit::bitacora
:O:ur::urea
:O:uni::unidades

#!s::
    Send, SELECT * FROM 
    return
::self::
    Send % "SELECT * FROM "
    return

F9::
Send, {left 1}{F9}{right 1}
return
; ClipboardBackup := ClipboardAll
; Clipboard := ""
; SendInput, {LShift}^c
; If (Clipboard)
;     Send, {F9}
; Send, {right 1}

F12::
    ControlGetText, sqlText, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]

^+c::
ControlClick, CustomGridControl2, ahk_exe SQLyog.exe, , RIGHT
Send, {up 2}{right 1}{up}{Enter}
Sleep, 100
Send, {Enter}
    ; WinGet, SQLControlList, ControlList, ahk_exe SQLyog.exe
    ; Loop, Parse,SQLControlList, `n
    ; {
    ;     if (A_LoopField = "CustomGridControl2")
    ;     {
    ;         MsgBox, CustomGridControl2 control exists in IEFrame window so do the rest of your stuff here
    ;     }    
    ; }


#IfWinActive, ahk_exe Explorer.EXE
^!c::
    Run, Code.exe