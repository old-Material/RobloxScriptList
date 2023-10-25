local KeySystemUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master/ui/xrer_mstudio45.lua"))()
KeySystemUI.New({
    ApplicationName = "BloxRaidCommunity", 
    Name = "BloxRaid Hub", 
    Info = "", 
    DiscordInvite = "https://discord.gg/MMJdEDa9Ek"
})

function onPerd()
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    local Options = Fluent.Options
    
    -- Main Window 
    local Window = Fluent:CreateWindow({
        Title = "BloxRaid Hub |",
        SubTitle = "@HazePiece",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.F8 -- Used when theres no MinimizeKeybind
    })
    
    -- Fluent provides Lucide Icons, they are optional
    local Tabs = {
        Farm = Window:AddTab({ Title = "Farm/Quest", Icon = "scroll" }),
        Stats = Window:AddTab({ Title = "Stats", Icon = "line-chart" }),
        Teleport = Window:AddTab({ Title = "Teleport", Icon = "map-pin" }),
        Swords = Window:AddTab({ Title = "Sword", Icon = "sword" }),
        FightingStyle = Window:AddTab({ Title = "FightingStyle", Icon = "grab" }),
        Misc = Window:AddTab({ Title = "Misc", Icon = "bar-chart-2" }),
        Discord = Window:AddTab({ Title = "Discord", Icon = "bot" })
    }
    
    
    local connectHeartBeat 
    local seaOne = {
        { questLevel = 1, isLand = "Starter Island", isLandPosition = Vector3.new(-2185, 144, -3240), monster = "Thief", npcId = "1" },
        { questLevel = 10, isLand = "Starter Island", isLandPosition = Vector3.new(-2185, 144, -3240), monster = "Bandit", npcId = "1" },
        { questLevel = 40, isLand = "Clown Island", isLandPosition = Vector3.new(-2173, 114, -611), monster = "Pirate Clown", npcId = "2" },
        { questLevel = 90, isLand = "Shark Park", isLandPosition = Vector3.new(-4903, 117, -2819), monster = "Fishman", npcId = "3" },
        { questLevel = 160, isLand = "Desert Ruins", isLandPosition = Vector3.new(-5274, 131, -687), monster = "Desert Thief", npcId = "4" },
        { questLevel = 250, isLand = "Sea Restaurant", isLandPosition = Vector3.new(-5971, 154, 2411), monster = "Krieg Pirate", npcId = "5" },
        { questLevel = 350, isLand = "Logue Town", isLandPosition = Vector3.new(-2859, 118, 1917), monster = "Marine Recruit", npcId = "6" },
        { questLevel = 450, isLand = "Tall Woods", isLandPosition = Vector3.new(50, 110, 2298), monster = "Monkey", npcId = "7" },
        { questLevel = 500, isLand = "Tall Woods", isLandPosition = Vector3.new(50, 110, 2298), monster = "Gorilla", npcId = "7" },
        { questLevel = 600, isLand = "Marine Base Town", isLandPosition = Vector3.new(558, 151, 5675), monster = "Marine Grunt", npcId = "8" },
        { questLevel = 700, isLand = "Three Islands", isLandPosition = Vector3.new(-2404, 785, 5551), monster = "Satyr", npcId = "9" },
        { questLevel = 800, isLand = "Marine HQ", isLandPosition = Vector3.new(-6152, 119, 6881), monster = "Elite Marine", npcId = "10" },
        { questLevel = 950, isLand = "Sky Islands", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Sandorian Warrior", npcId = "11" },
        { questLevel = 1000, isLand = "Sky Islands", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Divine Soldier", npcId = "11" },
        { questLevel = 1050, isLand = "Sky Islands", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Holy Soldier", npcId = "12" },
        { questLevel = 1150, isLand = "Revolutionary Base", isLandPosition = Vector3.new(3717, 134, 3952), monster = "Revolutionary", npcId = "13" },
        { questLevel = 1200, isLand = "Revolutionary Base", isLandPosition = Vector3.new(3717, 134, 3952), monster = "Revolutionary Elite", npcId = "13" },
        { questLevel = 1300, isLand = "Impel Jail", isLandPosition = Vector3.new(3666, 116, 6727), monster = "Impel Guard", npcId = "14" },
        { questLevel = 1350, isLand = "Impel Jail", isLandPosition = Vector3.new(3666, 116, 6727), monster = "Impel Elite", npcId = "14" },
        { questLevel = 1450, isLand = "Cold Island", isLandPosition = Vector3.new(2624, 116, -2546), monster = "Corrupt Marine", npcId = "15" },
        { questLevel = 1600, isLand = "Fishman Island", isLandPosition = Vector3.new(6704, 111, -2622), monster = "Island Fishman", npcId = "16" },
        { questLevel = 1650, isLand = "Fishman Island", isLandPosition = Vector3.new(6704, 111, -2622), monster = "Fishman Elite", npcId = "16" },
        { questLevel = 1750, isLand = "Skull Island", isLandPosition = Vector3.new(6707, 114, 92), monster = "Skull Pirate", npcId = "17" },
        { questLevel = 1800, isLand = "Skull Island", isLandPosition = Vector3.new(6707, 114, 92), monster = "Pirate Elite", npcId = "17" },
        { questLevel = 1900, isLand = "Bubble Island", isLandPosition = Vector3.new(7056, 114, 2726), monster = "Pirate", npcId = "18" },
        { questLevel = 1950, isLand = "Bubble Island", isLandPosition = Vector3.new(7056, 114, 2726), monster = "Armored Marine", npcId = "18" },
        { questLevel = 2050, isLand = "Thriller Boat", isLandPosition = Vector3.new(7462, 111, 6574), monster = "Skeleton", npcId = "19" },
        { questLevel = 2100, isLand = "Thriller Boat", isLandPosition = Vector3.new(7462, 111, 6574), monster = "Mummy", npcId = "19" },
    }
    local seaTwo = {
        { questLevel = 2200, isLand = "Flower Capital", isLandPosition = Vector3.new(2605, 100, 15908), monster = "Samurai", npcId = "1" },
        { questLevel = 2250, isLand = "Flower Capital", isLandPosition = Vector3.new(2605, 100, 15908), monster = "Strong Samurai", npcId = "1" },
        { questLevel = 2300, isLand = "Flower Capital", isLandPosition = Vector3.new(2605, 100, 15908), monster = "Shinobi", npcId = "1" },
        { questLevel = 2350, isLand = "Flower Capital", isLandPosition = Vector3.new(2605, 100, 15908), monster = "Shinobi Elite", npcId = "1" },
    
        { questLevel = 2400, isLand = "Udon Prison", isLandPosition = Vector3.new(1978, 118, 11978), monster = "Officer Guard", npcId = "2" },
        { questLevel = 2450, isLand = "Udon Prison", isLandPosition = Vector3.new(1978, 118 ,11978), monster = "Sergeant Guard", npcId = "2" },
    
    
        { questLevel = 2550, isLand = "Snowy Graveyard", isLandPosition = Vector3.new(6925, 142, 16149), monster = "Graverobber", npcId = "3" },
        { questLevel = 2600, isLand = "Snowy Graveyard", isLandPosition = Vector3.new(6925, 142 ,16149), monster = "Elite Graverobber", npcId = "3" },
    
        { questLevel = 2700, isLand = "Desert City", isLandPosition = Vector3.new(7688, 119, 11594), monster = "Desert Pirate", npcId = "4" },
        { questLevel = 2750, isLand = "Desert City", isLandPosition = Vector3.new(7688, 119 ,11594), monster = "Desert Captain", npcId = "4" },
    
    }
    local gameData = {
        { questLevel = 1, isLand = "Starter Island", isLandPosition = Vector3.new(-2185, 144, -3240), monster = "Thief", npcId = "1" },
        { questLevel = 10, isLand = "Starter Island", isLandPosition = Vector3.new(-2185, 144, -3240), monster = "Bandit", npcId = "1" },
        { questLevel = 40, isLand = "Clown Island", isLandPosition = Vector3.new(-2173, 114, -611), monster = "Pirate Clown", npcId = "2" },
        { questLevel = 90, isLand = "Shark Park", isLandPosition = Vector3.new(-4903, 117, -2819), monster = "Fishman", npcId = "3" },
        { questLevel = 160, isLand = "Desert Ruins", isLandPosition = Vector3.new(-5274, 131, -687), monster = "Desert Thief", npcId = "4" },
        { questLevel = 250, isLand = "Sea Restaurant", isLandPosition = Vector3.new(-5971, 154, 2411), monster = "Krieg Pirate", npcId = "5" },
        { questLevel = 350, isLand = "Logue Town", isLandPosition = Vector3.new(-2859, 118, 1917), monster = "Marine Recruit", npcId = "6" },
        { questLevel = 450, isLand = "Tall Woods", isLandPosition = Vector3.new(50, 110, 2298), monster = "Monkey", npcId = "7" },
        { questLevel = 500, isLand = "Tall Woods", isLandPosition = Vector3.new(50, 110, 2298), monster = "Gorilla", npcId = "7" },
        { questLevel = 600, isLand = "Marine Base Town", isLandPosition = Vector3.new(558, 151, 5675), monster = "Marine Grunt", npcId = "8" },
        { questLevel = 700, isLand = "Three Islands", isLandPosition = Vector3.new(-2404, 785, 5551), monster = "Satyr", npcId = "9" },
        { questLevel = 800, isLand = "Marine HQ", isLandPosition = Vector3.new(-6152, 119, 6881), monster = "Elite Marine", npcId = "10" },
        { questLevel = 950, isLand = "Sky Islands", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Sandorian Warrior", npcId = "11" },
        { questLevel = 1000, isLand = "Sky Islands", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Divine Soldier", npcId = "11" },
        { questLevel = 1050, isLand = "Sky Islands", isLandPosition = Vector3.new(2661, 1103, 95), monster = "Holy Soldier", npcId = "12" },
        { questLevel = 1150, isLand = "Revolutionary Base", isLandPosition = Vector3.new(3717, 134, 3952), monster = "Revolutionary", npcId = "13" },
        { questLevel = 1200, isLand = "Revolutionary Base", isLandPosition = Vector3.new(3717, 134, 3952), monster = "Revolutionary Elite", npcId = "13" },
        { questLevel = 1300, isLand = "Impel Jail", isLandPosition = Vector3.new(3666, 116, 6727), monster = "Impel Guard", npcId = "14" },
        { questLevel = 1350, isLand = "Impel Jail", isLandPosition = Vector3.new(3666, 116, 6727), monster = "Impel Elite", npcId = "14" },
        { questLevel = 1450, isLand = "Cold Island", isLandPosition = Vector3.new(2624, 116, -2546), monster = "Corrupt Marine", npcId = "15" },
        { questLevel = 1600, isLand = "Fishman Island", isLandPosition = Vector3.new(6704, 111, -2622), monster = "Island Fishman", npcId = "16" },
        { questLevel = 1650, isLand = "Fishman Island", isLandPosition = Vector3.new(6704, 111, -2622), monster = "Fishman Elite", npcId = "16" },
        { questLevel = 1750, isLand = "Skull Island", isLandPosition = Vector3.new(6707, 114, 92), monster = "Skull Pirate", npcId = "17" },
        { questLevel = 1800, isLand = "Skull Island", isLandPosition = Vector3.new(6707, 114, 92), monster = "Pirate Elite", npcId = "17" },
        { questLevel = 1900, isLand = "Bubble Island", isLandPosition = Vector3.new(7056, 114, 2726), monster = "Pirate", npcId = "18" },
        { questLevel = 1950, isLand = "Bubble Island", isLandPosition = Vector3.new(7056, 114, 2726), monster = "Armored Marine", npcId = "18" },
        { questLevel = 2050, isLand = "Thriller Boat", isLandPosition = Vector3.new(7462, 111, 6574), monster = "Skeleton", npcId = "19" },
        { questLevel = 2100, isLand = "Thriller Boat", isLandPosition = Vector3.new(7462, 111, 6574), monster = "Mummy", npcId = "19" },
    
    
    }
    
    local virtual_input_manager = game:GetService("VirtualInputManager")
    local RunService = game:GetService("RunService")
    local yDistanceMonster = 6
    local teleportSpeed = 2
    local player = game.Players.LocalPlayer
    local HumanoidRootPart = player.Character:FindFirstChild('HumanoidRootPart')
    local playerLevel
    local canAttack = false
    local skillList = {}
    
    function onHeartbeat(step)
        if Fluent.Unloaded then
            connectHeartBeat:Disconnect()
            return
        end	
        playerLevel = game.Players.LocalPlayer.PlayerData.Experience.Level.Value
    
        local sea2 = game:GetService("Workspace").Logic.MapData:FindFirstChild("Sea2")
        if sea2 ~= nil then
            gameData = seaTwo
        end
        if(Options.AutoFarm.Value == false and Options.AutoQuest.Value == false) then
            connectHeartBeat:Disconnect()
            connectHeartBeat = nil
            canAttack = false
        end
        local MyModel = game.Workspace:FindFirstChild("bigaboommm")
    
            if MyModel ~= nil then
                local MyModel2 = player.Character:FindFirstChild('HumanoidRootPart')
                if MyModel2 ~= nil then
                else
                    return
                end
            else
                return
            end
        if (Options.AutoFarm.Value) then
            if HumanoidRootPart ~= 0 and player.Character ~= nil then
                autoFarm()	
            end
        end
    
        if (Options.AutoQuest.Value) then
            autoQuest()		
        end
        
    end
    
    do --Farm/Quest
        Tabs.Farm:AddSection("AutoFarm ]------------------------------------------------------------------------------------------------------------------------")
    
        local autoFarm = Tabs.Farm:AddToggle("AutoFarm", 
            {
            Title = "AutoFarm", 
            Description = "Auto Farm from base level",
            Default = false,
            Callback = function(state)
            if state then
                if (connectHeartBeat == nil) then
                    connectHeartBeat = RunService.Heartbeat:Connect(onHeartbeat)
                end
            else
                end
            end 
        })
    
        local autoQuest = Tabs.Farm:AddToggle("AutoQuest", 
            {
            Title = "AutoQuest", 
            Description = "Auto Quest from base level",
            Default = false,
            Callback = function(state)
            if state then
                if (connectHeartBeat == nil) then
                    connectHeartBeat = RunService.Heartbeat:Connect(onHeartbeat)
                end
            else
                end
            end 
        })
        --[[
        Tabs.Farm:AddSection("Select ]--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
        
        local monsterSelect = Tabs.Farm:AddDropdown("MonsterSelect", {
            Title = "Select Monsters",
            Description = "Select none to farm by level",
            Values = {"none","Lv : 1 Thief", "Lv : 10 Bandit", "Lv : 25 Bandit Boss", "Lv : 40 Pirate Clown", "Lv : 60 Clown Boss", "Lv : 90 Fishman", "Lv : 120 Shark Boss", "Lv : 160 Desert Thief", "Lv : 200 Bomb Boss",
                        "Lv : 250 Krieg Pirate", "Lv : 300 Krieg Boss", "Lv : 350 Marine Recruit", "Lv : 400 Tashii", "Lv : 450 Monkey", "Lv : 500 Gorilla", "Lv : 550 King Gorilla", "Lv : 600 Marine Grunt", "Lv : 650 Marine Captain",
                        "Lv : 700 Satyr", "Lv : 750 Minotaur", "Lv : 800 Elite Marine", "Lv : 850 Vice Admiral", "Lv : 900 Ice Admiral", "Lv : 950 Sandorian Warrior", "Lv : 1000 Divine Soldier", "Lv : 1050 Holy Soldier", "Lv : 1100 Thunder God",
                        "Lv : 1150 Revolutionary","Lv : 1200 Revolutionary Elite", "Lv : 1250 Revolutionary Boss", "Lv : 1300 Impel Guard", "Lv : 1350 Impel Elite", "Lv : 1400 Warden", "Lv : 1450 Corrupt Marine", "Lv : 1500 Vergo", "Lv : 1550 Snow Harpy", "Lv : 1600 Island Fishman",
                        "Lv : 1650 Fishman Elite", "Lv : 1700 Neptune", "Lv : 1750 Skull Pirate", "Lv : 1800 Pirate Elite", "Lv : 1850 Shiryu", "Lv : 1900 Pirate", "Lv : 1950 Armored Marine", "Lv : 2000 G4 Boss", "Lv : 2050 Skeleton",
                        "Lv : 2100 Mummy", "Lv : 2150 Ryummy"},
            Multi = false,
            Default = 1,
        })
    
        local questSelect = Tabs.Farm:AddDropdown("QuestSelect", {
            Title = "Select Quest",
            Description = "Select none to Quest by level",
                Values = {"none","Lv : 1 Thief", "Lv : 10 Bandit", "Lv : 25 Bandit Boss", "Lv : 40 Pirate Clown", "Lv : 60 Clown Boss", "Lv : 90 Fishman", "Lv : 120 Shark Boss", "Lv : 160 Desert Thief", "Lv : 200 Bomb Boss",
                        "Lv : 250 Krieg Pirate", "Lv : 300 Krieg Boss", "Lv : 350 Marine Recruit", "Lv : 400 Tashii", "Lv : 450 Monkey", "Lv : 500 Gorilla", "Lv : 550 King Gorilla", "Lv : 600 Marine Grunt", "Lv : 650 Marine Captain",
                        "Lv : 700 Satyr", "Lv : 750 Minotaur", "Lv : 800 Elite Marine", "Lv : 850 Vice Admiral", "Lv : 900 Ice Admiral", "Lv : 950 Sandorian Warrior", "Lv : 1000 Divine Soldier", "Lv : 1050 Holy Soldier", "Lv : 1100 Thunder God",
                        "Lv : 1150 Revolutionary","Lv : 1200 Revolutionary Elite", "Lv : 1250 Revolutionary Boss", "Lv : 1300 Impel Guard", "Lv : 1350 Impel Elite", "Lv : 1400 Warden", "Lv : 1450 Corrupt Marine", "Lv : 1500 Vergo", "Lv : 1550 Snow Harpy", "Lv : 1600 Island Fishman",
                        "Lv : 1650 Fishman Elite", "Lv : 1700 Neptune", "Lv : 1750 Skull Pirate", "Lv : 1800 Pirate Elite", "Lv : 1850 Shiryu", "Lv : 1900 Pirate", "Lv : 1950 Armored Marine", "Lv : 2000 G4 Boss", "Lv : 2050 Skeleton",
                        "Lv : 2100 Mummy", "Lv : 2150 Ryummy"},
            Multi = false,
            Default = 1,
        })
    
         กำลังทำว้อย
        local SuperBossSelect = Tabs.Farm:AddDropdown("SuperBossSelect", {
            Title = "Select SuperBoss : ",
            Description = "Select none if you don't want to farm super boss.",
            Values = {"none"},
            Multi = false,
            Default = 1,
        })
        --]]
    
        Tabs.Farm:AddSection("Setting ]------------------------------------------------------------------------------------------------------------------------")
    
        local weaponSelect = Tabs.Farm:AddDropdown("WeaponSelect", {
            Title = "Select Weapon Slot",
            Description = "Selecting none means not holding any weapons.",
            Values = {"none","Slot 1","Slot 2","Slot 3"},
            Multi = false,
            Default = 1,
        })
    
        local skillSelect = Tabs.Farm:AddDropdown("SkillSelect", {
            Title = "Select Skill",
            Description = "Not selecting anything means not using the auto skill.",
            Values = {"Z","X","C","V","B","E"},
            Multi = true,
            Default = {""},
        })
    
        skillSelect:OnChanged(function(Value)
            local Values = {}
            for Value, State in next, Value do
                table.insert(Values, Value)
            end
            skillList = Values
        end)
    
        local distanceMonster = Tabs.Farm:AddSlider("DistanceMonster", 
            {
            Title = "Distance",
            Description = "The distance between you and the monster.",
            Default = 5,
            Min = 5,
            Max = 30,
            Rounding = 0,
            Callback = function(Value)
                yDistanceMonster = Value
            end
        })
    
        local speedMovement = Tabs.Farm:AddSlider("SpeedMovement", 
            {
            Title = "Speed",
            Description = "Movement speed towards monsters",
            Default = 2,
            Min = 2,
            Max = 9,
            Rounding = 0,
            Callback = function(Value)
            teleportSpeed = Value
            end
        })
    
    end
    
    do --Stats 
        local autoStatsCo = function()
            while (true) do
                local point = game:GetService("Players").LocalPlayer.PlayerData.Experience.Points.Value
                if Fluent.Unloaded then
                coroutine.yield()
                return
                end	
                if (point > 0) then
                    if (Options.Combat.Value) then
                        local Combat = {
                            [1] = "Combat",
                            [2] = 1
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("Stats_Event"):FireServer(unpack(Combat))
                    end
    
                    if (Options.Defense.Value) then
                        local Defense = {
                            [1] = "Defense",
                            [2] = 1
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("Stats_Event"):FireServer(unpack(Defense))
                    end
    
                    if (Options.Sword.Value) then
                        local Sword = {
                            [1] = "Sword",
                            [2] = 1
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("Stats_Event"):FireServer(unpack(Sword))
                    end
    
                    if (Options.Fruit.Value) then
                        local Fruit = {
                            [1] = "Fruit",
                            [2] = 1
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Replication"):WaitForChild("ClientEvents"):WaitForChild("Stats_Event"):FireServer(unpack(Fruit))
                    end
                end
                wait(0.5)
                if (not Options.Combat.Value and not Options.Defense.Value and not Options.Sword.Value and not Options.Fruit.Value) then coroutine.yield() end
            end
        end
    
        local statsThread = coroutine.wrap(autoStatsCo);
    
        local combatToggle = Tabs.Stats:AddToggle("Combat", 
            {
            Title = "Combat", 
            Description = "",
            Default = false,
            Callback = function(state)
            if state then
                if not (Options.Defense.Value or Options.Sword.Value or Options.Fruit.Value) then
                    statsThread() 
                end			
            else
                end
            end 
        })
    
        local defenseToggle = Tabs.Stats:AddToggle("Defense", 
            {
            Title = "Defense", 
            Description = "",
            Default = false,
            Callback = function(state)
            if state then
                if not (Options.Combat.Value or Options.Sword.Value or Options.Fruit.Value) then
                    statsThread() 
                end	
            else
                
                end
            end 
        })
    
        local swordToggle = Tabs.Stats:AddToggle("Sword", 
            {
            Title = "Sword", 
            Description = "",
            Default = false,
            Callback = function(state)
            if state then
                if not (Options.Combat.Value or Options.Defense.Value or Options.Fruit.Value) then
                    statsThread() 
                end	
            else
                
                end
            end 
        })
    
        local fruitToggle = Tabs.Stats:AddToggle("Fruit", 
            {
            Title = "Fruit", 
            Description = "",
            Default = false,
            Callback = function(state)
            if state then
                if not (Options.Combat.Value or Options.Defense.Value or Options.Sword.Value) then
                    statsThread() 
                end	 
            else
                
                end
            end 
        })
        
        
        
    end
    
    do --Teleport
        Tabs.Teleport:AddParagraph({
            Title = "⚠️ Warning",
            Content = "Teleport will kill your character, please put the devil fruit in your inventory."
        })
        
        Tabs.Teleport:AddSection("SEA 1 ]------------------------------------------------------------------------------------------------------------------------")
        
        Tabs.Teleport:AddButton({
        Title = "Starter Island",
        Description = "LEVEL : 1",
        Callback = function()
                local args = {
                    [1] = "Starter Island"
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                local player = game.Players.LocalPlayer.Character.Humanoid
                player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Clown Island",
        Description = "LEVEL : 40",
        Callback = function()
                local args = {
                    [1] = "Clown Island"
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                local player = game.Players.LocalPlayer.Character.Humanoid
                player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Shark Park",
        Description = "LEVEL : 90",
        Callback = function()
                local args = {
                    [1] = "Shark Park"
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                local player = game.Players.LocalPlayer.Character.Humanoid
                player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Desert Ruins",
        Description = "LEVEL : 160",
        Callback = function()
                local args = {
                    [1] = "Desert Ruins"
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                local player = game.Players.LocalPlayer.Character.Humanoid
                player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Sea Restaurant",
        Description = "LEVEL : 250",
        Callback = function()
                local args = {
                    [1] = "Sea Restaurant"
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                local player = game.Players.LocalPlayer.Character.Humanoid
                player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Logue City",
        Description = "LEVEL : 350",
        Callback = function()
            local args = {
                [1] = "Logue City"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Tall Woods",
        Description = "LEVEL : 450",
        Callback = function()
            local args = {
                [1] = "Tall Woods"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Marine Base Town",
        Description = "LEVEL : 600",
        Callback = function()
            local args = {
                [1] = "Marine Base Town"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Three Islands",
        Description = "LEVEL : 700",
        Callback = function()
            local args = {
                [1] = "Three Islands"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Marine HQ",
        Description = "LEVEL : 800",
        Callback = function()
            local args = {
                [1] = "Marine HQ"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Sky Islands",
        Description = "LEVEL : 950",
        Callback = function()
            local args = {
                [1] = "Skypiean islands"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Revolutionary Base",
        Description = "LEVEL : 1,150",
        Callback = function()
            local args = {
                [1] = "Revolutionary Base"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Impel Jail",
        Description = "LEVEL : 1,300",
        Callback = function()
            local args = {
                [1] = "Impel Jail"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Half Hot Half Cold Island",
        Description = "LEVEL : 1,450",
        Callback = function()
            local args = {
                [1] = "Half Hot Half Cold"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Fishman Island",
        Description = "LEVEL : 1,600",
        Callback = function()
            local args = {
                [1] = "Fishman Island"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Skull Island",
        Description = "LEVEL : 1,750",
        Callback = function()
            local args = {
                [1] = "Skull Island"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Bubble Island",
        Description = "LEVEL : 1,900",
        Callback = function()
            local args = {
                [1] = "Bubble Island"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Thriller Boat",
        Description = "LEVEL : 2050",
        Callback = function()
            local args = {
                [1] = "Thriller Boat"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddSection("SEA 2 ]------------------------------------------------------------------------------------------------------------------------")
    
        Tabs.Teleport:AddButton({
            Title = "Flower Capital",
            Description = "LEVEL : 2200",
            Callback = function()
                local args = {
                    [1] = "Flower Capital"
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                local player = game.Players.LocalPlayer.Character.Humanoid
                player.Health = 0
                end
        })
    
        Tabs.Teleport:AddButton({
        Title = "Udon Prison",
        Description = "LEVEL : 2400",
        Callback = function()
            local args = {
                [1] = "Udon Prison"
            }
            game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
            local player = game.Players.LocalPlayer.Character.Humanoid
            player.Health = 0
            end
        })
    
        Tabs.Teleport:AddButton({
            Title = "Snowy Graveyard",
            Description = "LEVEL : 2550",
            Callback = function()
                local args = {
                    [1] = "Snowy Graveyard"
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                local player = game.Players.LocalPlayer.Character.Humanoid
                player.Health = 0
                end
        })
    
        Tabs.Teleport:AddButton({
            Title = "Desert City",
            Description = "LEVEL : 2700",
            Callback = function()
                local args = {
                    [1] = "Desert City"
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                local player = game.Players.LocalPlayer.Character.Humanoid
                player.Health = 0
                end
        })
    end
    do --Sword
        Tabs.Swords:AddButton({
            Title = "Katana",
            Description = "$1.2K",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace:FindFirstChild("Sword Sellers").Katana
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.BuySword:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Swords:AddButton({
            Title = "Dual Swords",
            Description = "$100K",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.FruitRemovers:FindFirstChild("Doctor White")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.BuySword:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Swords:AddButton({
            Title = "Pipe",
            Description = "$250K",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace:FindFirstChild("Sword Sellers").Pipe
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.BuySword:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Swords:AddButton({
            Title = "Bisento",
            Description = "$500K",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace:FindFirstChild("Sword Sellers").Bisento
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.BuySword:InvokeServer(unpack(args))
            end
        })
    
        
        Tabs.Swords:AddButton({
            Title = "Operation Blade",
            Description = "Level 1000 $250K",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace:FindFirstChild("Sword Sellers")["Operation Blade"]
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.BuySword:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Swords:AddButton({
            Title = "Soul Cane",
            Description = "Level 1000 $100K",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace:FindFirstChild("Sword Sellers")["Soul Cane"]
                }
                game:GetService("ReplicatedStorage").Replication.ClientEvents.BuySword:InvokeServer(unpack(args))
            end
        })
    
    
    end
    
    do --FightingStyle
        Tabs.FightingStyle:AddButton({
            Title = "Black Leg",
            Description = "$100K",
            Callback = function()
                local args = {
                    [1] = "Black Leg"
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.BuyFightingStyle:InvokeServer(unpack(args))
            end
        })
    
        Tabs.FightingStyle:AddButton({
            Title = "Electro",
            Description = "$450K",
            Callback = function()
                local args = {
                    [1] = "Electro"
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.BuyFightingStyle:InvokeServer(unpack(args))
            end
        })
    end
    
    
    do --Misc
        Tabs.Misc:AddSection("Sea Teleporter ]------------------------------------------------------------------------------------------------------------------------")
        
        Tabs.Misc:AddButton({
            Title = "Teleport To Sea 1",
            Description = "Will teleport to the 1st sea if your character is in the 2nd sea.",
            Callback = function()
                game:GetService("Workspace")["Npc_Workspace"]["Sea Teleporter"]["Sea 1"].Teleport:InvokeServer()
            end
        })
        Tabs.Misc:AddButton({
            Title = "Teleport To Sea 2",
            Description = "Will teleport to the 2nd sea if your character is in the 1st sea.",
            Callback = function()
                game:GetService("Workspace")["Npc_Workspace"]["Sea Teleporter"]["Sea 2"].Teleport:InvokeServer()
            end
        })
    
        Tabs.Misc:AddSection("Key & Scroll ]------------------------------------------------------------------------------------------------------------------------")
        
        Tabs.Misc:AddButton({
            Title = "Lava Key",
            Description = "Press to pick up the Lava key.",
            Callback = function()
                game:GetService("Workspace").Logic.PointsOfInterest["Lava Key"].Pick:InvokeServer()
            end
        })
        Tabs.Misc:AddButton({
            Title = "Poneglyph Scroll",
            Description = "Press to pick up the Poneglyph Scroll.",
            Callback = function()
                game:GetService("Workspace").Logic.PointsOfInterest["Poneglyph Scroll"].Pick:InvokeServer()
            end
        })
        
        Tabs.Misc:AddSection("Buso Haki ]------------------------------------------------------------------------------------------------------------------------")
        
        Tabs.Misc:AddButton({
            Title = "Buso 1",
            Description = "Level 350, $100k",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.Buso:FindFirstChild("1")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.Buso:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Misc:AddButton({
            Title = "Buso 2",
            Description = "Level 1150, $250k",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.Buso:FindFirstChild("2")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.Buso:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Misc:AddSection("Observation Haki ]------------------------------------------------------------------------------------------------------------------------")
        
        Tabs.Misc:AddButton({
            Title = "Obs 1",
            Description = "Level 600, $150k",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.ObsHaki:FindFirstChild("1")
                }
    
                game:GetService("ReplicatedStorage").Replication.ClientEvents.ObsHaki:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Misc:AddButton({
            Title = "Obs 2",
            Description = "Level 1500, $200k",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.ObsHaki:FindFirstChild("2")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.ObsHaki:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Misc:AddButton({
            Title = "Obs 3",
            Description = "Level 2500, $1m \nrequire : Sea 2",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.ObsHaki:FindFirstChild("3")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.ObsHaki:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Misc:AddSection("Sky Walk ]------------------------------------------------------------------------------------------------------------------------")
        Tabs.Misc:AddButton({
            Title = "Geppo (Click to up level)",
            Description = "[1]Level 1 : $20k \n[2]Level 500 : $100k \n[3]Level 1000 : $200k",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.Geppo:FindFirstChild("Black Leg")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.Geppo:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Misc:AddSection("Flash Step ]------------------------------------------------------------------------------------------------------------------------")
        
        Tabs.Misc:AddButton({
            Title = "FlashStep 1",
            Description = "$25k",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.FlashStep:FindFirstChild("1")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.FlashStep:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Misc:AddButton({
            Title = "FlashStep 2",
            Description = "$75k, Must be level 600+",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.FlashStep:FindFirstChild("2")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.FlashStep:InvokeServer(unpack(args))
            end
        })
    
        Tabs.Misc:AddButton({
            Title = "FlashStep 3",
            Description = " $200k, Must be level 1.5k+",
            Callback = function()
                local args = {
                    [1] = workspace.Npc_Workspace.FlashStep:FindFirstChild("3")
                }
                
                game:GetService("ReplicatedStorage").Replication.ClientEvents.FlashStep:InvokeServer(unpack(args))
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
    
    
    function autoFarm()
        if HumanoidRootPart.Position == nil then
            return
        end
        local monsterByPlayerLevel
        local positionOfMonster
        local isLandsar = getIslandByPlayerLevel(playerLevel)
        local questRunnig = game.Players.LocalPlayer.Quest.NPCName.Value
            monsterByPlayerLevel = getMonsterByPlayerLevel()
        if(questRunnig ~= monsterByPlayerLevel and questRunnig ~= "") then
            monsterByPlayerLevel = questRunnig
            isLandsar = getIslandByQuest(tostring(questRunnig))
        end
        positionOfMonster = getPositionOfMonster(monsterByPlayerLevel,isLandsar)
        if (positionOfMonster == nil) then
            positionOfMonster = getPositionOfIsland()
        end
    
        
        moveTotargetPosition(positionOfMonster)
    
    end
    
    function getMonsterByPlayerLevel()
        local currentLevel = 0
        local monsterName = nil
    
        for _, data in ipairs(gameData) do
            if playerLevel >= data.questLevel and data.questLevel > currentLevel then
                currentLevel = data.questLevel
                monsterName = data.monster
            end
        end
    
        return monsterName
    end
    
    
    function getPositionOfMonster(Monster,ssIsland)
        local monster = game:GetService("Workspace")["NPC Zones"][ssIsland].NPCS
        for _, child in pairs(monster:GetChildren()) do
            for _, npchild in pairs(child:GetChildren()) do
                if(npchild.Name == "NPCName") then
                    if (npchild.Value == Monster) then
                        if (npchild.Parent.Humanoid.Health <= 0) then
                            continue
                        end
                        if(npchild.Parent:FindFirstChild("HumanoidRootPart") == nil) then
                            return nil
                        end					
                        return npchild.Parent.HumanoidRootPart.Position
                    end
                end
            end
        end
    end
    
    --update Last
    function getPositionOfIsland()
        local selectedPosition = Vector3.new(-2185, 144, -3240)
        for _, island in ipairs(gameData) do
            if playerLevel >= island.questLevel then
                selectedPosition = island.isLandPosition
            else
                break
            end
        end
    
        return selectedPosition
    end
    
    
    --updateLast
    function getIslandByPlayerLevel()
        local selectedIsland = "Starter Island"  -- เกาะเริ่มต้น
    
        for i, data in ipairs(gameData) do
            if playerLevel >= data.questLevel then
                selectedIsland = data.isLand
            else
                break  -- หากเลเวลไม่เพียงพอให้เข้าเกาะในเกาะปัจจุบันให้หยุดที่นี่
            end
        end
    
        return selectedIsland
    end
    
    
    
    --update last
    function getIslandByQuest(questType)
        for _, data in ipairs(gameData) do
            if data.monster == questType then
                return data.isLand
            end
        end
    
        return "Unknown Island" -- คืนค่า "Unknown Island" หากไม่พบเควสประเภทที่ตรงกับใน gameData
    end
    
    
    
    function autoQuest()
        local questRunnig2 = game.Players.LocalPlayer.Quest.NPCName.Value
        if (questRunnig2 ~= "") then	return end
            getQuestByPlayerLevel()
    
    
    end
    --update Last
    function getQuestByPlayerLevel()
        local selectedNPCId = nil
        local selectedLevel = nil
    
        for _, data in ipairs(gameData) do
            if playerLevel < data.questLevel then
                break
            end
            selectedNPCId = data.npcId
            selectedLevel = data.questLevel
        end
    
        if selectedNPCId then
            local args = {
                [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild(selectedNPCId),
                [2] = "Level " .. selectedLevel
            }
            game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
        else
            print("Quest not found..")
        end
    end
    
    
    
    
    function moveTotargetPosition(Position)
        local targetPosition = Position + Vector3.new(0,yDistanceMonster,0) -- distance fromtarget	   
        local playerPosition = player.Character.HumanoidRootPart.Position 
        local nextTargetPosition = playerPosition + (targetPosition - playerPosition).unit * teleportSpeed
        for i,v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
        
        if((targetPosition - playerPosition).Magnitude <= 30) then
            player.Character:PivotTo(CFrame.new(targetPosition))
            player.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
            player.Character.HumanoidRootPart.CFrame *= CFrame.Angles(11,0,0) --11 down /14 up
            canAttack = true
            player.GameplayPaused = false
            return
        end
        if(nextTargetPosition.Y < targetPosition.Y) then
            nextTargetPosition +=  Vector3.new(0,10,0)
        end
        nextTargetPosition = nextTargetPosition + (Position  - playerPosition).unit * teleportSpeed
        player.Character:PivotTo(CFrame.new(nextTargetPosition))
        player.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
        canAttack = false
        player.GameplayPaused = false
    
    end
    
    coroutine.wrap(function() 
        while wait(0.5) do
            if Fluent.Unloaded then
                coroutine.yield()
                break
            end
            if #skillList > 1 then
                for i, value in pairs(skillList) do
                    if value == "Z" then
                        virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.Z,false,game)
                        virtual_input_manager:SendKeyEvent(false,Enum.KeyCode.Z,false,game)
                    end
                    if value == "X" then
                        virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.X,false,game)
                        virtual_input_manager:SendKeyEvent(false,Enum.KeyCode.X,false,game)
                    end
                    if value == "C" then
                        virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.C,false,game)
                        virtual_input_manager:SendKeyEvent(false,Enum.KeyCode.C,false,game)
                    end
                    if value == "V" then
                        virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.V,false,game)
                        virtual_input_manager:SendKeyEvent(false,Enum.KeyCode.V,false,game)
                    end
                    if value == "B" then
                        virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.B,false,game)
                        virtual_input_manager:SendKeyEvent(false,Enum.KeyCode.B,false,game)
                    end
                    if value == "E" then
                        virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.E,false,game)
                        virtual_input_manager:SendKeyEvent(false,Enum.KeyCode.E,false,game)
                    end
                    wait(0.5)
                end
            end
    
    
        end
    end)()
    local toolHave = false
    coroutine.wrap(function() 
        while wait(0.5) do
            if Fluent.Unloaded then
                coroutine.yield()
                break
            end	
            if canAttack then
                virtual_input_manager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
            end
            if Options.WeaponSelect.Value ~= "none" then
                --getChildren bug 11
                if(player.Character ~= nil) then
    
                    local playerChild = player.Character:GetChildren()
                    for _, child in ipairs(playerChild) do
                        if child:IsA("Tool")then
                            toolHave = true
                            break
                        else
                            toolHave = false
                        end
                    end
                    
                    if toolHave == false then
                        if Options.WeaponSelect.Value == "Slot 1" then
                            virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.One,false,game)
                        end
                        if Options.WeaponSelect.Value == "Slot 2" then
                            virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.Two,false,game)
                        end
                        if Options.WeaponSelect.Value == "Slot 3" then
                            virtual_input_manager:SendKeyEvent(true,Enum.KeyCode.Three,false,game)
                        end
                    end
    
    
    
    
                end
            end
        end
    end)()
    
    connectHeartBeat = nil
    --Setting Window
    Fluent:ToggleTransparency(false)
    Fluent:ToggleAcrylic(false)
    Window:SelectTab(1)
end

repeat task.wait() until KeySystemUI.Finished() or KeySystemUI.Closed
if KeySystemUI.Finished() and KeySystemUI.Closed == false then
    onPerd()
else
    print("BloxRaid Hub : disable.")
end
