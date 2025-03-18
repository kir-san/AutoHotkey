OnClipboardChange(ClipChanged)

ClipChanged(DataType) {
    ToolTip("Add data to file: " A_Clipboard)
    FileAppend(A_Clipboard "`n", "D:\folders\spec_files\yt-dlp-music.conf")
    Sleep(1000)
    ToolTip()
}
