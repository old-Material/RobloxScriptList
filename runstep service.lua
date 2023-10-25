local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local LOOP_COUNT = 100
local count = 0

local connection

function getPositionOfMonster(Monster)
	local monster = game:GetService("Workspace")["NPC Zones"]["Starter Island"].NPCS
	for _, child in pairs(monster:GetChildren()) do
		for _, npchild in pairs(child:GetChildren()) do
			if(npchild.Name == "NPCName") then
				if (npchild.Value == Monster) then
					return npchild.Parent.HumanoidRootPart.Position
				end
			end
		end
	end
end

local targetPosition = getPositionOfMonster("Thief") + Vector3.new(0,20,0) -- ตำแหน่งเป้าหมายที่คุณต้องการ

local teleportSpeed = 2 -- ความเร็วของการเคลื่อนที่ (เป็นหน่วยต่อวินาที)

local nextTargetPosition = player.Character.HumanoidRootPart.Position + (targetPosition - player.Character.HumanoidRootPart.Position).unit * teleportSpeed



function onHeartbeat(step)
	if count < LOOP_COUNT then
		count = count + 1
		print((targetPosition - player.Character.HumanoidRootPart.Position).Magnitude)
		if((targetPosition - player.Character.HumanoidRootPart.Position).Magnitude <= 20) then
			player.Character:PivotTo(CFrame.new(targetPosition))
			print("Target")
			return
		end
		print("nextTarget")
		player.Character:PivotTo(CFrame.new(nextTargetPosition))
		nextTargetPosition = nextTargetPosition + (targetPosition - player.Character.HumanoidRootPart.Position).unit * teleportSpeed
		player.GameplayPaused = false
		
	else
		print("end")
		connection:Disconnect()
	end
end

connection = RunService.Heartbeat:Connect(onHeartbeat)


