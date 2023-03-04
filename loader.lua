local Library = {}
function Library:Initialize(Callback)
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local Frame = Instance.new("Frame")
	Frame.Parent = ScreenGui
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
	Frame.BorderColor3 = Color3.fromRGB(47, 47, 47)
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0, 150, 0, 150)
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = Frame
	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Parent = Frame
	Title.AnchorPoint = Vector2.new(0.5, 0.5)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.5, 0, 0.5, 0)
	Title.Size = UDim2.new(0, 200, 0, 50)
	Title.Font = Enum.Font.SourceSansBold
	Title.Text = "Welcome to Dacia!"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 22.000
	local Description = Instance.new("TextLabel")
	Description.Name = "Description"
	Description.Parent = Frame
	Description.AnchorPoint = Vector2.new(0.5, 0.5)
	Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Description.BackgroundTransparency = 1.000
	Description.Position = UDim2.new(0.5, 0, 0.5, 0)
	Description.Size = UDim2.new(0, 150, 0, 137)
	Description.Font = Enum.Font.SourceSansBold
	Description.Text =
		"This is the loading screen for Dacia Hub, for now there is nothing, but in future here will be a key system with an intention to gain some profit in order to continue scripting, for now you can continue for free."
	Description.TextColor3 = Color3.fromRGB(165, 165, 165)
	Description.TextSize = 15.000
	Description.TextTransparency = 1.000
	Description.TextWrapped = true
	Description.TextXAlignment = Enum.TextXAlignment.Left
	local TextButton = Instance.new("TextButton")
	TextButton.Parent = Frame
    TextButton.Active = false
	TextButton.AnchorPoint = Vector2.new(0.5, 0)
	TextButton.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
	TextButton.BackgroundTransparency = 1.000
	TextButton.Position = UDim2.new(0.5, 0, 0.5, 80)
	TextButton.Size = UDim2.new(0, 175, 0, 45)
	TextButton.Font = Enum.Font.SourceSansBold
	TextButton.Text = "Continue"
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextSize = 19.000
	TextButton.TextTransparency = 1.000
	TextButton.Activated:Connect(function()
		Callback()
		ScreenGui:Destroy()
	end)
	local UICorner_2 = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 8)
	UICorner_2.Parent = TextButton
	local TweenService = game:GetService("TweenService")
	local TweenData = TweenInfo.new(1)
	local TweenFrame = TweenService:Create(Frame, TweenInfo.new(3), { Size = UDim2.new(0, 10000, 0, 10000) })
	TweenFrame:Play()
	task.wait(1)
	local TweenName = TweenService:Create(Frame.Title, TweenData, { Position = UDim2.new(0.5, 0, 0.5, -100) })
	TweenName:Play()
	TweenName.Completed:Wait()
	local TweenDescription = TweenService:Create(Frame.Description, TweenData, { TextTransparency = 0 })
	TweenDescription:Play()
	TweenDescription.Completed:Wait()
	local TweenButton =
		TweenService:Create(Frame.TextButton, TweenData, { BackgroundTransparency = 0, TextTransparency = 0 })
	TweenButton:Play()
	TweenButton.Completed:Wait()
    TextButton.Active = true
end

return Library
