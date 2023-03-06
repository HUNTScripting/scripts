local TweenService = game:GetService("TweenService")
local a = game:GetService("VirtualUser")
local Loader = game:HttpGet("https://raw.githubusercontent.com/HUNTScripting/scripts/main/loader.lua")
game:service("Players").LocalPlayer.Idled:connect(function()
	a:CaptureController()
	a:ClickButton2(Vector2.new())
	wait(2)
end)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Enabled = false
pcall(function()
	syn.protect_gui(ScreenGui)
end)
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.Size = UDim2.new(0, 450, 0, 450)
local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 5)
FrameCorner.Parent = Frame
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(54, 54, 54)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(64, 64, 64)),
})
UIGradient.Rotation = 90
UIGradient.Parent = Frame
local UIPadding = Instance.new("UIPadding")
UIPadding.Parent = Frame
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)
local GUITitle = Instance.new("TextLabel")
GUITitle.Parent = Frame
GUITitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GUITitle.BackgroundTransparency = 1.000
GUITitle.Position = UDim2.new(0, 0, -0.0113636367, 0)
GUITitle.Size = UDim2.new(0, 440, 0, 20)
GUITitle.Font = Enum.Font.SourceSansBold
GUITitle.Text = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
	.. ". Welcome to Dacia "
	.. game.Players.LocalPlayer.Name
	.. "."
GUITitle.TextColor3 = Color3.fromRGB(255, 255, 255)
GUITitle.TextSize = 15
GUITitle.TextXAlignment = Enum.TextXAlignment.Left
local TabsFrame = Instance.new("ScrollingFrame")
TabsFrame.Parent = Frame
TabsFrame.Active = true
TabsFrame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
TabsFrame.BorderColor3 = Color3.fromRGB(44, 44, 44)
TabsFrame.Position = UDim2.new(0, 0, 0, 20)
TabsFrame.Size = UDim2.new(1, 0, 0, 50)
TabsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
TabsFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
TabsFrame.ScrollBarThickness = 4
TabsFrame.VerticalScrollBarInset = Enum.ScrollBarInset.Always
TabsFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
local UICorner = Instance.new("UICorner")
UICorner.Parent = TabsFrame
local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.Parent = TabsFrame
UIGridLayout.FillDirection = Enum.FillDirection.Vertical
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
UIGridLayout.CellSize = UDim2.new(0, 100, 0.99000001, 0)
local Sections = Instance.new("Folder")
Sections.Name = "Sections"
Sections.Parent = Frame
local Library = {}
local function SetCanvas(ScrollFrame, X)
	local Total = 0
	for i, v in pairs(ScrollFrame:GetChildren()) do
		if v:IsA("GuiObject") then
			if X then
				Total = Total + v.Size.X.Offset
			else
				Total = Total + v.Size.Y.Offset + 10
			end
		end
	end
	if X then
		ScrollFrame.CanvasSize = UDim2.new(0, Total + 50, 0, 0)
	else
		Total = Total + 300
		ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, Total)
	end
