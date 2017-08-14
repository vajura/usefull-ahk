#EscapeChar \
#CommentFlag //

concatedString = 
armourCalulation = 
endCalculation = false
armour := 10000
flaskEffectivness = 1.0
while 1
{
	Input, userInput, T3 L9 I, {enter}{esc}{tab}a, 1,2,3,4,5,6,7,8,9,0
	if (ErrorLevel = "EndKey:a")
	{
		endCalculation = true
		break
	}
	if (ErrorLevel = "Timeout" OR InStr(ErrorLevel, "EndKey:"))
	{
	    break
	}
	concatedString = %concatedString%%userInput%
}
if (endCalculation) 
{
	//concatedString := concatedString * (1 - (0.15 * flaskEffectivness))
	armourCalulation := armour / (armour + concatedString * 10)
	armourCalulation := armourCalulation * 100
	armourCalulation := armourCalulation + (15 * flaskEffectivness) + 8 + 6 + 4 + 12 + 13
	armourCalulation := 1 - armourCalulation / 100
	armourCalulation := armourCalulation * concatedString
}
else
{
	armourCalulation := armour / (armour + concatedString * 10) * 100
}
clipboard := armourCalulation
msgbox, 0, Armour calculation , %armourCalulation%, 1.5
