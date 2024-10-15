OnClipboardChange(ClipChanged)

ClipChanged(DataType) {
    ToolTip("Add data to file: " A_Clipboard)
    FileAppend(A_Clipboard "`n", "D:\folders\spec_files\links.txt")
    Sleep(1000)
    ToolTip()
}

