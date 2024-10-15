; Функция для перечисления всех открытых окон
ListOpenWindows() {
    windows := WinGetList()

    wins := Array()

    Loop windows.Length {
        hwnd := windows[A_Index]
        title := WinGetTitle(hwnd)
        if (title != "") {
            WinGetClientPos(&Xpos, &Ypos, &width, &height, hwnd)
            ; controls := WinGetControls(hwnd)
            wins.Push({
                hwnd: hwnd, title: title, proccess: WinGetProcessName(hwnd),
                x: Xpos, y: Ypos, height: height, width: width
            }
            )
        }
    }
    return wins
}

WindowsSettings() {
    return Map(
        "Telegram.exe", { x: 3560, y: 0, height: 1158, width: 992 },
        "WindowsTerminal.exe", { x: 3550, y: 0, height: 1158, width: 1000 },
        "vivaldi.exe", { x: 2560, y: 0, height: 1158, width: 1000, title: "YouTube Music - Vivaldi" },
        "Taskmgr.exe", { x: 2560, y: 0, height: 600, width: 1000, admin: true },
    )
}

MonitorsInfo() {
    MonitorCount := MonitorGetCount()
    MonitorPrimary := MonitorGetPrimary()
    MsgBox("Monitor Count:`t" MonitorCount "`nPrimary Monitor:`t" MonitorPrimary)
    Loop MonitorCount
    {
        MonitorGet(A_Index, &L, &T, &R, &B)
        MonitorGetWorkArea(A_Index, &WL, &WT, &WR, &WB)
        MsgBox(
            "Monitor:`t#" A_Index "`n"
            " Name: `t " MonitorGetName(A_Index) "`n"
            " Left: `t " L " (" WL " work)" "`n"
            " Top: `t " T " (" WT " work)" "`n"
            " Right: `t " R " (" WR " work)" "`n"
            " Bottom: `t " B " (" WB " work) " "`n"
        )
    }
}

; MonitorsInfo()

SetPositionForWindowsInMultiScreens() {

    if (MonitorGetCount() = 1)
        return

    settings := WindowsSettings()
    for window in ListOpenWindows() {
        if (settings.Has(window.proccess)) {
            windowSettings := settings.Get(window.proccess)

            if (!windowSettings.HasOwnProp("title")
                || (windowSettings.HasOwnProp("title") && windowSettings.title = window.title)) {

                if (windowSettings.HasOwnProp("admin") && windowSettings.admin && !A_IsAdmin) {
                    continue
                }

                Sleep(500)

                WinMove(
                    windowSettings.x,
                    windowSettings.y,
                    windowSettings.width,
                    windowSettings.height,
                    window.hwnd
                )
            }
        }
    }
}

; SetPositionForWindowsInMultiScreens()