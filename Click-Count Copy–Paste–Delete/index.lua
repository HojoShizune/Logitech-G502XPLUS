-- Logitech G502XPLUS | Click-Count Copy–Paste–Delete
-- 通过左键点击次数来决定操作：单击粘贴，双击复制，三击删除
-- 适用于需要快速操作的场景，避免多次点击
local CLICK_WINDOW = 300  -- ms，时间窗口内累计点击次数
local clickCount = 0
local lastTime   = 0

function OnEvent(event, arg)
  if arg ~= 1 or event ~= "MOUSE_BUTTON_PRESSED" then return end

  local now = GetRunningTime()
  if now - lastTime > CLICK_WINDOW then
    clickCount = 0
  end
  clickCount = clickCount + 1
  lastTime   = now

  -- 延迟判断，等待完整点击序列
  Sleep(CLICK_WINDOW)

  if clickCount == 1 then
    PressAndReleaseKey("lctrl", "v")      -- 单击：粘贴
  elseif clickCount == 2 then
    PressAndReleaseKey("lctrl", "c")      -- 双击：复制
  else
    PressAndReleaseKey("delete")          -- 三击及以上：删除
  end
  clickCount = 0
end
