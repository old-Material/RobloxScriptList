local prompT = game:GetService("Workspace").TreesFolder["Meshes/Tree"].Attachment.ProximityPrompt
print(prompT)
prompT.MaxActivationDistance = 9999
print(prompT)
local function fireproximityprompt(Obj, Amount, Skip)
    if Obj.ClassName == "ProximityPrompt" then 
		print("promt")
        Amount = Amount or 1
        local PromptTime = Obj.HoldDuration
        if Skip then 
            Obj.HoldDuration = 2
        end
        for i = 1, Amount do 
            Obj:InputHoldBegin()
            if not Skip then 
                wait(Obj.HoldDuration)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
		print("done")
    else 
        error("userdata<ProximityPrompt> expected")
    end
end

fireproximityprompt(prompT,1,false)