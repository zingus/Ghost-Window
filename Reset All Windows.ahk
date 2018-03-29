;#SingleInstance force
;#Persistent

WinGet, win, list

Loop % win
{
  id:=win%a_index%
  WinGetTitle,Title, ahk_id %id%
  WinSet, Transparent,  255,  ahk_id %id%
  WinSet, ExStyle,    -0x20,  ahk_id %id%
  WinSet, AlwaysOnTop,  Off,  ahk_id %id%
  ;WinSet, Style,  +0xC00000,  ahk_id %id% ; removes window title bar
}
