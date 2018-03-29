;#SingleInstance force
;#Persistent

WinGet, win, list

Loop % win
{
  hwnd:=DebugWindow("win" . a_index,1)
  WinSet, Transparent,  255,  ahk_id win%a_index%
  WinSet, ExStyle,    -0x20,  ahk_id win%a_index%
  WinSet, AlwaysOnTop,  Off,  ahk_id win%a_index%
  WinSet, Style,  -0xC00000,  ahk_id win%a_index%
}
