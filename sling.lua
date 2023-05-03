local Library = (loadstring(game:HttpGet("https://raw.githubusercontent.com/HUNTScripting/scripts/main/newui.lua")))()
local rs = game:GetService("ReplicatedStorage")
local Eggs = rs.Models.Eggs:GetChildren()
local EggHatchEvent = rs.Events.RequestEggHatch
local args = {
    [1] = "Classic Egg",
    [2] = "Single"
}
local options = {"Single", "Multi", "Auto"}

local Farming_Section = Library:AddSection("Eggs")

Farming_Section:AddDropdown("Select egg ", Eggs, function(value)
	args[1] = value
    print(value)
end)
Farming_Section:AddDropdown("Select opening method ", options, function(value)
    args[2] = value
end)
local AutoHatch;
Farming_Section:AddToggle(
	"Auto Hatch Eggs",
	"This will auto hatch eggs for you.",
	function(value)
		AutoHatch = value
		while AutoHatch do
			EggHatchEvent:FireServer(unpack(args))
			task.wait(0.1)
		end
	end
)
