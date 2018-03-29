#SingleInstance force
;#NoTrayIcon
#Persistent

global GhostWindow_HWND:=0
global GhostWindow_Opacity:=0
global GhostWindow_FormerOpacity:=0

+#G::
  xx=%GhostWindow_HWND%,%GhostWindow_Opacity%,%GhostWindow_FormerOpacity%
  x:=DebugWindow(xx,1)
  if(!GhostWindow_HWND) {
  global GhostWindow_HWND,GhostWindow_Opacity,GhostWindow_FormerOpacity
    WinGet GhostWindow_HWND,ID,A
    x:=DebugWindow("HWND " . GhostWindow_HWND,1)
    WinGet GhostWindow_FormerOpacity, Transparent, ahk_id %GhostWindow_HWND%
    GhostWindow_Opacity:=GhostWindow_FormerOpacity
  }

  GhostWindow_Opacity-=20

  if (GhostWindow_Opacity < 45) {
    GhostWindow_HWND:=0
    WinSet, Transparent, %GhostWindow_FormerOpacity%, ahk_id %GhostWindow_HWND%
    WinSet, ExStyle, -0x20, ahk_id %GhostWindow_HWND%
	  WinSet, AlwaysOnTop, Off, ahk_id %GhostWindow_HWND%
  } else {
    WinSet, Transparent, %GhostWindow_Opacity%, ahk_id %GhostWindow_HWND%
    WinSet, ExStyle, +0x20, ahk_id %GhostWindow_HWND%
	  WinSet, AlwaysOnTop, On, ahk_id %GhostWindow_HWND%
  }

return
