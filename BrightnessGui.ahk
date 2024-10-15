class BrightnessGui {

    IsShow := false

    __New() {
        this.Instance := Gui("AlwaysOnTop -SysMenu -ToolWindow", "Brightness Controll")
        this.timer := ObjBindMethod(this, "Hide")
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