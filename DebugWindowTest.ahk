SetTimer Update,50

Update:
CoordMode,Mouse,Screen
MouseGetPos mX,mY,mWin,mCtrl
hwnd:=DebugWindow(mX . "," . mY . " `n " . mWin . "," . mCtrl)
return
