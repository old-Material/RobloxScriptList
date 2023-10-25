local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Options = Fluent.Options


local Window = Fluent:CreateWindow({
    Title = "BloxRaid Hub",
    SubTitle = "@BladeBall",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.F8 
})

local Tabs = {
    Main = Window:AddTab({ Title = "MainMenu", Icon = "menu" }),
    Misc = Window:AddTab({ Title = "Misc", Icon = "boxes" }),
    CurseMode = Window:AddTab({ Title = "CurseMode", Icon = "cpu" }),
	Discord = Window:AddTab({ Title = "Discord", Icon = "bot" })
}
local RunService = game:GetService("RunService")
local connectHeartBeat
local closeRangeAttackRunservice
local player = game:GetService("Players").LocalPlayer
local ballsFold = game:GetService("Workspace").Balls
local playerAlive = game:GetService("Workspace").Alive
local Remotes = game.ReplicatedStorage.Remotes.ParryAttempt
local remoteSpinWheel = game:GetService("ReplicatedStorage").Remote.RemoteFunction
local remoteSwordCrates = game:GetService("ReplicatedStorage").Remotes.Store.RequestOpenSwordBox
local remoteExplosionCrates = game:GetService("ReplicatedStorage").Remotes.Store.RequestOpenExplosionBox

local openCratesDelay = 1
local openCratesOnOff = false
local ballPart = nil
local swordmasterDistance = 30
local color = BrickColor.new("Really red")
local closeRangeMultiply = 5
local closeRangeCount = 0
local closeRangePlayer = nil
local parried = false
local prePlayer = nil

local closeRangeEnable = false
local closeRangeDisable = 50
local closeRangeStack = 3
local closeRangeDetect = 0.20
local ballVeloOffset = 0.23

function onSwordMaster(step)
	if Fluent.Unloaded then
		connectHeartBeat:Disconnect()
		return
	end	
   
	if(Options.SwordMaster.Value == false) then
		connectHeartBeat:Disconnect()
		connectHeartBeat = nil
	end

    if Options.SwordMaster.Value == true then
        if aliveCheck() then
            FollowBall()
        end
    end
end

do --Main Menu
    Tabs.Main:AddSection("Auto Parry / Auto Close Range")

	Tabs.Main:AddToggle("AutoParry", 
		{
		Title = "AutoParry", 
		Description = "Full auto parry (long-mid-close)",
		Default = false,
		Callback = function(state)
		if state then
		else
			end
		end 
	})
    Tabs.Main:AddToggle("AutoCloseRange", 
		{
		Title = "AutoCloseRange", 
		Description = "When Enable, it will automatically detect close range and send spam.",
		Default = false,
		Callback = function(state)
            closeRangeEnable = state
		end 

	})
    Tabs.Main:AddSection("Setting")

    Tabs.Main:AddSlider("BallVeloOffset", 
    {
        Title = "DetectOffset",
        Description = "Used for calculating detection distance with ball speed.\nDefault value = 23 (Value for AutoParry)",
        Default = 0.23,
        Min = 0.20,
        Max = 0.50,
        Rounding = 2,
        Callback = function(Value)
            ballVeloOffset = Value
        end
    })

    Tabs.Main:AddSlider("CloseRangeDisable", 
    {
        Title = "CloseRangeDisable",
        Description = "If the distance between you and the interacting player Going outside this range.\nWill stop AutoCloseRange.\nDefault value = 50 (Value for AutoCloseRange)",
        Default = 50,
        Min = 10,
        Max = 100,
        Rounding = 0,
        Callback = function(Value)
            closeRangeDisable = Value
        end
    })

    Tabs.Main:AddSlider("CloseRangeStack", 
    {
        Title = "CloseRangeStack",
        Description = "Number of interactions with other players to run AutoCloseRange.\nHigher values ​​mean more interactions to trigger. AutoCloseRange.\nDefault value = 3 (Value for AutoCloseRange)",
        Default = 3,
        Min = 1,
        Max = 100,
        Rounding = 0,
        Callback = function(Value)
            closeRangeStack = Value
        end
    })

    Tabs.Main:AddSlider("CloseRangeMultiply", 
    {
        Title = "CloseRangeMultiply",
        Description = "AutoCloseRange spamming count within 1 second.\nIt can be calculated from the (value * 60).\nDefault value = 5 (Value for AutoCloseRange)",
        Default = 5,
        Min = 1,
        Max = 100,
        Rounding = 0,
        Callback = function(Value)
            closeRangeMultiply = Value
        end
    })

    Tabs.Main:AddSlider("CloseRangeDetect", 
    {
        Title = "CloseRangeDetect",
        Description = "The relative speed between Your distance from the interacting player and the speed of the ball.\nHigher values ​​will trigger AutoCloseRange is easier.\nDefault value = 0.20 (Value for AutoCloseRange)",
        Default = 0.20,
        Min = 0.10,
        Max = 1,
        Rounding = 2,
        Callback = function(Value)
            closeRangeDetect = Value
        end
    })



