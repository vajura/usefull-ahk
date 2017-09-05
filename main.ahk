#NoEnv
#EscapeChar \
#CommentFlag //
SendMode Input

wDir = %A_WorkingDir%

//msgbox, 0, A_WorkingDir, %A_WorkingDir%
//msgbox, 0, A_ScriptDir , %A_ScriptDir%

//SCRIPTS
class Scripts
{
	
}
scriptArray = Object();

armorScript = %wDir%./scripts/armorcalc\.ahk
testScript = %wDir%./scripts/test\.ahk

//onstart
MsgBox, 262144,, RELOADED, 0.3

//test script 
^+t::
	Run %testScript%
return

//runs armour calc script
^+a::
	Run %armorScript%
return

//open calculator
^+q::
	Run calc.exe
return

^+r::Reload
	Sleep 1000
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
	IfMsgBox, Yes, Edit
return