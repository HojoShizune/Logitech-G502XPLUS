EnablePrimaryMouseButtonEvents(true)
local next_key = "b"
function OnEvent(event, arg)
    if event == "MOUSE_BUTTON_PRESSED" and arg == 3 then
        PressKey(next_key)
        Sleep(50)
        ReleaseKey(next_key)
        if next_key == "b" then
            next_key = "a"
        else
            next_key = "b"
        end
    end
end


