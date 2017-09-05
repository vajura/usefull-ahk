#SingleInstance force

;Declare Class
Class Window{
	
	Get()
	{
		WingetTitle TitleVar, A ; Get title from Active window.
		This.Title:=TitleVar ; Set TitleVar to This.Title
		
		WinGet IDVar,ID,A ; Get ID from Active window.
		This.ID:=IDVar ; Set IDVar to This.ID
	}
	Activate() ;Activates window with Title - This.Title
	{ 
		;MsgBox % This.ID
		WinActivate % "ahk_id "This.ID ;Use word "This" when you reffer to variable of this Class.
		Return This.ID
	}   
	AnnounceWinProps() ;Create message box with title and ID
	{
		MsgBox % "Title is: " This.Title "`n ID is: " This.ID
	}
}
;Create Instance
SomeWin:= New Window
return

^!a:: ;Hotkey to run Instance Method

IfWinExist, ahk_class Notepad
	WinActivate ahk_class Notepad
else
{
	MsgBox % "There is no Window: Notepad.`nPleas Run Notepad!"
	exit
}

SomeWin.get()
SomeWin.AnnounceWinProps()
Return

^!s::
If SomeWin.ID
	SomeWin.Activate() 
else
	MsgBox Instance SomeWindow has no ID setted, pleas run SomeWin.get() first!
return
