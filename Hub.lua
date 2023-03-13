local GameId = tostring(game.GameId)
local MainLink = "https://raw.githubusercontent.com/HUNTScripting/scripts/main/"
if GameId == '3258302407' then
    MainLink = MainLink.."RebirthChampsX.lua"
elseif GameId == '3965173814' then
    MainLink = MainLink.."SwordFighters.lua"
end
loadstring(game:HttpGet(MainLink , true))()
