class SimpleGui {

    IsShow := false

    __New(title) {
        this.Instance := Gui("AlwaysOnTop -SysMenu -ToolWindow", title)
    }

    AddCommand(text) {
        this.Instance.AddText(, text)
    }

    Show() {
        this.Instance.Show()
        this.IsShow := true
    }

    Hide() {
        this.IsShow := false
        this.Instance.Hide()
    }

}