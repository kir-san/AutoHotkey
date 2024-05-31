#SingleInstance force
#Include "SimpleGui.ahk"

mainWindow := SimpleGui("WinAtaman")

mainWindow.AddCommand("T - terminal")
#HotIf mainWindow.IsShow
t:: {
    mainWindow.Hide()
    Run("C:\Users\kir-san\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\wt.exe")
}

mainWindow.AddCommand("S - Sublime Text")
#HotIf mainWindow.IsShow
s:: {
    mainWindow.Hide()
    Run("C:\Program Files\Sublime Text\sublime_text.exe")
}

mainWindow.AddCommand("E - Edit programm code")
#HotIf mainWindow.IsShow
e:: {
    mainWindow.Hide()
    Run("code.cmd")
}

mainWindow.AddCommand("Esc - Close window")
#HotIf mainWindow.IsShow
Esc:: {
    mainWindow.Hide()
}


AppsKey & v:: {
    if (!mainWindow.IsShow)
        mainWindow.Show()
}