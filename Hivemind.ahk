#NoEnv
#SingleInstance force

slpTime := 2000
myId := 11040540
testPass13 := Castores2*
prodPass13 := Castores2*
testPass20 := "Castores3.*"
urlCyber := "http://cyber.castores.com.mx/LoginUsuario.jsp"
urlAutoriz := "http://apps.castores.com.mx/AutorizarDocumentos/app/login"
urlPermisos := "https://empleados.castores.com.mx/login"
urlTickets := "https://10.3.1.228/softexpert/login?page=execution,200,1"

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
:O:cas2::
    SendInput, %testPass13%
    return
:O:cas3::
    SendInput, %testPass20% 
    return

; test IE automation
#z::
wb := IEGet("Google")
wb.Document.All.q.Value := "site:autohotkey.com tutorial"
wb.Document.All.q.Focus()
wb.Document.All.btnG.Click()
While wb.Busy
Sleep, 100
; IELoad(wb)
return

; Links := wb.Document.Links

; Loop % Links.Length ; check each link
; If ((Link := Links[A_Index-1].InnerText) != "") ; if the link is not blank
; Msg .= A_Index-1 . " " . Link . "`n" ; add item to the list
; MsgBox % Msg ; display the list

#+z::
wb := ComObjCreate("InternetExplorer.Application")
wb.Visible := True
wb.Navigate("Google.com")
While wb.busy
Sleep, 100
; IELoad(wb)
wb.Document.All.q.Value := "site:autohotkey.com tutorial"
wb.Document.All.q.Focus()
wb.Document.All.btnG.Click()
While wb.busy
Sleep, 100
; IELoad(wb)
return

IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
{
    IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
        Name := ( Name="Nueva Pestaña - Windows Internet Explorer" ) ? "about:Tabs"
        : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
    For wb in ComObjCreate( "Shell.Application" ).Windows
        If ( wb.LocationName = Name ) && InStr( wb.FullName, "iexplore.exe" )
            Return wb
} ;written by Jethrow

; IEGet(Name="")        ;Retrieve pointer to existing IE window/tab
; {
;     IfEqual, Name,, WinGetTitle, Name, ahk_class IEFrame
;         ; Name := ( RegExMatch(Name, "(Nueva Pestaña|New tab) - (Windows|Microsoft)? Internet Explorer") != 0 ) ? "about:Tabs"
;         Name := ( Name="New Tab - Windows Internet Explorer" ) ? "about:Tabs"
;         : RegExReplace( Name, " - (Windows|Microsoft) Internet Explorer" )
;     For wb in ComObjCreate( "Shell.Application" ).Windows
;         If ( wb.LocationName = Name ) && InStr( wb.FullName, "iexplore.exe" )
;             Return wb
; } ;written by Jethrow

IELoad(wb)    ;You need to send the IE handle to the function unless you define it as global.
{
    If !wb    ;If wb is not a valid pointer then quit
        Return False
    Loop    ;Otherwise sleep for .1 seconds untill the page starts loading
        Sleep,100
    Until (wb.busy)
    Loop    ;Once it starts loading wait until completes
        Sleep,100
    Until (!wb.busy)
    Loop    ;optional check to wait for the page to completely load
        Sleep,100
    Until (wb.Document.Readystate = "Complete")
Return True
}

; Shortcut to log in quickly to a website with credentials
^+l::
    Gui, Add, Text, , Logearte a:
    Gui, Add, DropDownList, vLoginWebsite gOnSelect, CyberCliente||Permisos|Autorizar
    Gui, Show
    return

OnSelect:
Gui, Submit, nohide
if (LoginWebsite = "CyberCliente"){
    MsgBox, "a"
    if WinExist("ahk_class MozillaWindowClass") or WinExist("ahk_exe firefox.exe")
        WinActivate
    else
        Run C:\programs\mozilla\firefox.exe 
    Run, %urlCyber%
}
else if (LoginWebsite = "Permisos")
    MsgBox, "b"
else if (LoginWebsite = "Autorizar")
    MsgBox, "c"
else
    MsgBox, "d"
return

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
; Scintilla7 -> CustomGridControl4
; Scintilla2 -> CustomGridControl2
; Scintilla12 -> CustomGridControl6
; Scintilla6 -> CustomGridControl3
^+c::
    ControlClick, CustomGridControl2, ahk_exe SQLyog.exe, , RIGHT
    Send, ^r        ; SQL shortcut to focus query results
    Send, {up 2}
    Send, {right 1}
    Send, {up}
    Send, {Enter}
    Sleep, 100
    Send, {Enter}
    Send, ^e       ; SQL shortcut to focus on query file
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
