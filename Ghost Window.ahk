#SingleInstance force
;#NoTrayIcon
#Persistent

global GhostWindow_HWND:=0
global GhostWindow_Opacity:=0
global GhostWindow_FormerOpacity:=0

+#G::
  global GhostWindow_HWND
  global GhostWindow_Opacity
  global GhostWindow_FormerOpacity
  
  x:=ConsoleLog("H " . GhostWindow_HWND)
  x:=ConsoleLog("O " . GhostWindow_Opacity)
  x:=ConsoleLog("F " . GhostWindow_FormerOpacity)

  if(!GhostWindow_HWND) {
    WinGet GhostWindow_HWND,ID,A
    x:=ConsoleLog("HWND " . GhostWindow_HWND)
    WinGet GhostWindow_FormerOpacity, Transparent, ahk_id %GhostWindow_HWND%
    GhostWindow_Opacity:=GhostWindow_FormerOpacity

    x:=ConsoleLog("_H " . GhostWindow_HWND)
    x:=ConsoleLog("_O " . GhostWindow_Opacity)
    x:=ConsoleLog("_F " . GhostWindow_FormerOpacity)
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
