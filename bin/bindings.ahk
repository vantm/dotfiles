#Requires AutoHotkey v2.0

!?:: {
    pid := ProcessExist("everything")
    if (pid) {
        ProcessClose("Everything.exe")
    }
    else {
        Run("everything")
    }
}
