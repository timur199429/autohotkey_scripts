#NoEnv
SendMode Input

; Toggle variable to switch between images
toggle := 0

SetBackgroundToImage()
{
    global toggle
    ; Check the toggle value and set the desktop wallpaper accordingly
    if (toggle = 0) {
        ; Set the desktop wallpaper to the first image
        DllCall("SystemParametersInfo", "UInt", 0x14, "UInt", 0, "Str", "C:\Users\Timurrr\Desktop\google_drive\bing-backgrounds\OrkneyStones_1920x1080.jpg", "UInt", 0x01)
        toggle := 1
    } else {
        ; Set the desktop wallpaper to the second image
        DllCall("SystemParametersInfo", "UInt", 0x14, "UInt", 0, "Str", "C:\Users\Timurrr\Desktop\google_drive\bing-backgrounds\1920x1080-black-solid-color-background.jpg", "UInt", 0x01)
        toggle := 0
    }
}

; Bind the script to Win + T
#Up::
    SetBackgroundToImage()
    Return



#Down::
   VarSetCapacity(APPBARDATA, A_PtrSize=4 ? 36:48)
   NumPut(DllCall("Shell32\SHAppBarMessage", "UInt", 4 ; ABM_GETSTATE
                                           , "Ptr", &APPBARDATA
                                           , "Int")
 ? 2:1, APPBARDATA, A_PtrSize=4 ? 32:40) ; 2 - ABS_ALWAYSONTOP, 1 - ABS_AUTOHIDE
 , DllCall("Shell32\SHAppBarMessage", "UInt", 10 ; ABM_SETSTATE
                                    , "Ptr", &APPBARDATA)
   KeyWait, % A_ThisHotkey
   Return

#Right::
    Click, right, %A_MouseX%, %A_MouseY%
    Sleep, 100  ; Add a small delay before sending key presses
    Send, {Right}
	Sleep, 100
	Send, {Up}
	Sleep, 100
	Send, {Enter}
   
return