SetTimer Update,50

Update:
CoordMode,Mouse,Screen
MouseGetPos mX,mY,mWin,mCtrl
hwnd:=ConsoleLog(mX . "," . mY . " `n " . mWin . "," . mCtrl,1)
return
