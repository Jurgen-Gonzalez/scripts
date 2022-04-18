#NoEnv
#SingleInstance force

slpTime := 2000

^!r::Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return

:O:bjgp::Brian Jurgen Gonzalez Padilla
; Send % "Brian Jurgen Gonzalez Padilla"
; return
:O:jugo::Jurgen Gonzalez
:O:ti9::desarrolloti9_lem@castores.com.mx
:O:cas2::Castores2*
:O:cas3::Castores3.*

; !^c::
;     ControlGetText, filename, Edit1, A
;     MsgBox, %filename%
;     return

; Shortcut to log in quickly to a website with credentials
^+l::
Gui, Add, Text, , Logearte a:
Gui, Add, DropDownList, vLoginWebsite, CyberCliente||Permisos|Autorizar
Gui, Show

LaunchWebsite:
GuiControlGet, OutputVar

; Shortcut to open calculator
#c::
if WinExist("Calculator ahk_class CalcFrame") or WinExist("Calculator ahk_class ApplicationFrameWindow")
    WinActivate
else
    Run calc.exe
return

;-----------------------------------------------------------------------------------------------
;--------------------------------           SQLyog            ----------------------------------
;-----------------------------------------------------------------------------------------------
#IfWinActive, ahk_exe SQLyog.exe

:O:cam::camiones
:O:per::personal
:O:bit::bitacora
:O:ur::urea
:O:uni::unidades

; Shortcut for basic query
!s::
    Send, SELECT * FROM 
    return

; Shortcut for basic query
::self::
    Send % "SELECT * FROM "
    return

; Excecute the line to the left if you are positioned after the semicolon
F9::
    Send, {left 1}{F9}{right 1}
    return

; Search in SQLyog filter to get the table fast and be able to produce an insert, select, delete, update
!^f::
    ClipboardBackup := ClipboardAll
    Clipboard =
    Send, ^c
    dbAndTable := Clipboard
    dbAndTable := StrSplit(dbAndTable, ".")
    Sleep, 100
    searchInFilter(dbAndTable)
    Clipboard := ClipboardBackup
    return

    searchInFilter(dbAndTable){
        database := dbAndTable[1]
        table := dbAndTable[2]

        table := RegExReplace(table, "``")
        ; MsgBox, %table%

        Send, ^+b
        Send, {Tab}
        Send, {Home}
        Send, +{Tab}
        Send, %database%
        Sleep, 200
        Send, {Enter}
        Send, ^+b
        Send, %table%
        Send, {Enter}
    }

; Delete blank spaces to format inserts, deletes, updates and selects created with SQLyog shortcut
^+Del::
    Gui, Add, text, , Cuantas veces deseas borrar:
    Gui, Add, Edit, vNum
    Gui, Add, Button, default, OK
    Gui, Show
    return

    GuiClose:
    ButtonOK:
        Gui, Submit 
        Send, {End}

        Loop, %Num%
        {
            ; your script to loop here

            Send, {Del}
            Send, {End}
        }
        Send, {Home}
        Gui, Destroy
    return

; Copy selected lines from the result query in SQLyog
^+c::
    ControlClick, CustomGridControl2, ahk_exe SQLyog.exe, , RIGHT
    Send, {up 2}{right 1}{up}{Enter}
    Sleep, 100
    Send, {Enter}
    return

#IfWinActive, ahk_exe Explorer.EXE
; Open with code in file explorer shortcut
^!c::
    ClipboardBackup := ClipboardAll
    Clipboard =
    Send, {Space}{F2}^a^c{Esc}
    filename := Clipboard
    Sleep, 200
    ControlSend, , {Home}, ahk_class ExploreWClass 
    Sleep, 100
    Send, ^c
    path := Clipboard
    Send, {Esc}+{Tab}+{Tab}+{Tab}+{Tab}+{Tab}+{Tab}+{Tab}
    ; MsgBox, %path%%filename%
    Run, %ComSpec% /c code %path%,,hide
    Clipboard := ClipboardBackup
    return
