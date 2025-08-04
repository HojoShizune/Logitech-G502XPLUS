-- Logitech G502XPLUS | Mode-Cycle Copy–Paste–Delete (using G4 to switch mode)
-- 左键（1）执行：复制→粘贴→删除，侧键 G4（4）切换模式
-- 如果想用 G5（button 5）来切换，也只需把 arg == 4 改成 arg == 5 即可
-- 适用于需要快速切换操作的场景
-- 注意：此脚本假设左键按下时不会有其他操作干扰
local mode = 1   -- 1=Copy, 2=Paste, 3=Delete

function OnEvent(event, arg)
  -- 按 G4 (button 4) 切换模式
  if arg == 4 and event == "MOUSE_BUTTON_PRESSED" then
    mode = mode % 3 + 1
    -- 可选提示：
    -- PlaySound("SwitchMode.wav")
    -- SetLightColor(0, 255 * (mode==2 and 1 or 0), 255 * (mode==3 and 1 or 0))
    return
  end

  -- 按左键 (button 1) 执行当前模式
  if arg == 1 and event == "MOUSE_BUTTON_PRESSED" then
    if mode == 1 then
      PressAndReleaseKey("lctrl", "c")    -- 模式1：复制
    elseif mode == 2 then
      PressAndReleaseKey("lctrl", "v")    -- 模式2：粘贴
    else
      PressAndReleaseKey("delete")        -- 模式3：删除
    end
  end
end