end
local First = false
function Library:AddSection(Name)
	local TabButton = Instance.new("TextButton")
	TabButton.Parent = TabsFrame
	TabButton.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	TabButton.Size = UDim2.new(0, 200, 0, 50)
	TabButton.AutoButtonColor = false
	TabButton.Font = Enum.Font.SourceSansBold
	TabButton.Text = Name
	TabButton.TextColor3 = Color3.fromRGB(155, 155, 155)
	TabButton.TextSize = 20
	SetCanvas(TabsFrame, true)
	local UICorner_2 = Instance.new("UICorner")
	UICorner_2.Parent = TabButton
	local UnderLine = Instance.new("Frame")
	UnderLine.Name = "UnderLine"
	UnderLine.Parent = TabButton
	UnderLine.AnchorPoint = Vector2.new(0, 1)
	UnderLine.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	UnderLine.BorderSizePixel = 0
	UnderLine.Position = UDim2.new(0, 0, 0.99000001, 0)
	UnderLine.Size = UDim2.new(1, 0, 0, 5)
	local UIGradient_2 = Instance.new("UIGradient")
	UIGradient_2.Parent = UnderLine
	local Section = Instance.new("ScrollingFrame")
	Section.Name = "Section"
	Section.Visible = false
	Section.Parent = Sections
	Section.Active = true
	Section.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	Section.BorderColor3 = Color3.fromRGB(27, 27, 27)
	Section.BorderSizePixel = 0
	Section.Position = UDim2.new(0, 0, 0, 76)
	Section.Size = UDim2.new(1, 0, 0.823, 0)
	Section.ScrollBarThickness = 4
	local UIPadding_2 = Instance.new("UIPadding")
	UIPadding_2.Parent = Section
	UIPadding_2.PaddingBottom = UDim.new(0, 5)
	UIPadding_2.PaddingLeft = UDim.new(0, 5)
	UIPadding_2.PaddingRight = UDim.new(0, 5)
	UIPadding_2.PaddingTop = UDim.new(0, 5)
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = Section
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	local function Focus()
		for i, v in pairs(TabsFrame:GetChildren()) do
			if v:IsA("TextButton") then
				v.UnderLine.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
				v.TextColor3 = Color3.fromRGB(155, 155, 155)
			end
		end
		for i, v in pairs(Sections:GetChildren()) do
			if v:IsA("ScrollingFrame") then
				v.Visible = false
			end
		end
		Section.Visible = true
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.UnderLine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
	TabButton.Activated:Connect(Focus)
	if not First then
		Focus()
		First = true
	end

	local SectionT = {}
	function SectionT:AddToggle(Title, Desc, Callback, DefaultValue)
		local ToggleFrame = Instance.new("Frame")
		ToggleFrame.Name = "ToggleFrame"
		ToggleFrame.Parent = Section
		ToggleFrame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		ToggleFrame.Position = UDim2.new(0.139583334, 0, 0.00652457541, 0)
		ToggleFrame.Size = UDim2.new(0.99000001, 0, 0, 75)
		local UICorner_3 = Instance.new("UICorner")
		ToggleFrame.ZIndex = 1
		UICorner_3.Parent = ToggleFrame
		local Name = Instance.new("TextLabel")
		Name.Name = "Name"
		Name.Parent = ToggleFrame
		Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Name.BackgroundTransparency = 1.000
		Name.Position = UDim2.new(0.00210437714, 0, 0, 0)
		Name.Size = UDim2.new(1, 0, 0, 37)
		Name.Font = Enum.Font.SourceSansBold
		Name.Text = Title
		Name.TextColor3 = Color3.fromRGB(255, 255, 255)
		Name.TextSize = 18.000
		Name.TextWrapped = true
		Name.ZIndex = 1
		local Description = Instance.new("TextLabel")
		Description.Name = "Description"
		Description.Parent = ToggleFrame
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1.000
		Description.Position = UDim2.new(0.02104377, 0, 0.50666666, 0)
		Description.Size = UDim2.new(0.638047159, 0, 0, 37)
		Description.Font = Enum.Font.SourceSans
		Description.Text = Desc
		Description.TextColor3 = Color3.fromRGB(155, 155, 155)
		Description.TextSize = 15
		Description.TextWrapped = true
		Description.TextXAlignment = Enum.TextXAlignment.Left
		Description.TextYAlignment = Enum.TextYAlignment.Top
		Description.ZIndex = 1
		local Toggle = Instance.new("Frame")
		Toggle.Name = "Toggle"
		Toggle.Parent = ToggleFrame
		Toggle.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
		Toggle.BorderColor3 = Color3.fromRGB(44, 44, 44)
		Toggle.Position = UDim2.new(0.871212125, 0, 0.573333323, 0)
		Toggle.Size = UDim2.new(0, 50, 0, 25)
		Toggle.ZIndex = 1
		local UICorner_4 = Instance.new("UICorner")
		UICorner_4.CornerRadius = UDim.new(0, 100)
		UICorner_4.Parent = Toggle
		local BgButton = Instance.new("TextButton")
		BgButton.Name = "BgButton"
		BgButton.Parent = Toggle
		BgButton.AnchorPoint = Vector2.new(0.5, 0.5)
		BgButton.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		BgButton.BorderSizePixel = 0
		BgButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		BgButton.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
		BgButton.AutoButtonColor = false
		BgButton.Font = Enum.Font.SourceSans
		BgButton.Text = ""
		BgButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		BgButton.TextSize = 0
		BgButton.ZIndex = 1
		local UICorner_5 = Instance.new("UICorner")
		UICorner_5.CornerRadius = UDim.new(0, 100)
		UICorner_5.Parent = BgButton
		local Circle = Instance.new("TextButton")
		Circle.Name = "Circle"
		Circle.Parent = BgButton
		Circle.AnchorPoint = Vector2.new(0, 0.5)
		Circle.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
		Circle.Position = UDim2.new(0.0500000007, 0, 0.5, 0)
		Circle.Size = UDim2.new(0.400000006, 0, 0.800000012, 0)
		Circle.Font = Enum.Font.SourceSans
		Circle.Text = ""
		Circle.TextColor3 = Color3.fromRGB(0, 0, 0)
		Circle.TextSize = 14
		BgButton.ZIndex = 1
		local UICorner_6 = Instance.new("UICorner")
		UICorner_6.CornerRadius = UDim.new(0, 100)
		UICorner_6.Parent = Circle
		local ToggleT = {
			Toggled = false,
		}
		local TweenInfo = TweenInfo.new(0.1)
		local Green = Color3.fromRGB(104, 193, 81)
		local DefaultColor = Color3.fromRGB(128, 128, 128)
		local function ToggleSwitch(value)
			BgButton.Active = false
			Circle.Active = false
			local TweenButton = nil
			local TweenColor = nil
			if value ~= nil then
				ToggleT.Toggled = not value
			end
			if ToggleT.Toggled then
				TweenButton = TweenService:Create(
					Circle,
					TweenInfo,
					{ Position = UDim2.new(0.05, 0, 0.5, 0), BackgroundColor3 = DefaultColor }
				)
				TweenColor = TweenService:Create(Toggle, TweenInfo, { BackgroundColor3 = DefaultColor })
			else
				TweenButton = TweenService:Create(
					Circle,
					TweenInfo,
					{ Position = UDim2.new(0.525, 0, 0.5, 0), BackgroundColor3 = Green }
				)
				TweenColor = TweenService:Create(Toggle, TweenInfo, { BackgroundColor3 = Green })
			end
			ToggleT.Toggled = not ToggleT.Toggled
			TweenButton:Play()
			TweenColor:Play()
			TweenButton.Completed:Wait()
			BgButton.Active = true
			Circle.Active = true
		end
		function ToggleT:Toggle(value)
			ToggleSwitch(value)
			task.spawn(Callback, ToggleT.Toggled)
		end
		BgButton.Activated:Connect(function()
			ToggleT:Toggle()
		end)
		Circle.Activated:Connect(function()
			ToggleT:Toggle()
		end)
		if DefaultValue == true then
			ToggleSwitch(true)
		end
		SetCanvas(Section)
		return ToggleT
	end
	function SectionT:AddButton(Title, Callback)
		local ButtonBg = Instance.new("TextButton")
		ButtonBg.Name = "BgButton"
		ButtonBg.Parent = Section
		ButtonBg.AnchorPoint = Vector2.new(0.5, 0.5)
		ButtonBg.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		ButtonBg.BorderSizePixel = 0
		ButtonBg.Position = UDim2.new(0.5, 0, 0.5, 0)
		ButtonBg.Size = UDim2.new(0.99000001, 0, 0, 50)
		ButtonBg.AutoButtonColor = false
		ButtonBg.Font = Enum.Font.SourceSans
		ButtonBg.Text = ""
		ButtonBg.TextColor3 = Color3.fromRGB(0, 0, 0)
		ButtonBg.TextSize = 14
		ButtonBg.ZIndex = 1
		local UICorner_7 = Instance.new("UICorner")
		UICorner_7.Parent = ButtonBg
		UICorner_7.CornerRadius = UDim.new(0, 8)
		local UIPadding_3 = Instance.new("UIPadding")
		UIPadding_3.Parent = ButtonBg
		UIPadding_3.PaddingBottom = UDim.new(0, 3)
		UIPadding_3.PaddingLeft = UDim.new(0, 3)
		UIPadding_3.PaddingRight = UDim.new(0, 3)
		UIPadding_3.PaddingTop = UDim.new(0, 3)
		local TextButton = Instance.new("TextButton")
		TextButton.Parent = ButtonBg
		TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
		TextButton.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		TextButton.Size = UDim2.new(1, 0, 1, 0)
		TextButton.Font = Enum.Font.SourceSansBold
		TextButton.Text = Title
		TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.TextSize = 18
		TextButton.ZIndex = 2
		local UICorner_8 = Instance.new("UICorner")
		UICorner_8.Parent = TextButton
		UICorner_8.CornerRadius = UDim.new(0, 8)
		TextButton.Activated:Connect(Callback)
		SetCanvas(Section)
	end
	function SectionT:AddTextbox(Title, Placeholder, Callback)
		local TextBoxFrame = Instance.new("Frame")
		TextBoxFrame.Name = "TextBoxFrame"
		TextBoxFrame.Parent = Section
		TextBoxFrame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		TextBoxFrame.Position = UDim2.new(0.158333331, 0, -0.0521966033, 0)
		TextBoxFrame.Size = UDim2.new(0.99000001, 0, 0, 50)
		TextBoxFrame.ZIndex = 1
		local UICorner_9 = Instance.new("UICorner")
		UICorner_9.Parent = TextBoxFrame
		local Name_2 = Instance.new("TextLabel")
		Name_2.Name = "Name"
		Name_2.Parent = TextBoxFrame
		Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Name_2.BackgroundTransparency = 1
		Name_2.Position = UDim2.new(0.00210443046, 0, 0, 0)
		Name_2.Size = UDim2.new(0.458963901, 9, 1, 0)
		Name_2.Font = Enum.Font.SourceSansBold
		Name_2.Text = Title
		Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		Name_2.TextSize = 18
		Name_2.TextWrapped = true
		Name_2.ZIndex = 1
		local TextBox = Instance.new("TextBox")
		TextBox.Parent = TextBoxFrame
		TextBox.AnchorPoint = Vector2.new(0.5, 0)
		TextBox.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		TextBox.Position = UDim2.new(0.725168347, 0, 0, 0)
		TextBox.Size = UDim2.new(0.49000001, 0, 1, 0)
		TextBox.Font = Enum.Font.SourceSans
		TextBox.PlaceholderText = Placeholder
		TextBox.ShowNativeInput = false
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(165, 165, 165)
		TextBox.TextSize = 16
		TextBox.ZIndex = 1
		local UICorner_10 = Instance.new("UICorner")
		UICorner_10.Parent = TextBox
		local UIPadding_3 = Instance.new("UIPadding")
		UIPadding_3.Parent = TextBoxFrame
		UIPadding_3.PaddingBottom = UDim.new(0, 7)
		UIPadding_3.PaddingLeft = UDim.new(0, 7)
		UIPadding_3.PaddingRight = UDim.new(0, 7)
		UIPadding_3.PaddingTop = UDim.new(0, 7)
		TextBox.Changed:Connect(function()
			Callback(TextBox.Text)
		end)
		SetCanvas(Section)
	end
	function SectionT:AddDropdown(Title, Items, Callback)
		local DropdownFrame = Instance.new("Frame")
		DropdownFrame.Name = "DropdownFrame"
		DropdownFrame.Parent = Section
		DropdownFrame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		DropdownFrame.Position = UDim2.new(0.158333331, 0, -0.0521966033, 0)
		DropdownFrame.Size = UDim2.new(0.99000001, 0, 0, 50)
		DropdownFrame.ZIndex = 1
		local Name_3 = Instance.new("TextLabel")
		Name_3.Name = "Name"
		Name_3.Parent = DropdownFrame
		Name_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Name_3.BackgroundTransparency = 1
		Name_3.Position = UDim2.new(0.00210443046, 0, 0, 0)
		Name_3.Size = UDim2.new(0.458963901, 9, 1, 0)
		Name_3.Font = Enum.Font.SourceSansBold
		Name_3.Text = Title
		Name_3.TextColor3 = Color3.fromRGB(255, 255, 255)
		Name_3.TextSize = 18
		Name_3.TextWrapped = true
		Name_3.ZIndex = 1
		local UIPadding_4 = Instance.new("UIPadding")
		UIPadding_4.Parent = DropdownFrame
		UIPadding_4.PaddingBottom = UDim.new(0, 7)
		UIPadding_4.PaddingLeft = UDim.new(0, 7)
		UIPadding_4.PaddingRight = UDim.new(0, 7)
		UIPadding_4.PaddingTop = UDim.new(0, 7)
		local Dropdown = Instance.new("Frame")
		Dropdown.Name = "Dropdown"
		Dropdown.Parent = DropdownFrame
		Dropdown.AnchorPoint = Vector2.new(0.5, 0)
		Dropdown.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		Dropdown.Position = UDim2.new(0.725000024, 0, 0, 0)
		Dropdown.Size = UDim2.new(0.49000001, 0, 1, 0)
		Dropdown.ZIndex = 1
		local UICorner_11 = Instance.new("UICorner")
		UICorner_11.Parent = Dropdown
		local TextButton_3 = Instance.new("TextButton")
		TextButton_3.Parent = Dropdown
		TextButton_3.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		TextButton_3.BackgroundTransparency = 1.000
		TextButton_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TextButton_3.BorderSizePixel = 0
		TextButton_3.Size = UDim2.new(0, 189, 1, 0)
		TextButton_3.Font = Enum.Font.SourceSansBold
		TextButton_3.Text = "Selected Value"
		TextButton_3.TextColor3 = Color3.fromRGB(230, 230, 230)
		TextButton_3.TextSize = 17
		TextButton_3.TextXAlignment = Enum.TextXAlignment.Left
		TextButton_3.ZIndex = 1
		local UIPadding_5 = Instance.new("UIPadding")
		UIPadding_5.Parent = TextButton_3
		UIPadding_5.PaddingLeft = UDim.new(0, 10)
		local TextButton_4 = Instance.new("TextButton")
		TextButton_4.Parent = Dropdown
		TextButton_4.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		TextButton_4.BackgroundTransparency = 1.000
		TextButton_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
		TextButton_4.BorderSizePixel = 0
		TextButton_4.Position = UDim2.new(0.84960258, 0, 0, 0)
		TextButton_4.Size = UDim2.new(0, 36, 1, 0)
		TextButton_4.Font = Enum.Font.SourceSansBold
		TextButton_4.Text = "v"
		TextButton_4.TextColor3 = Color3.fromRGB(230, 230, 230)
		TextButton_4.TextSize = 19.000
		TextButton_4.ZIndex = 1
		local UICorner_12 = Instance.new("UICorner")
		UICorner_12.Parent = DropdownFrame
		local Content = Instance.new("Frame")
		Content.Name = "Content"
		Content.Parent = Dropdown
		Content.AnchorPoint = Vector2.new(0.5, 0)
		Content.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
		Content.BorderSizePixel = 0
		Content.ClipsDescendants = true
		Content.Position = UDim2.new(0.5, 0, 0.811111271, 0)
		Content.Size = UDim2.new(1, 0, 0, 0)
		Content.ZIndex = 6
		local Search = Instance.new("TextBox")
		Search.Name = "Search"
		Search.Parent = Content
		Search.AnchorPoint = Vector2.new(0, 0)
		Search.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		Search.BorderSizePixel = 0
		Search.Position = UDim2.new(0.769416153, 0, 0.020526316, 0)
		Search.Size = UDim2.new(1, 0, 0, 35)
		Search.Font = Enum.Font.SourceSans
		Search.PlaceholderText = "Search"
		Search.ShowNativeInput = false
		Search.Text = ""
		Search.TextColor3 = Color3.fromRGB(165, 165, 165)
		Search.TextSize = 16
		Search.ZIndex = 6
		local UIListLayout_2 = Instance.new("UIListLayout")
		UIListLayout_2.Parent = Content
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		local UIPadding_6 = Instance.new("UIPadding")
		UIPadding_6.Parent = Content
		UIPadding_6.PaddingBottom = UDim.new(0, 3)
		UIPadding_6.PaddingLeft = UDim.new(0, 4)
		UIPadding_6.PaddingRight = UDim.new(0, 4)
		UIPadding_6.PaddingTop = UDim.new(0, 7)
		local UICorner_13 = Instance.new("UICorner")
		UICorner_13.Parent = Content
		local Elements = Instance.new("ScrollingFrame")
		Elements.Name = "Elements"
		Elements.Parent = Content
		Elements.Active = true
		Elements.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Elements.BackgroundTransparency = 1
		Elements.BorderSizePixel = 0
		Elements.Position = UDim2.new(-0.00222222228, 0, 0.184210524, 0)
		Elements.Size = UDim2.new(0, 226, 0, 158)
		Elements.ScrollBarThickness = 4
		Elements.ZIndex = 6
		local UIListLayout_3 = Instance.new("UIListLayout")
		UIListLayout_3.Parent = Elements
		UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_3.Padding = UDim.new(0, 3)
		local UIPadding_8 = Instance.new("UIPadding")
		UIPadding_8.Parent = Elements
		UIPadding_8.PaddingTop = UDim.new(0, 3)
		UIPadding_8.PaddingBottom = UDim.new(0, 3)
		UIPadding_8.PaddingLeft = UDim.new(0, 4)
		UIPadding_8.PaddingRight = UDim.new(0, 4)
		local Open = false
		local TweenParams = TweenInfo.new(0.1)
		local function OpenDropdown()
			TextButton_4.Active = false -- v
			TextButton_3.Active = false -- value
			local TweenOrientation = nil
			local TweenSize = nil
			if Open then
				TweenOrientation = TweenService:Create(TextButton_4, TweenParams, { Rotation = 0 })
				TweenSize = TweenService:Create(Content, TweenParams, { Size = UDim2.new(1, 0, 0, 0) })
			else
				TweenOrientation = TweenService:Create(TextButton_4, TweenParams, { Rotation = 180 })
				TweenSize = TweenService:Create(Content, TweenParams, { Size = UDim2.new(1, 0, 0, 200) })
			end
			Open = not Open
			TweenOrientation:Play()
			TweenSize:Play()
			TweenSize.Completed:Wait()
			TextButton_4.Active = true
			TextButton_3.Active = true
		end
		local function CreateButton(Name)
			local TextButton_5 = Instance.new("TextButton")
			TextButton_5.Parent = Elements
			TextButton_5.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
			TextButton_5.BorderColor3 = Color3.fromRGB(27, 42, 53)
			TextButton_5.BorderSizePixel = 0
			TextButton_5.Size = UDim2.new(1, 0, 0, 35)
			TextButton_5.Font = Enum.Font.SourceSansBold
			TextButton_5.Text = Name
			TextButton_5.TextColor3 = Color3.fromRGB(125, 125, 125)
			TextButton_5.TextSize = 17
			TextButton_5.ZIndex = 7
			TextButton_5.Activated:Connect(function()
				task.spawn(Callback, Name)
				TextButton_3.Text = Name
				for i, v in pairs(Elements:GetChildren()) do
					if v:IsA("TextButton") then
						v.TextColor3 = Color3.fromRGB(125, 125, 125)
					end
				end
				TextButton_5.TextColor3 = Color3.fromRGB(230, 230, 230)
				Open = true
				OpenDropdown()
			end)
		end
		for _, v in pairs(Items) do
			CreateButton(tostring(v))
		end
		SetCanvas(Elements)
		TextButton_4.Activated:Connect(OpenDropdown)
		TextButton_3.Activated:Connect(OpenDropdown)
		Search.Changed:Connect(function()
			for _, v in pairs(Elements:GetChildren()) do
				if v:IsA("TextButton") then
					if string.find(v.Text:lower(), Search.Text:lower()) then
						v.Visible = true
					else
						v.Visible = false
					end
				end
			end
		end)
		SetCanvas(Section)
	end
	function SectionT:AddLabel(Title)
		local TextLabel = Instance.new("TextLabel")
		TextLabel.Parent = Section
		TextLabel.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.BorderSizePixel = 0
		TextLabel.Size = UDim2.new(0.99000001, 0, 0, 30)
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Text = Title
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 18.000
		TextLabel.TextYAlignment = Enum.TextYAlignment.Top
		TextLabel.ZIndex = 1
		local UIPadding = Instance.new("UIPadding")
		UIPadding.Parent = TextLabel
		UIPadding.PaddingBottom = UDim.new(0, 5)
		UIPadding.PaddingLeft = UDim.new(0, 5)
		UIPadding.PaddingRight = UDim.new(0, 5)
		UIPadding.PaddingTop = UDim.new(0, 5)
		local Label = {}
		function Label:SetText(Title)
			TextLabel.Text = Title
		end
		return Label
	end

	return SectionT
