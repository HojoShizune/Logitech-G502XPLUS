-- Logitech G502XPLUS | Duration-Based Copy–Paste–Delete
-- 通过按下左键的持续时间来决定操作：短按粘贴，中按复制
-- 右键轮流按 a/b
-- 适用于需要快速操作的场景，避免多次点击
-- 注意：此脚本假设左键按下时不会有其他操作干扰

EnablePrimaryMouseButtonEvents(true)

local SHORT_MS = 140      -- <140ms 做“粘贴”
local pressTime = 0

local next_key = "b"      -- 右键轮流按键

function OnEvent(event, arg)
  -- 只处理左键
  if arg == 1 then
    if event == "MOUSE_BUTTON_PRESSED" then
      pressTime = GetRunningTime()
    elseif event == "MOUSE_BUTTON_RELEASED" then
      local now = GetRunningTime()
      local dt = now - pressTime
      Sleep(20)                             -- 防抖

      if dt < SHORT_MS then
        -- 短按：粘贴（Ctrl+V）
        PressKey("lctrl")
        PressAndReleaseKey("v")
        ReleaseKey("lctrl")
      else
        -- 中按：复制（Ctrl+C）
        PressKey("lctrl")
        PressAndReleaseKey("c")
        ReleaseKey("lctrl")
      end
    end
  end

  -- 右键轮流按 a/b
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