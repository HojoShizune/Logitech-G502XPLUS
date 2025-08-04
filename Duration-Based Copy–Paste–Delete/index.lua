-- Logitech G502XPLUS | Duration-Based Copy–Paste–Delete
-- 通过按下左键的持续时间来决定操作：短按粘贴，中按复制，长按删除
-- 适用于需要快速操作的场景，避免多次点击
-- 注意：此脚本假设左键按下时不会有其他操作干扰
local SHORT_MS = 200      -- <200ms 做“粘贴”
local LONG_MS  = 3000     -- ≥3000ms 做“删除”
local pressTime = 0

function OnEvent(event, arg)
  if arg ~= 1 then return end            -- 只处理左键

  if event == "MOUSE_BUTTON_PRESSED" then
    pressTime = GetRunningTime()

  elseif event == "MOUSE_BUTTON_RELEASED" then
    local dt = GetRunningTime() - pressTime
    Sleep(20)                             -- 防抖

    if dt < SHORT_MS then
      PressAndReleaseKey("lctrl", "v")    -- 短按：粘贴
    elseif dt < LONG_MS then
      PressAndReleaseKey("lctrl", "c")    -- 中按：复制
    else
      PressAndReleaseKey("delete")        -- 长按：删除
    end
  end
end