end

local Notification = Instance.new("Frame")
Notification.Name = "Notification"
Notification.Parent = ScreenGui
Notification.AnchorPoint = Vector2.new(1, 1)
Notification.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Notification.BackgroundTransparency = 1.000
Notification.ClipsDescendants = true
Notification.Position = UDim2.new(1, -100, 1, 0)
Notification.Size = UDim2.new(0, 200, 1, 0)
local NotificationPadding = Instance.new("UIPadding")
NotificationPadding.Parent = Notification
NotificationPadding.PaddingBottom = UDim.new(0, 30)
NotificationPadding.PaddingTop = UDim.new(0, 30)
local NotificationInner = Instance.new("Frame")
NotificationInner.Parent = Notification
NotificationInner.AnchorPoint = Vector2.new(0, 1)
NotificationInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NotificationInner.BackgroundTransparency = 1.000
NotificationInner.ClipsDescendants = true
NotificationInner.Position = UDim2.new(0, 0, 1, 0)
NotificationInner.Size = UDim2.new(1, 0, 0, 240)
local NotificationList = Instance.new("UIListLayout")
NotificationList.Parent = NotificationInner
NotificationList.SortOrder = Enum.SortOrder.LayoutOrder
NotificationList.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotificationList.Padding = UDim.new(0, 5)
local NotificationTweenInfo = TweenInfo.new(1)
local function Tween(GUI, TweenData)
	return TweenService:Create(
		GUI,
		NotificationTweenInfo,
		TweenData
	)
