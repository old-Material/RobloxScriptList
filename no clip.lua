local runservice = game:GetService("RunService")

local player = game:GetService("Players").LocalPlayer

runservice.Stepped:Connect(function()
    for i,v in pairs(player.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
			--print(v)
        end
		--print("for loop")
    end
end)

