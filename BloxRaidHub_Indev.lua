local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Options = Fluent.Options

-- Main Window 
local Window = Fluent:CreateWindow({
    Title = "BloxRaid Hub",
    SubTitle = "@Selecting Maplists",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.F8 -- Used when theres no MinimizeKeybind
})

-- Fluent provides Lucide Icons, they are optional
local Tabs = {
    Main = Window:AddTab({ Title = "MainMenu", Icon = "menu" }),
	Discord = Window:AddTab({ Title = "Discord", Icon = "bot" })
}

do --Run Script
	Tabs.Main:AddButton({
    Title = "HazePiece",
    Description = "Click to copy",
    Callback = function()
            print("HazePiece")
		end
	})
end


do --Discord
	Tabs.Discord:AddButton({
    Title = "discord.gg/MMJdEDa9Ek",
    Description = "Click to copy",
    Callback = function()
		setclipboard(tostring("https://discord.gg/MMJdEDa9Ek"))
		Fluent:Notify({
        Title = "⚠️ BloxRaid Hub Notification",
        Content = "Discord link copied.",
        SubContent = "", -- Optional
        Duration = 3 -- Set to nil to make the notification not disappear
		})
		end
	})
end
wait(3)
if(game.PlaceId == 6918802270) then
    
    Fluent:Destroy()
end

--Setting Window
Fluent:ToggleTransparency(false)
Fluent:ToggleAcrylic(false)
Window:SelectTab(1)