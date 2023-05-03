local GameId = tostring(game.GameId)
local MainLink = "https://raw.githubusercontent.com/HUNTScripting/scripts/main/"
local function setlink(link) MainLink = MainLink..link end
if GameId == '3258302407' then
    setlink("RebirthChampsX.lua")
elseif GameId == '3965173814' then
    setlink("SwordFighters.lua")
elseif GameId == '4158951932' then
    setlink("BubbleGumClicker.lua")
elseif GameId == '4326974283' then
    setlink("sling.lua")
end
loadstring(game:HttpGet(MainLink , true))()
