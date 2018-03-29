#SingleInstance force

DebugWindow_HWND:=0

/*
*/

DebugWindow_Init()
{
  global DebugWindow_HWND
  global DebugWindow_TextField
  if(!DebugWindow_HWND) {
    Gui New,hwndDebugWindow_HWND ToolWindow,DebugWindow
    ;Gui Add,Text,w300 h300 vDebugWindow_TextField ReadOnly,...
    Gui Add,ListView,w300 h300 vDebugWindow_TextField ReadOnly,Text
    Gui Show
  }
  return DebugWindow_HWND
}

DebugWindow(text,append:=0)
{
  global DebugWindow_TextField
  hwnd:=DebugWindow_Init()
  Gui %hwnd%:Default
  Gui ListView,DebugWindow_TextField
  if (append) {
    LV_Add("Focus",text)
    ;GuiControlGet,prev,,DebugWindow_TextField
    ;prev.=""
  } else {
    if(!LV_GetCount())
      LV_Add("","")
    LV_Modify(1,"Focus",text)
    ;prev.="`n"
  }
  ;GuiControl,,DebugWindow_TextField,%prev%%text%
  return hwnd
}
