class SimpleGui {

    IsShow := false

    __New(title) {
        this.Instance := Gui("AlwaysOnTop -SysMenu -ToolWindow", title)
        this.timer := ObjBindMethod(this, "Hide")
    }

    AddCommand(text) {
        this.Instance.AddText(, text)
    }

    Show() {
        this.Instance.Show()
        this.IsShow := true

        SetTimer(this.timer, 5000)
    }

    Hide() {
        this.IsShow := false
        this.Instance.Hide()
        SetTimer(this.timer, 0)
    }

}