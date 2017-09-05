#NoEnv
SendMode Input

wDir = %A_WorkingDir%

MsgBox, 262144,, RELOADED, 0.1

^y::  ; Control+Alt+Z hotkey.
	MouseGetPos, mX, mY
	inputX := mX + 40
	inputY := mY

	tX := mX - 155
	tY := mY - 137

	counter := 0
	stopCounter := 0
	while (tX < 1400)
    {
    	if (counter = 20)
    		break

    	if (stopCounter = 20)
    		break
        PixelGetColor, color, %tX%, %tY%
		if (color = 0xDDDDDD) {
    		MouseMove, %tX%, %tY%, 0,
			send {LButton}
			Sleep, 10
			send {LButton}
			Sleep, 20
			Send ^{vk43}
			Sleep, 10
			MouseMove, %inputX%, %inputY%, 0,
			Sleep, 20
			send {LButton}
			clipboardText = %clipboard%
			counterIn := 0
			firstPos := 0
			Loop
			{
				StringGetPos, out, clipboardText, %A_Space%, L%A_Index%
				if (out != -1) {
					counterIn++
					if (counterIn == 1) {
						firstPos := A_Index + 1
					}
				} else {
					break
				}
			}
			if (counterIn > 0) {
				len := StrLen(clipboardText) - clipboardText
				string := SubStr(clipboardText, firstPos, len)
				clipboard = %string%
				Send ^{vk56}
				Sleep, 1000
			} else {
				Send ^{vk56}
			}
			Sleep, 20
			send {Space}
			tX := tX + 10
			Sleep, 50
			counter := counter + 1
		}
		tX := tX + 10
		if (tX > 1350) {
			stopCounter := stopCounter +1
			if (counter < 5) {
				break
			}
			tX := mX - 155
		}
    }
	
return


^+r::Reload
	Sleep 1000
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
	IfMsgBox, Yes, Edit
return