end
function Library:Notify(Title, Description)
	task.spawn(function()
		local Notification = Instance.new("Frame")
		Notification.Name = "Notification"
		Notification.Parent = NotificationInner
		Notification.Transparency = 1
		Notification.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
		Notification.ClipsDescendants = true
		Notification.Size = UDim2.new(1, 0, 0, 75)
		local UICorner = Instance.new("UICorner")
		UICorner.Parent = Notification
		UICorner.CornerRadius = UDim.new(0, 5)
		local TextLabel = Instance.new("TextLabel")
		TextLabel.Parent = Notification
		TextLabel.Transparency = 1
		TextLabel.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
		TextLabel.Size = UDim2.new(1, 0, 0, 20)
		TextLabel.Font = Enum.Font.SourceSansBold
		TextLabel.Text = Title
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 16.000
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		local UIPadding_2 = Instance.new("UIPadding")
		UIPadding_2.Parent = Notification
		UIPadding_2.PaddingBottom = UDim.new(0, 8)
		UIPadding_2.PaddingLeft = UDim.new(0, 8)
		UIPadding_2.PaddingRight = UDim.new(0, 8)
		UIPadding_2.PaddingTop = UDim.new(0, 8)
		local TextLabel_2 = Instance.new("TextLabel")
		TextLabel_2.Parent = Notification
		TextLabel_2.TextWrapped = true
		TextLabel_2.Transparency = 1
		TextLabel_2.BorderSizePixel = 0
		TextLabel_2.Position = UDim2.new(0, 0, 0, 25)
		TextLabel_2.Size = UDim2.new(1, 0, 0.305084735, 20)
		TextLabel_2.Font = Enum.Font.SourceSans
		TextLabel_2.Text = Description
		TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.TextSize = 15.000
		TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
		TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top
		local T1,T2,T3 = 
			Tween(Notification, { Transparency = 0}), 
			Tween(TextLabel, { TextTransparency = 0, BackgroundTransparency = 1}), 
			Tween(TextLabel_2, { TextTransparency = 0, BackgroundTransparency = 1})
		T1:Play();T2:Play();T3:Play()
		T1.Completed:Wait()
		task.wait(5)
		T1,T2,T3 = 
		Tween(Notification, { Transparency = 1}), 
		Tween(TextLabel, { TextTransparency = 1, BackgroundTransparency = 1}), 
		Tween(TextLabel_2, { TextTransparency = 1, BackgroundTransparency = 1})
		T1:Play();T2:Play();T3:Play()
		task.wait(1.5)
		Notification:Destroy()
	end)
end

function Library:Destroy()
	ScreenGui:Destroy()
end
local visible = true
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(UserInput, IsTyping)
	if UserInputService:IsKeyDown(Enum.KeyCode.RightShift) and not isTyping then
		if visible then
			Frame.Visible = false
			visible = false
		else
			Frame.Visible = true
			visible = true
		end
	end
end)
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	Frame.Position =
		UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
loadstring(Loader)()

		ScreenGui.Enabled = true
	task.wait(0.1)
	Library:Notify("Information", "Press Right Shift to hide/show the GUI")
task.wait(0.5)
return Library
