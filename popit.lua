local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local Library = (loadstring(game:HttpGet("https://raw.githubusercontent.com/HUNTScripting/scripts/main/newui.lua")))()
local Stats = ReplicatedStorage.Stats[Player.Name]
local Main = Library:AddSection("🔥 Autofarm")

Main:AddLabel("Version 0.00 - An update is pending")
