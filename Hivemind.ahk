#NoEnv
#SingleInstance force

slpTime := 2000
myId := 11040540
testPass13 := Castores2*
prodPass13 := Castores2*
testPass20 := "Castores3*"
urlCyber := "http://cyber.castores.com.mx/LoginUsuario.jsp"
urlAutoriz := "http://apps.castores.com.mx/AutorizarDocumentos/app/login"
urlPermisos := "https://empleados.castores.com.mx/login"
urlTickets := "https://10.3.1.228/softexpert/login?page=execution,200,1"
urlLocal := "localhost:8080/"

^!r::Reload
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return

:O:bjgp::Brian Jurgen Gonzalez Padilla
:O:jugo::Jurgen Gonzalez
:O:rfc::GOPB990830TT6
:O:curp::GOPB990830HGTNDR06
:O:wrath::wrathofhive@outlook.com

:O:ti9::desarrolloti9_lem@castores.com.mx
::cas2::
    SendInput, %testPass13%
    return
::cas3::
    SendInput, %testPass20%{Tab}
    return

; test IE automation
#z::
;internet explorer - get webpage titles and urls for most recently active IE window
;DetectHiddenWindows, On
; WinGet, hWnd, ID, ahk_class IEFrame
; if !hWnd
; 	return
; vOutput := ""
; for oWB in ComObjCreate("Shell.Application").Windows
; {
; 	if (oWB.HWND = hWnd)
; 	{
; 		try vUrl := oWB.document.url
; 		catch
; 			vUrl := ""
; 		try vTitle := oWB.document.title
; 		catch
; 			vTitle := ""
; 		vOutput .= vTitle "`r`n" vUrl "`r`n`r`n"
; 	}
; }
; oWB := ""
; vOutput := SubStr(vOutput, 1, -2)
; ;Clipboard := vOutput
; MsgBox, % vOutput

; wb := IEGet("Google")
; wb.Document.All.q.Value := "site:autohotkey.com tutorial"
; wb.Document.All.q.Focus()
; wb.Document.All.btnG.Click()
; While wb.Busy
; Sleep, 100

; wb := IEGet("Google")
; wb.Navigate("http://www.autohotkey.com/forum/")
; While wb.busy
; Sleep, 100

; Links := wb.Document.Links

; print all available links on the page
; Loop % Links.Length ; check each link
; If ((Link := Links[A_Index-1].InnerText) != "") ; if the link is not blank
; Msg .= A_Index-1 . " " . Link . "`n" ; add item to the list
; MsgBox % Msg ; display the list

; Loop % Links.Length ; check each link
; ; If (Links[A_Index-1].InnerText = "Advanced Search") { ; replace my name with whatever text you'd rather search for
; If InStr(Links[A_Index-1].InnerText, "Advanced") { 
; 		Links[A_Index-1].Click()
; 		break
; 	}

return


#+z::


wb := ComObjCreate("InternetExplorer.Application")
wb.Visible := True
wb.Navigate("Google.com")
While wb.busy
Sleep, 100

; IELoad(wb)
; wb.Document.All.q.Value := "site:autohotkey.com tutorial"
; wb.Document.All.q.Focus()
; wb.Document.All.btnG.Click()
; While wb.busy
; Sleep, 100
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
    Gui, Add, Checkbox, vLocal checked, &Local
    Gui, Show
    return

OnSelect:
Gui, Submit, nohide
if (LoginWebsite = "CyberCliente"){
    runFirefox()
    if(Local = 0)
        Run, %urlCyber%
    else{
        SendInput, ^l%urlLocal%%LoginWebsite%{Enter}
    }
}
else if (LoginWebsite = "Permisos"){
    runFirefox()
    if(Local = 0)
        Run, %urlPermisos%
    else{

    }
}
else if (LoginWebsite = "Autorizar"){
    runFirefox()
    if(Local = 0)
        Run, %urlAutoriz%
    else{

    }
}
else
    MsgBox, "d"
Gui, Destroy
return

runFirefox(){
    if WinExist("ahk_class MozillaWindowClass") or WinExist("ahk_exe firefox.exe")
        WinActivate
    else
        Run C:\programs\mozilla\firefox.exe 
    return
}

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
; :O:ur::urea
:O:tal::talones
:O:uni::unidades

; Shortcut for basic query
!s::
    SendInput % "SELECT * FROM "
    return

; Shortcut for basic query
::self::
    SendInput % "SELECT * FROM "
    return

; Excecute the line to the left if you are positioned after the semicolon
F9::
    SendInput, {left 1}{F9}{right 1}
    return

; Search in SQLyog filter to get the table fast and be able to produce an insert, select, delete, update
!^f::
    ClipboardBackup := ClipboardAll
    Clipboard =
    Send, {Home}
    Send, +{End}
    Send, ^c
    Send, {right 1}
    global position := 0
    dbAndTable := getBetweenFrom()
    if (position != 0){
        dbAndTable := StrSplit(dbAndTable, ".")
        Sleep, 100
        searchInFilter(dbAndTable)
    }
    Clipboard := ClipboardBackup
    return

    getBetweenFrom(){
        position := RegExMatch(Clipboard, "(FROM|from)\S*(a-zA-Z\d)*.(a-zA-Z\d)*\S*", replacements)
        ; MsgBox, %position%
        ; MsgBox, %dbAndTable%

        if (position != 0){
            dbAndTable := SubStr(replacements, 6) ; 6 of "from"
            dbAndTable := Trim(dbAndTable)
        }
        ; MsgBox, %dbAndTable%
        return dbAndTable
    }

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
        ; MsgBox, %dbAndTable%
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
        SendInput, {End}

        Loop, %Num%
        {
            ; your script to loop here

            SendInput, {Del}
            SendInput, {End}
        }
        SendInput, {Home}
        Gui, Destroy
    return

; Copy selected lines from the result query in SQLyog
; Scintilla7 -> CustomGridControl4
; Scintilla2 -> CustomGridControl2
; Scintilla12 -> CustomGridControl6
; Scintilla6 -> CustomGridControl3
^+c::
    Send, ^r        ; SQL shortcut to focus query results
    ; ControlClick, , ahk_exe SQLyog.exe, , RIGHT
    MouseGetPos, StartX, StartY
    Click, 1860 970 Right
    Send, {up 2}
    Send, {right 1}
    Send, {up}
    Send, {Enter}
    Sleep, 100
    Send, {Enter}
    Send, ^e       ; SQL shortcut to focus on query file
    MouseMove, StartX, StartY
    return

#IfWinActive, ahk_exe Explorer.EXE
; Open with code in file explorer shortcut
^!c::
    ClipboardBackup := ClipboardAll
    Clipboard =
    SendInput, {Space}{F2}^a^c{Esc}
    filename := Clipboard
    Sleep, 200
    ControlSend, {Home}, ahk_class ExploreWClass 
    Sleep, 100
    SendInput, ^c
    path := Clipboard
    SendInput, {Esc}+{Tab}+{Tab}+{Tab}+{Tab}+{Tab}+{Tab}+{Tab}
    ; MsgBox, %path%%filename%
    Run, %ComSpec% /c code %path%,,hide
    Clipboard := ClipboardBackup
    return

^!p::
    Send, ^l
    Send, mpv .
    Send, {Enter}
    return
=======
