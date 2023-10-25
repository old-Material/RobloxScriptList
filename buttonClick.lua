
local Button = game:GetService("Players").bigaboommm.PlayerGui.QuestGui.MainFrame.Frame.ExitButton.Button
local events = { "MouseButton1Click", "MouseButton1Down", "MouseButton1Up", "Activated" }
for i, v in next, events do firesignal(Button[v]) end

