local Library = (loadstring(game:HttpGet("https://raw.githubusercontent.com/HUNTScripting/scripts/main/newui.lua")))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local bossMobs = ReplicatedStorage.HALLOWEEN2024FOLDER.BossMobs
local FuckBossRem = ReplicatedStorage.HALLOWEEN2024FOLDER.WinBossEvent
local RemoveCRem = ReplicatedStorage.RemoveC
local drops = {}
local dropsName = {}
for i,v in pairs(bossMobs:GetChildren()) do
	local dropName = v:GetAttribute("DropKey")
	if not drops[dropName] then
		table.insert(dropsName, dropName)
		drops[dropName] = { v.Name }
	else
		table.insert(drops[dropName], v.Name)
	end
end

local currentDrop

local farm = Library:AddSection("Farm 🔥")
farm:AddDropdown("Thingy to farm", dropsName, function(value)
    currentDrop = value
end)
local delay = 0.01
farm:AddTextbox("Farm delay", "Default is 0.01", function(value)
	delay = tonumber(value)
	print(delay)
	if not delay then
		delay = 0.01
	end
end)
local isFarmOn
farm:AddToggle("Auto farm", "Auto farms the item that you selected above, I believe you read everything :)", function(value)
	isFarmOn = value
	if isFarmOn then
		while isFarmOn and task.wait(delay) do
			local currentBosses = drops[currentDrop]
			randomBoss = currentBosses[math.random(1, #currentBosses)]
			FuckBossRem:FireServer(tostring(randomBoss))
			task.wait(0.01)
			RemoveCRem:FireServer("1")
		end
	end
end)
local misc = Library:AddSection("Misc")

misc:AddButton("Click me to destroy the GUI", function()
    Library:Destroy()
end)
