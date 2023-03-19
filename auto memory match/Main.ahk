#Include Functions.ahk
#Include Paths.ahk
global keyboardtype := "azerty"
global haststatus := 34


F2::
Reload
return
F1::
Memory.Path(1)
msgbox,done
