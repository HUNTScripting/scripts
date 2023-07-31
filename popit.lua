local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local Library = (loadstring(game:HttpGet("https://raw.githubusercontent.com/HUNTScripting/scripts/main/newui.lua")))()
local Stats = ReplicatedStorage.Stats[Player.Name]
local Main = Library:AddSection("🔥 Autofarm")
local AreaPath = require(ReplicatedStorage.Tables.AreaWorldData)
local Areas = {}
for i,v in pairs(AreaPath.areas) do
    table.insert(Areas, tostring(i))
end
for i = 1, math.floor(#Areas/2) do
    local j = #Areas - i + 1
     Areas[i], Areas[j] = Areas[j], Areas[i]
 end
 table.insert(Areas, "Dungeon")
local SelectedArea = nil
local function GetPlayerPets()
	local pets = {}
	for i, v in pairs(Stats.Pets:GetChildren()) do
		if v.Equipped.Value then
			table.insert(pets, v.Name)
		end
	end
	return pets
end
local function GetAvailablePets()
    local pets = GetPlayerPets()
    local retPets = {}
    for i,v in pairs(pets) do
        local workspacePet = workspace.Pets:FindFirstChild(v)
        if not workspacePet then
            continue
        end
        local hasTarget = workspacePet:GetAttribute("target") == "player"
        if hasTarget then 
            table.insert(retPets, v)
            task.wait(0.05)
        end
    end
    return retPets
end
Main:AddDropdown("Select your Area: ", Areas, function(value)
	SelectedArea = value
end)
local isAutoPopOn
local popRemote = ReplicatedStorage["SSG Framework"].Shared.Network["attack drop"]
local orbs = workspace.Orbs
local pickUpOrbRemote = ReplicatedStorage["SSG Framework"].Shared.Network.orbs
local function getOrbs()
    for i,v in pairs(orbs:GetChildren()) do
        pickUpOrbRemote:FireServer(v.Name)
        task.wait(0.1)
        v:Destroy()
    end
end
local function GetDungeonBaloons()
    if SelectedArea ~= "Dungeon" then
        return nil;
    end
    local DungeonBalloons = {}
    for _, Ballon in pairs(workspace.Drops:GetChildren()) do
        local Area = Ballon:GetAttribute("Area")
        if Area == "Dungeon" then
            table.insert(DungeonBalloons, Ballon)
        end
    end
    table.sort(DungeonBalloons, function(a, b)
        return a:GetAttribute("MaxHP") > b:GetAttribute("MaxHP")
    end)
    return DungeonBalloons
end
local newVector = Vector3.new()
local vectorTable = {newVector, newVector, newVector, newVector}
Main:AddToggle("AutoFarm", "AutoFarm selected areas ", function(yeet)
	isAutoPopOn = yeet
	while isAutoPopOn do
        local BalloonList = GetDungeonBaloons();
		for _, Ballon in pairs(BalloonList or workspace.Drops:GetChildren()) do
            local BallonPos = nil
            pcall(function()
                BallonPos = Ballon.PrimaryPart.Position
            end)
            if not BallonPos then continue end;
			local Area = Ballon:GetAttribute("Area")
			if Area == SelectedArea then
				while Ballon:GetAttribute("HP") > 0 and isAutoPopOn do
                    local availablePets = GetAvailablePets()
					local response = popRemote:InvokeServer(SelectedArea, availablePets, Ballon.Name, true, {BallonPos, BallonPos, BallonPos, BallonPos})
                    if not response then
                        break
                    end
                    task.wait()
				end
			end
            task.wait()
		end
		task.wait(0.1)
	end
end)
local isAutoCollectOn;
local Delay = 5;
Main:AddToggle("Auto Collect Drops", "Automatically collects drop after a few seconds, the delay can be modified below", function(yeet)
	isAutoCollectOn = yeet
	while isAutoCollectOn do
        getOrbs()
        task.wait(Delay);
    end
end)
Main:AddTextbox("Auto Collect Delay: ", tostring(Delay) .. " Seconds", function(value)
	Delay = tonumber(value) or 5
end)
local isAutoEquipPetsOn;
local autoEquipRemote = ReplicatedStorage["SSG Framework"].Shared.Network["equip best pets"]
local function runAutoEquip()
    if isAutoEquipPetsOn then
        task.wait(3)
        autoEquipRemote:InvokeServer()
    end
end
Stats.Pets.ChildAdded:Connect(runAutoEquip)
Stats.Pets.ChildRemoved:Connect(runAutoEquip)

Main:AddToggle("Auto Equip Pets", "Auto equips best pets for you", function(yeet)
    isAutoEquipPetsOn = yeet
    runAutoEquip()
end)
Main:AddButton("Destroy the gui", function()
	Library:Destroy()
end)

Main:AddLabel("Version 1.022 - Fixed auto farm delay")
