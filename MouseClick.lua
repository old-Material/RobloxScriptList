local virtual_input_manager = game:GetService("VirtualInputManager")

local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local x = 0
local y = 0
virtual_input_manager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
virtual_input_manager:SendMouseMoveEvent(x, y,game)


