#SingleInstance force
#Include "SimpleGui.ahk"
#Include "Utils.ahk"
#Include "AppsOnScreens.ahk"
#Include BrightnessGui.ahk

mainWindow := SimpleGui("WinAtaman")
utilsWindow := SimpleGui("Utils")
appsWindow := SimpleGui("Apps on Screens")
brightness := BrightnessGui()

ListOpenWindows()

#b:: {
    if (!mainWindow.IsShow)
        mainWindow.Show()
}

; ##### Main
; mainWindow.AddCommand("T - terminal")
; #HotIf mainWindow.IsShow
; t:: {
;     mainWindow.Hide()
;     Run("C:\Users\kir-san\AppData\Local\Microsoft\WindowsApps\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\wt.exe")
; }

mainWindow.AddCommand("S - Sublime Text")
#HotIf mainWindow.IsShow
s:: {
    mainWindow.Hide()
    Run("C:\Program Files\Sublime Text\sublime_text.exe")
}

mainWindow.AddCommand("U - Utils")
#HotIf mainWindow.IsShow
u:: {
    mainWindow.Hide()
    utilsWindow.Show()
}

mainWindow.AddCommand("W - windows")
#HotIf mainWindow.IsShow
w:: {
    mainWindow.Hide()
    appsWindow.Show()
}

mainWindow.AddCommand("Esc - Close window")
#HotIf mainWindow.IsShow
Esc:: {
    mainWindow.Hide()
}

; ##### Utils
utilsWindow.AddCommand("S - Stability Matrix")
#HotIf utilsWindow.IsShow
s:: {
    utilsWindow.Hide()
    Run("C:\Users\user\StabilityMatrix\StabilityMatrix.exe")
}

#HotIf utilsWindow.IsShow
Esc:: {
    utilsWindow.Hide()
    mainWindow.Show()
}


; ##### Apps Windows
appsWindow.AddCommand("M - Default configuration for 2 Screens")
#HotIf appsWindow.IsShow
m:: {
    appsWindow.Hide()
    SetPositionForWindowsInMultiScreens()
}


; ##### Brightness
mainWindow.AddCommand("B - Brightness")
#HotIf mainWindow.IsShow
b:: {
    mainWindow.Hide()
    brightness.Show()
}

#HotIf brightness.IsShow
Esc:: {
    brightness.Hide()
    mainWindow.Show()
}