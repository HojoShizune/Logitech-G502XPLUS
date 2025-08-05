-- Logitech G502XPLUS | Duration-Based Copy–Paste–Delete
-- 通过按下左键的持续时间来决定操作：短按粘贴，中按复制
-- 适用于需要快速操作的场景，避免多次点击
-- 注意：此脚本假设左键按下时不会有其他操作干扰

local SHORT_MS = 140      -- <140ms 做“粘贴”
local DOUBLE_CLICK_MS = 400 -- 双击最大间隔
local pressTime = 0
local lastReleaseTime = 0
local clickCount = 0
local lastDoubleClickTime = 0
local doubleClickCount = 0

function OnEvent(event, arg)
  -- 只处理左键
  if arg ~= 1 then return end

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