#SingleInstance force

title := "WinAtaman"

mygui := Gui("AlwaysOnTop -SysMenu -ToolWindow", title)

mygui.Add("Text", ,"T - terminal")
mygui.Add("Text", ,"S - Sublime Text")
mygui.Add("Text", ,"E - Edit programm code")
mygui.Add("Text", ,"Esc - Close window")

#v:: {
    mygui.Show()
}

#HotIf WinExist(title)
Esc:: {
    mygui.Hide()
}

#HotIf WinExist(title)
t::{
    mygui.Hide()
    Run "C:\Users\kir-san\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\wt.exe"
}

#HotIf WinExist(title)
s::{
    mygui.Hide()
    Run "C:\Program Files\Sublime Text\sublime_text.exe"
}

#HotIf WinExist(title)
e::{
    mygui.Hide()
    Run "code.cmd D:\Projects\AutoHotkey\test.ahk"
}