end

do --Misc
    
	Tabs.Misc:AddToggle("ExplosionCrates", 
		{
		Title = "Auto ExplosionCrates", 
		Description = "",
		Default = false,
		Callback = function(state)
		if state then
            task.spawn(autoOpenCrates)
		else
			end
		end 
	})

    Tabs.Misc:AddToggle("SwordsCrates", 
		{
		Title = "Auto SwordsCrates", 
		Description = "",
		Default = false,
		Callback = function(state)
		if state then
            task.spawn(autoOpenCrates)
		else
			end
		end 
	})

    Tabs.Misc:AddToggle("SpinWheel", 
		{
		Title = "Auto SpinWheel", 
		Description = "",
		Default = false,
		Callback = function(state)
		if state then
            task.spawn(autoOpenCrates)
		else
			end
		end 
	})

    Tabs.Misc:AddSlider("CratesDelay", 
    {
        Title = "Open Speed",
        Description = "A higher number means it will open faster.",
        Default = 1,
        Min = 1,
        Max = 10,
        Rounding = 0,
        Callback = function(Value)
            openCratesDelay = Value
        end
    })



end

do --SwordMaster
	Tabs.CurseMode:AddToggle("SwordMaster", 
		{
		Title = "SwordMaster", 
		Description = "Let the Sword master control your character \n(I know, it's retarded).",
		Default = false,
		Callback = function(state)
		if state then
			if (connectHeartBeat == nil) then
				connectHeartBeat = RunService.Heartbeat:Connect(onSwordMaster)
			end
		else
			end
		end 
	})

   Tabs.CurseMode:AddDropdown("SwordMasterSelection", {
        Title = "Select Mode",
        Description = "",
        Values = {"FollowBall", "FollowTarget", "FearBall", "FearTarget", "TeleportBall", "TeleportTarget", "Aiplay", "SwordMaster"},
        Multi = false,
        Default = 1,
    })

    Tabs.Misc:AddSlider("SwordMasterDistance", 
    {
        Title = "Distance",
        Description = "The distance between the player and the target.\n Follow mode, it will follow until the selected distance is reached.\n Fear mode, it will retreat until it reaches the selected distance.",
        Default = 30,
        Min = 1,
        Max = 100,
        Rounding = 0,
        Callback = function(Value)
            swordmasterDistance = Value
        end
    })

    Tabs.CurseMode:AddButton(
		{
		Title = "Test", 
		Description = "",
		Callback = function()
            funcName = "FollowBall"

            newFunc = loadFunc(funcName)

            newFunc()
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

function AiWalk()
    local pfs = game:GetService("PathfindingService")
    local dummy = player.Character
    local part = game:GetService("Workspace").Spawn.Sign
    local path = pfs:CreatePath()
    path:ComputeAsync(dummy.HumanoidRootPart.Position,part.Position)
    for _, waypoint in pairs(path:GetWaypoints()) do
        dummy.Humanoid:MoveTo(waypoint.Position)
        dummy.Humanoid.MoveToFinished:wait()
    end
end
function FollowBall() 
    --if ballPart == nil then return end
    print(ballPart.Position)
    local humanoidPlayer = player.Character.Humanoid
    local part = ballPart.Position
    local ballDistance = (part - player.Character.HumanoidRootPart.Position).Magnitude
    if(ballDistance >= 10) then
        humanoidPlayer:MoveTo(part)
    end

end

function aliveCheck()

    local isAlive = false
    for _, alivePlayer in ipairs(game:GetService("Workspace").Alive:GetChildren()) do
        if alivePlayer.Name == player.Name then
            isAlive = true
            break
        end
    end
    return isAlive
end
function autoOpenCrates()
    if openCratesOnOff then
        return
    end
    openCratesOnOff = true
    while true do
        if (not Options.ExplosionCrates.Value) and (not Options.SwordsCrates.Value) and (not Options.SpinWheel.Value) then openCratesOnOff = false return end
        if Options.ExplosionCrates.Value then 
            remoteExplosionCrates:InvokeServer()
        end
        if Options.SwordsCrates.Value then 
            remoteSwordCrates:InvokeServer()
        end
        if Options.SpinWheel.Value then
            remoteSpinWheel:InvokeServer("SpinWheel")
        end
        task.wait(1 / (1 + openCratesDelay))
    end
    openCratesOnOff = false

end


function getClosePlayerDistance()
    if closeRangePlayer == nil then return 1 end
    local playerPosition = player.Character:WaitForChild("HumanoidRootPart").Position
    local playerCloserange = playerAlive:WaitForChild(closeRangePlayer):WaitForChild("HumanoidRootPart").Position
    return (playerCloserange - playerPosition).Magnitude
end

function closeRangeAttackService(step)

	if Fluent.Unloaded then
		closeRangeAttackRunservice:Disconnect()
		return
	end	
	if(Options.AutoParry.Value == false) then
		closeRangeAttackRunservice:Disconnect()
		closeRangeAttackRunservice = nil
        return
	end
    if closeRangeAttackRunservice == nil or getClosePlayerDistance() == nil then return end
    print("Still Call")
    if closeRangePlayer == nil then closeRangeAttackRunservice:Disconnect() closeRangeAttackRunservice = nil return end
    if closeRangeCount <= 0 then closeRangeAttackRunservice:Disconnect() closeRangeAttackRunservice = nil return end
    if getClosePlayerDistance() >= closeRangeDisable then closeRangeAttackRunservice:Disconnect() closeRangeAttackRunservice = nil return end
    
    for i = 1, closeRangeMultiply do
        Remotes:FireServer(0.5,CFrame.new(),{},{})
        Remotes:FireServer(0.5,CFrame.new(),{},{})
        Remotes:FireServer(0.5,CFrame.new(),{},{})
        print("Runservice")
    end

end

function getBallVelocity()
    local ball = ballsFold:GetChildren()
    for _, Child in ipairs(ball) do
        return Child.Velocity.Magnitude
    end    
end

function getBallTarget()
    local ball = ballsFold:GetChildren()
    for _, Child in ipairs(ball) do
        return Child:GetAttributes().target
    end    
end


ballsFold.ChildAdded:Connect(function(Ball)
    
    ballPart = Ball
    if Fluent.Unloaded then return end
    if not Options.AutoParry.Value then return end
    local hrpPlayer = player.Character:WaitForChild("HumanoidRootPart")
    closeRangePlayer = nil
    prePlayer = nil
    parried = false
        Ball:GetPropertyChangedSignal("BrickColor"):Connect(function()

            parried = false
            local playerPosition = hrpPlayer.Position
            local ballPosition = Ball.Position
            local distanceBetween = (ballPosition - playerPosition).Magnitude
            local ballVelocitySpeed = getBallVelocity()
            local closeRangeDetectCall = getClosePlayerDistance() / ballVelocitySpeed
            if closeRangeCount >= closeRangeStack and closeRangeDetectCall < closeRangeDetect and closeRangeEnable then
                if (closeRangeAttackRunservice == nil) then
                    closeRangeAttackRunservice = RunService.Heartbeat:Connect(closeRangeAttackService)    
                end
            end
            if Ball.BrickColor == color then
                if distanceBetween < 20 then
                    Remotes:FireServer(0.5, CFrame.new(), {}, {})
                    print("B1")
                    parried = true
                elseif distanceBetween < 30 and ballVelocitySpeed > 50 then
                    Remotes:FireServer(0.5, CFrame.new(), {}, {})
                    print("B2")
                    parried = true

                elseif distanceBetween < 40 and ballVelocitySpeed > 100 then
                    Remotes:FireServer(0.5, CFrame.new(), {}, {})
                    print("B3")

                elseif distanceBetween < 50 and ballVelocitySpeed > 150 then
                    Remotes:FireServer(0.5, CFrame.new(), {}, {})
                    print("B4")
                    parried = true
                end
            end
        end)

        Ball:GetPropertyChangedSignal("Position"):Connect(function()
            if getBallTarget() ~= prePlayer then
                parried = false
                prePlayer = getBallTarget()
                if prePlayer ~= player.Name then
                    if prePlayer == closeRangePlayer then
                        closeRangeCount += 1
                    else
                        closeRangePlayer = prePlayer
                        closeRangeCount = 0
                    end
                end
            end
            local playerPosition = hrpPlayer.Position
            local ballPosition = Ball.Position
            local ballVelocitySpeed = getBallVelocity()
            local distanceBetween = (ballPosition - playerPosition).Magnitude
            local detectionDistance = 10 + (ballVelocitySpeed * ballVeloOffset)
            local midRangeDetect = distanceBetween / ballVelocitySpeed
            local closeRangeDetectCall = getClosePlayerDistance() / ballVelocitySpeed
            if closeRangeCount >= closeRangeStack and closeRangeDetectCall < closeRangeDetect and closeRangeEnable then
                if (closeRangeAttackRunservice == nil) then
                    closeRangeAttackRunservice = RunService.Heartbeat:Connect(closeRangeAttackService)    
                end
            end

            if (Ball.BrickColor == color) or (getBallTarget() == player.Name) then 
                if parried then return end
                if distanceBetween <= detectionDistance then
                    Remotes:FireServer(0.5,CFrame.new(),{},{})
                    parried = true
                    print("P1")
                    return
                end
                if midRangeDetect < 0.25 then
                    Remotes:FireServer(0.5,CFrame.new(),{},{})
                    parried = true
                    print("P2")
                    return
                end
            end
        end)
end)


closeRangeAttackRunservice = nil
connectHeartBeat = nil
--Setting Window
Fluent:ToggleTransparency(false)
Fluent:ToggleAcrylic(false)
Window:SelectTab(1)
