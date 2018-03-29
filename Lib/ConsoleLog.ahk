#SingleInstance force

global ConsoleLog_HWND:=0
global ConsoleLog_Control

ConsoleLog_Init()
{
  if(!ConsoleLog_HWND) {
    Gui New,hwndConsoleLog_HWND ToolWindow,ConsoleLog
    ;Gui Add,Text,w300 h300 vDebugWindow_TextField ReadOnly,...
    Gui Add,ListView,w300 h300 vConsoleLog_Control ReadOnly,Text
    Gui Show
  }
  return ConsoleLog_HWND
}

ConsoleLog(text,track:=0)
{
  hwnd:=ConsoleLog_Init()
  Gui %hwnd%:Default
  Gui ListView,ConsoleLog_Control
  if (!track) {
    LV_Add("Focus",text)
    ;GuiControlGet,prev,,ConsoleLog_Control
    ;prev.=""
  } else {
    if(!LV_GetCount())
      LV_Add("","")
    LV_Modify(1,"Focus",text)
    ;prev.="`n"
  }
  ;GuiControl,,ConsoleLog_Control,%prev%%text%
  return hwnd
}
