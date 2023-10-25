local monsterLevel = {
	
}

for numberSet = 1, 19 do
  local npcFolder = game:GetService("Workspace")["Npc_Workspace"].QuestGivers[numberSet]["Configuration"]["Quests"]
  for _, folder in ipairs(npcFolder:GetChildren()) do
    if string.match(folder.Name, "Level") then
      local childFolder = folder:GetChildren()[1]
	  local strFolder = tostring(folder)
	  local secondPart = string.sub(strFolder, strFolder:find(" ", 1) + 1)
      if childFolder.Name ~= "Layout" then
        monsterLevel[secondPart] = childFolder.Name
		print(secondPart ..childFolder.Name)
		if(secondPart == 850)then
			print("850000000000000000000000000000000")
		end

      end
    end
  end
end


--writefile("monster.txt","[1] = " ..tostring("\"Thief\", \n"))
local i = 1
for index, value in pairs(monsterLevel) do
	i = i + 1
	print(i)
  	--print(index, value)
	  --appendfile("monster.txt","["..index .."] = " ..tostring("\"") ..value ..tostring("\"") ..", \n")
end


--appendfile("monster.txt","[4] = " ..tostring("\"To\", \n"))
--writefile("monster.txt","[5] = " ..tostring("\"none\", \n"))

