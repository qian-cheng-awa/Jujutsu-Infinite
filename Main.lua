if identifyexecutor() == "Delta" then
	getrenv().RunInDeltaUi = true
end
queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/qian-cheng-awa/Jujutsu-Infinite/refs/heads/main/Main.lua"))

local FilePath = [[TDM/Jujutsu Infinite/]]
local AutoSEC = isfile(FilePath.."AutoSEC") and readfile(FilePath.."AutoSEC") == "true" or false

if AutoSEC then
	if game.PlaceId == 90925658700602 then
		repeat
			task.wait()
		until game.Loaded

		while task.wait(1) do
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("CreateLobby"):InvokeServer("Boss","Six Eyed Calamity",1,"Nightmare","bxnb66")
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("StartLobby"):InvokeServer("Boss")
			end)
		end

		local CreateLobby = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("CreateLobby")
		local Start = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("StartLobby")

		if CreateLobby:InvokeServer("Boss","Six Eyed Calamity",1,"Nightmare","bxnb66") then
			task.wait()
			Start:InvokeServer("Boss")
		end

		return
	elseif game.PlaceId == 100730147537810 then
		repeat
			task.wait()
		until game.Loaded

		while task.wait(1) do
			pcall(function()
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("CreateLobby"):InvokeServer("Boss","Six Eyed Calamity",1,"Medium","bxnb66")
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("StartLobby"):InvokeServer("Boss")
			end)
		end

		local CreateLobby = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("CreateLobby")
		local Start = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Raids"):WaitForChild("StartLobby")

		if CreateLobby:InvokeServer("Boss","Six Eyed Calamity",1,"Medium","bxnb66") then
			task.wait()
			Start:InvokeServer("Boss")
		end

		return
	elseif game.PlaceId == 16379657109 then
		game:GetService("TeleportService"):Teleport(90925658700602,game:GetService("Players").LocalPlayer)
	end
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/qian-cheng-awa/Rayfield/refs/heads/main/Main.lua'))()
local Player = game:GetService("Players").LocalPlayer
if Player.Backpack:FindFirstChild("TDMSkill") then
	Player.Backpack:FindFirstChild("TDMSkill"):Destroy()
end
if Player.Character and Player.Character:FindFirstChild("TDMSkill") then
	Player.Character:FindFirstChild("TDMSkill"):Destroy()
end

if gethui():FindFirstChild("Skills") then
	gethui().Skills:Destroy()
end
local Character = Player.Character
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalizationService = game:GetService("LocalizationService")
local KeyCodes = {"Z","X","C","V","B","G","T","Y"}

local LootUi = Player.PlayerGui:WaitForChild("Loot"):Clone()
LootUi.Parent = gethui()
LootUi.Results.Visible = true
LootUi.Frame:Destroy()
LootUi.Results.Main.Continue:Destroy()
LootUi.Results.Main.ScrollingFrame.CanvasSize = UDim2.new(0,0,0,0)
LootUi.Results.Main.ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
local SkillUi = Player.PlayerGui.Skills:Clone()
SkillUi.Enabled = false
SkillUi.Parent = gethui()
SkillUi.Frame.OverheadTabs.Skills:Destroy()
local SkillTool = isfile(FilePath.."SkillToolEnabled") and readfile(FilePath.."SkillToolEnabled") == "true" or false
local TabButton = SkillUi.Frame.OverheadTabs.Innates
TabButton.Name = "Skills"
TabButton.TextLabel.Text = "特殊技能。"

local ScollingFrame = SkillUi.Frame.Customize.Skills
ScollingFrame.CanvasSize = UDim2.new(0,0,0,0)
ScollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
for i,v in ipairs(ScollingFrame:GetChildren()) do
	if v:IsA("ImageButton") then
		v:Destroy()
	end
end

local TweenService = game:GetService("TweenService")

local HttpService = game:GetService("HttpService")
local Cooldowns = {}
local function UseSkill(Skill)
	if not Skill then return end
	if Cooldowns[Skill] then return end

	if Tool and Tool.Parent ~= Character then  
		Cooldowns[Skill] = game:GetService("ReplicatedStorage").Skills:FindFirstChild(Skill):FindFirstChild("Cooldown") and game:GetService("ReplicatedStorage").Skills[Skill].Cooldown.Value or 0
	end

	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("Skill"):FireServer(Skill)
end

local function m1(Anim)
	if typeof(Anim) ~= "table" then
		Anim = {Anim}
	end

	for _,v in pairs(Anim) do
		if v and v:FindFirstChild("CombatAgent") and not v.CombatAgent.Statuses:FindFirstChild("InCutscene") then
		else
			table.remove(Anim,v)
		end
	end

	if not Anim[1] then return end
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("ChangeWeapon"):FireServer("Infinity Sorcerer")
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("M1"):FireServer(math.random(1,5),Anim)
end

local function BlackFlash()
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("ApplyBlackFlashToNextHitbox"):FireServer(1)
	game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("M2"):FireServer()
end

local function InInfinityShield()
	if workspace.Objects.Effects:FindFirstChild("SECCocoon") then
		return true
	end
	return Player.Character and Player.Character:WaitForChild("Humanoid").CombatAgent.Statuses:FindFirstChild("InfinityShield")
end

local Slot = game:GetService("ReplicatedStorage").ReplicatedAssets.UI.SkillSlot

local CurrentSkills = isfile(FilePath.."Skills") and HttpService:JSONDecode(readfile(FilePath.."Skills")) or {}

local ListButton = game:GetService("ReplicatedStorage").ReplicatedAssets.UI.SkillListCustomize

SkillUi.Frame.Customize.Loadouts:Destroy()

local Selected

local function GetSkillIcon(Skill)
	return Skill:FindFirstChild("Icon") and Skill.Icon.Value or ""
end


for _,v in ipairs(game:GetService("ReplicatedStorage").Skills:GetChildren()) do
	local NewButton = ListButton:Clone()
	NewButton.Name = v.Name
	NewButton.SkillName.Text = LocalizationService:GetTranslatorForPlayer(Player):Translate(Player.PlayerGui.Skills,v.Name) or v.Name
	NewButton.Icon.Image = GetSkillIcon(v)
	NewButton.Parent = ScollingFrame

	NewButton.MouseButton1Click:Connect(function()
		if Selected == v then
			Selected = nil
			TweenService:Create(
				NewButton.Outline,
				TweenInfo.new(.5),
				{ImageColor3 = Color3.fromRGB(255,255,255)}	
			):Play()
			return
		end
		Selected = v
		for i,v in ipairs(ScollingFrame:GetChildren()) do
			if v:IsA("ImageButton") and v.Outline.ImageColor3 ~= Color3.new(255,255,255) then
				TweenService:Create(
					v.Outline,
					TweenInfo.new(.5),
					{ImageColor3 = Color3.new(255,255,255)}	
				):Play()
			end
		end
		TweenService:Create(
			NewButton.Outline,
			TweenInfo.new(.5),
			{ImageColor3 = Color3.fromRGB(48, 188, 237)}	
		):Play()
	end)
end

local SkillsBar = Player.PlayerGui.Main.Frame.BottomRight.SkillBars
SkillUi.Frame.Customize.Searchbar.Search.TextBox.FocusLost:Connect(function()
	local Input = SkillUi.Frame.Customize.Searchbar.Search.TextBox.Text
	for i,v in ipairs(ScollingFrame:GetChildren()) do
		if v:IsA("ImageButton") then
			if Input == "" or string.find(v.Name:lower(),Input:lower()) or string.find(v.SkillName.Text:lower(),Input:lower()) then
				v.Visible = true
			else
				v.Visible = false
			end
		end
	end
end)

local function UpdateSkillsBar()
	if Tool.Parent == Player.Backpack then
		return
	end

	for i,v in ipairs(SkillsBar:GetChildren()) do
		if v:IsA("Frame") then
			v:SetAttribute("Removing",true)
			v:Destroy()
		end
	end

	for _,Keycode in pairs(KeyCodes) do
		local SkillName = CurrentSkills[Keycode]
		if not SkillName then continue end
		if Player.PlayerGui.Main.Frame.BottomRight.SkillBars:FindFirstChild("MobileGrid") then
			local SkillButton = game:GetService("ReplicatedStorage").ReplicatedAssets.UI.MobileSkill:Clone()
			SkillButton.Name = SkillName
			SkillButton.SkillName.Text = SkillName
			SkillButton.Keybind.Text = Keycode
			SkillButton.Parent = SkillsBar
			SkillButton.Icon.Image = GetSkillIcon(game:GetService("ReplicatedStorage").Skills[SkillName])
			SkillButton.Use.MouseButton1Click:Connect(function()
				UseSkill(SkillName)
			end)
		else
			local SkillButton = game:GetService("ReplicatedStorage").ReplicatedAssets.UI.Skill:Clone()
			SkillButton.Name = SkillName
			SkillButton.SkillName.Text = SkillName
			SkillButton.Keybind.Text = Keycode
			SkillButton.Parent = SkillsBar
		end
	end
end

local function addtool()
	if not SkillTool then return end
	Tool = Instance.new("Tool",Player.Backpack)
	Tool.Name = "TDMSkill"
	Tool.CanBeDropped = false
	Tool.AncestryChanged:Connect(function()
		if Tool.Parent == Player.Character then
			UpdateSkillsBar()
		end
	end)

	Tool.Unequipped:Connect(function()
		for i,v in ipairs(SkillsBar:GetChildren()) do
			if v:IsA("Frame") then
				v:Destroy()
			end
		end
	end)

	Tool.Destroying:Connect(function()
		for i,v in ipairs(SkillsBar:GetChildren()) do
			if v:IsA("Frame") then
				v:Destroy()
			end
		end
	end)
end

for i,v in ipairs(SkillUi.Frame.Customize.Slots:GetChildren()) do
	if v:IsA("Frame") then
		v:Destroy()
	end
end

Player.CharacterAdded:Connect(function()
	addtool()
end)

function ApplySkill(Frame,Skill)
	for i,v in ipairs(SkillUi.Frame.Customize.Slots:GetChildren()) do
		if v:IsA("Frame") then
			TweenService:Create(
				v.Use.ImageLabel,
				TweenInfo.new(.5),
				{ImageColor3 = Color3.fromRGB(255,255,255)}	
			):Play()
		end
	end

	if not Skill then
		Frame.SkillName.Text = ""
		Frame.Icon.Image = ""
		CurrentSkills[Frame.Keybind.Text] = nil
		writefile(FilePath.."Skills",HttpService:JSONEncode(CurrentSkills))
		return
	end

	for i,v in ipairs(SkillUi.Frame.Customize.Slots:GetChildren()) do
		if v:IsA("Frame") then
			if v.SkillName.Text == game:GetService("LocalizationService"):GetTranslatorForPlayer(Player):Translate(Player.PlayerGui.Skills,Skill.Name) then
				ApplySkill(v)
				if v == Frame then
					return
				end
			end
		end
	end

	CurrentSkills[Frame.Keybind.Text] = Skill.Name
	writefile(FilePath.."Skills",HttpService:JSONEncode(CurrentSkills))
	Frame.SkillName.Text = game:GetService("LocalizationService"):GetTranslatorForPlayer(Player):Translate(Player.PlayerGui.Skills,Skill.Name)
	Frame.Icon.Image = GetSkillIcon(Skill)
end

for _,KeyCode in pairs(KeyCodes) do
	local Skill = CurrentSkills[KeyCode]
	local NewSlot = Slot:Clone()
	NewSlot.Parent = SkillUi.Frame.Customize.Slots
	NewSlot.Keybind.Visible = true
	NewSlot.Keybind.Text = KeyCode
	NewSlot.SkillName.Text = ""

	if Skill then
		ApplySkill(NewSlot,game:GetService("ReplicatedStorage").Skills:FindFirstChild(Skill))
	end

	NewSlot.Use.MouseButton1Click:Connect(function()
		if not Selected then
			if not CurrentSkills[KeyCode] then return end
			Selected = game:GetService("ReplicatedStorage").Skills:FindFirstChild(CurrentSkills[KeyCode])
			if not Selected then return end

			for i,v in ipairs(SkillUi.Frame.Customize.Slots:GetChildren()) do
				if v:IsA("Frame") then
					TweenService:Create(
						v.Use.ImageLabel,
						TweenInfo.new(.5),
						{ImageColor3 = Color3.new(255,255,255)}	
					):Play()
				end
			end

			TweenService:Create(
				NewSlot.Use.ImageLabel,
				TweenInfo.new(.5),
				{ImageColor3 = Color3.fromRGB(48, 188, 237)}	
			):Play()
			return 
		end

		ApplySkill(NewSlot,Selected)
		Selected = nil
		for i,v in ipairs(ScollingFrame:GetChildren()) do
			if v:IsA("ImageButton") then
				TweenService:Create(
					v.Outline,
					TweenInfo.new(.5),
					{ImageColor3 = Color3.new(255,255,255)}	
				):Play()
			end
		end

		UpdateSkillsBar()
	end)
end

game:GetService("UserInputService").InputBegan:Connect(function(input,gpe)
	if gpe then return end

	if CurrentSkills[input.KeyCode.Name] and Tool.Parent == Player.Character then
		local Skill = CurrentSkills[input.KeyCode.Name]
		UseSkill(Skill)
	end
end)

SkillsBar.ChildRemoved:Connect(function(a)
	if a:GetAttribute("Removing") then
		return
	end
	if Tool and Tool.Parent == Player.Character then
		UpdateSkillsBar()
	end
end)

local sus,gameinfo = pcall(function()
	return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)

if not sus then
	gameinfo = {
		IconImageAssetId = 109251559,
		Name = "TDM",
	}
end

local Window = Rayfield:CreateWindow({
	Name = "咒术无限",
	Icon = gameinfo.IconImageAssetId,
	LoadingUiIcon = gameinfo.IconImageAssetId,
	ShowText = "TDM",
	LoadingUiText = gameinfo.Name,
	LoadingTitle = "TDM",
	LoadingSubtitle = "by 辟邪",
	Theme = "Amethyst",
	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,
	ConfigurationSaving = {
		Enabled = false,
	},
})

local Combat = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat")
local SECAnimations = {
	purple = "rbxassetid://135633839025251",
	redcharge = "rbxassetid://94758532321367",
	redfire = "rbxassetid://136244624896496",
	hand = "rbxassetid://79262957320757",
	Stun = "rbxassetid://95980992450841",
	Purple2 = "rbxassetid://89669553803614",
	Stun2 = "rbxassetid://104529802805115",
	HandQTEA = "rbxassetid://134072664791497",

}

local SEC = workspace.Objects.Mobs:FindFirstChild("Six Eyed Calamity")

local FirstGlobal = require(game:GetService("ReplicatedFirst").Dependencies.Global)

local Tab : {
	CreateButton : (self : any, {Name : string, Callback : () -> ()}) -> (),
	CreateToggle : (self : any, {Name : string, Callback : (Value : boolean) -> (), CurrentValue : boolean}) -> ({CurrentValue : boolean, Set : (Value : boolean) -> ()}),
	CreateColorPicker : (self : any, {Name : string, Callback : (Value : Color3) -> (), Color : Color3}) -> ({Color : Color3, Set : (Value : Color3) -> ()}),
	CreateSlider : (self : any, {Name : string, Callback : (Value : number) -> (), Range : { Min : number,Max : number }, Increment : number, Suffix : string, CurrentValue : number}) -> ({CurrentValue : number, Set : (Value : number) -> ()}),
	CreateInput : (self : any, {Name : string, Callback : (Value : string) -> (), CurrentValue : string, PlaceholderText : string, RemoveTextAfterFocusLost : boolean}) -> ({CurrentValue : string, Set : (Value : string) -> ()}),
	CreateDropdown : (self : any, {Name : string, Callback : (Value : string) -> (), Options : { any }, CurrentOption : { any }, MultipleOptions : boolean}) -> ({CurrentOption : string, Refresh : (Options : { any }) -> (), Set : ({ any })})
} = Window:CreateTab("主要", "airplay")

local godmode = isfile(FilePath.."GodMode") and readfile(FilePath.."GodMode") == "true" or false
if game.PlaceId ~= 16379688837 then
	godmode = false
	writefile(FilePath.."GodMode", tostring(godmode))
end

Tab:CreateToggle({
	Name = "角色无敌",
	CurrentValue = godmode,
	Callback = function(Value)
		godmode = Value
		writefile(FilePath.."GodMode", tostring(Value))
	end,
})

Tab:CreateToggle({
	Name = "杀戮光环",
	CurrentValue = KillAura,
	Callback = function(Value)
		KillAura = Value
		writefile(FilePath.."KillAura", tostring(Value))
	end,
})

local KillAuraN = isfile(FilePath.."KillAuraN") and tonumber(readfile(FilePath.."KillAuraN")) or 20

Tab:CreateSlider({
	Name = "杀戮光环斩杀线",
	Range = {0, 100},
	Increment = 1,
	CurrentValue = KillAuraN,
	Suffix = "%",
	Callback = function(Value)
		KillAuraN = Value
		writefile(FilePath.."KillAuraN", tostring(Value))
	end,
})

Tab:CreateButton({
	Name = "补充领域条",
	Callback = function()
		FirstGlobal.domainMeter = 100
	end,
})

local SECShield = isfile(FilePath.."SECShield") and readfile(FilePath.."SECShield") == "true" or false

Tab:CreateToggle({
	Name = "无限六眼灾难护盾值",
	CurrentValue = SECShield,
	Callback = function(Value)
		SECShield = Value
		writefile(FilePath.."SECShield", tostring(Value))
	end,
})

Tab:CreateInput({
	Name = "最大黑闪条",
	CurrentValue = "",
	PlaceholderText = "输入数字...",
	Callback = function(Value)
		local num = tonumber(Value)
		if not num then return end

		FirstGlobal.maxFocus = num
	end,
})

Tab:CreateButton({
	Name = "增加黑闪能量",
	Callback = function()
		FirstGlobal.focus += 1
	end,
})

Tab:CreateButton({
	Name = "增加黑闪红条",
	Callback = function()
		FirstGlobal.blackFlashCombo += 1
	end,
})

Tab:CreateButton({
	Name = "补充99由基质量条",
	Callback = function()
		FirstGlobal.massMeter = 100
	end,
})

Tab:CreateButton({
	Name = "补充宿傩燃料条",
	Callback = function()
		FirstGlobal.fuelMeter = 100
	end,
})

Tab:CreateButton({
	Name = "补充虎杖灵魂条",
	Callback = function()
		FirstGlobal.soulStyleMeter = 100
	end,
})

Tab:CreateButton({
	Name = "补充鹿子云一音量条",
	Callback = function()
		FirstGlobal.volumeMeter = 100
	end,
})

Tab = Window:CreateTab("挂机", "airplay")
local AntiAfk = Tab:CreateToggle({
	Name = "反挂机踢",
	CurrentValue = true,
	Callback = function(Value)
	end,
})

local lootenabled = isfile(FilePath.."ShowLoot") and readfile(FilePath.."ShowLoot") == "true" or false
LootUi.Enabled = lootenabled
Tab:CreateToggle({
	Name = "收益总览",
	CurrentValue = lootenabled,
	Callback = function(Value)
		writefile(FilePath.."ShowLoot", tostring(Value))
		LootUi.Enabled = Value
	end,
})

local AutoBoss = isfile(FilePath.."AutoBoss") and readfile(FilePath.."AutoBoss") == "true" or false
if game.PlaceId ~= 16379688837 then
	AutoBoss = false
	writefile(FilePath.."AutoBoss", tostring(AutoBoss))
end
Tab:CreateToggle({
	Name = "自动BOSS",
	CurrentValue = AutoBoss,
	Callback = function(Value)
		writefile(FilePath.."AutoBoss", tostring(Value))
		AutoBoss = Value
	end,
})

if game.PlaceId ~= 16379688837 and game.PlaceId ~= 100730147537810 then
	AutoSEC = false
	writefile(FilePath.."AutoSEC", tostring(AutoSEC))
end
Tab:CreateToggle({
	Name = "自动六眼灾难",
	CurrentValue = AutoSEC,
	Callback = function(Value)
		writefile(FilePath.."AutoSEC", tostring(Value))
		AutoSEC = Value
	end,
})

local AutoInvestgations = isfile(FilePath.."AutoInvestgations") and readfile(FilePath.."AutoInvestgations") == "true" or false
if game.PlaceId == 10450270085 then
	AutoInvestgations = false
	writefile(FilePath.."AutoInvestgations", tostring(AutoInvestgations))
end
Tab:CreateToggle({
	Name = "自动调查",
	CurrentValue = AutoInvestgations,
	Callback = function(Value)
		writefile(FilePath.."AutoInvestgations", tostring(Value))
		AutoInvestgations = Value
	end,
})

Tab = Window:CreateTab("自定义技能", "airplay")
local Weapons = require(game:GetService("ReplicatedStorage").Dependencies.Weapons)
local a = {}
for i,_ in pairs(Weapons) do
	table.insert(a,i)
end
local CurseTool
Tab:CreateDropdown({
	Name = "武器",
	Options = a,
	CurrentValue = nil,
	Callback = function(Value)
		CurseTool = unpack(Value)
	end,
})

local ToggleCurseTool = false
Tab:CreateToggle({
	Name = "更改当前咒具",
	CurrentValue = ToggleCurseTool,
	Callback = function(Value)
		ToggleCurseTool = Value
	end,
})

Tab:CreateToggle({
	Name = "技能工具",
	CurrentValue = SkillTool,
	Callback = function(Value)
		SkillTool = Value
		writefile(FilePath.."SkillToolEnabled", tostring(Value))
		if not Value then
			if Player.Backpack:FindFirstChild("TDMSkill") then
				Player.Backpack:FindFirstChild("TDMSkill"):Destroy()
			end
			if Player.Character:FindFirstChild("TDMSkill") then
				Player.Character:FindFirstChild("TDMSkill"):Destroy()
			end
		else
			addtool()
		end
	end,
})

addtool()

Tab:CreateButton({
	Name = "切换脚本技能ui",
	Callback = function()
		SkillUi.Enabled = not SkillUi.Enabled
	end,
})

Tab = Window:CreateTab("免费通行证", "airplay")

Tab:CreateButton({
	Name = "领取交流会高级通行证奖励",
	Callback = function()
		for i=1,Player.ReplicatedData.exchangeData.battlepassTier.Value do
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Data"):WaitForChild("ClaimBattlepassReward"):InvokeServer("premium",i)
		end
	end,
})

local Innates = {}
local T = {}

for i,Value in ipairs(Player.ReplicatedData.innatebag:GetChildren()) do
	if not Value.Value then continue end
	local TE = LocalizationService:GetTranslatorForPlayer(Player):Translate(Player.PlayerGui,Value.Name)
	Innates[TE] = Value.Name
	T[i] = TE
end

local CurrentInnate = Tab:CreateDropdown({
	Name = "选择术士",
	Options = T,
	CurrentOption = {""},
	MultipleOptions = false,
	Callback = function(Value)
	end,
})

local CurrentSlot = Tab:CreateDropdown({
	Name = "选择槽位",
	Options = {"1","2","3","4"},
	CurrentOption = {"1"},
	MultipleOptions = false,
	Callback = function(Value)
	end,
})

Tab:CreateButton({
	Name = "替换选择的槽位",
	Callback = function()
		if CurrentInnate.CurrentOption[1] == "" then return end

		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Data"):WaitForChild("SetInnateBag"):FireServer(
			tonumber(CurrentSlot.CurrentOption[1]),
			Innates[CurrentInnate.CurrentOption[1]]
		)
	end,
})

local FastSpin = Tab:CreateToggle({
	Name = "光速抽奖（选择的槽位）",
	CurrentValue = false,
	Callback = function(Value)
	end,
})

game:GetService("Players").LocalPlayer.Idled:Connect(function()
	if not AntiAfk.CurrentValue then return end

	local MousePos = game:GetService("Players").LocalPlayer.PlayerGui.Main.Frame.BottomLeft.CurrencyFrame.AbsolutePosition
	VirtualInputManager:SendMouseButtonEvent(MousePos.X, MousePos.Y, 0, true, game, 0)
	task.wait()
	VirtualInputManager:SendMouseButtonEvent(MousePos.X, MousePos.Y, 0, false, game, 0)
end)

local LocalizationService = game:GetService("LocalizationService")

Player.PlayerGui.Loot.Results.Main.ScrollingFrame.ChildAdded:Connect(function(ItemFrame : Frame)
	local Quantity = tonumber(ItemFrame.Chance.Text:sub(2,-1))
	if not Quantity then return end

	local OldFrame = LootUi.Results.Main.ScrollingFrame:FindFirstChild(ItemFrame.Name)
	if not OldFrame then
		task.wait()
		OldFrame = ItemFrame:Clone()
		OldFrame.Parent = LootUi.Results.Main.ScrollingFrame
		OldFrame.Chance.Text = "x0"
		OldFrame.RewardName.Text = game:GetService("LocalizationService"):GetTranslatorForPlayer(game:GetService("Players").LocalPlayer):Translate(game:GetService("Players").LocalPlayer.PlayerGui.Loot,OldFrame.RewardName.Text)
	end

	local OldQuantity = tonumber(OldFrame.Chance.Text:sub(2,-1))
	OldFrame.Chance.Text = "x" .. (OldQuantity + Quantity)
end)

local function Find(Id)
	local PlayingAnimation = SEC.Costume.AnimationController.Animator:GetPlayingAnimationTracks()

	for i,v in pairs(PlayingAnimation) do
		if v.Animation.AnimationId == Id then
			return v
		end
	end
end

local function AddUi(Ui)
	if not Ui.Visible then
		return false
	end

	local Aura = Ui.Timing.Frame.Area
	local Slider = Ui.Timing.Frame.Slider

	Aura.Size = UDim2.fromScale(10,1)

	local MousePos = Slider.AbsolutePosition
	VirtualInputManager:SendMouseButtonEvent(MousePos.X, MousePos.Y, 0, true, game, 0)
	VirtualInputManager:SendMouseButtonEvent(MousePos.X, MousePos.Y, 0, false, game, 0)

	return true
end

local function get()
	local lower

	for i,v in ipairs(workspace.Objects.Locations.Spears:GetChildren()) do
		if v.Highlight.Enabled then
			if lower == nil or (lower and v.Highlight.FillTransparency < lower.Highlight.FillTransparency) then
				lower = v
			end
		end
	end

	return lower
end

local function getnearstplayer(p)
	local closest = nil
	local closestDistance = math.huge

	for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
		if v == Player then continue end
		local m = (v.Character:GetPivot().Position - p.Position).Magnitude
		if closest == nil or (closest and m < closestDistance) then
			closest = v
			closestDistance = m
		end
	end

	return closestDistance
end

local function getnearst(path:Instance)
	local char = game.Players.LocalPlayer.Character
	local hum = char:FindFirstChild("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")

	local mag = math.huge
	local nearst = nil

	for i,v in ipairs(path:GetChildren()) do
		local mag2
		if v:IsA("Model") then
			mag2 = (v:GetPivot().Position - hrp.Position).Magnitude
		else
			mag2 = (v.Position - hrp.Position).Magnitude
		end
		if mag2 < mag or not nearst then
			mag = mag2
			nearst = v
		end
	end

	return nearst
end
local Items = require(game:GetService("ReplicatedStorage").Dependencies.Items)
local function SECInStunned()
	if SEC and SEC:FindFirstChild("Humanoid") and not SEC.Humanoid.CombatAgent.Statuses:FindFirstChild("Iframes") and SEC.Humanoid.CombatAgent.Statuses:FindFirstChild("Stunned") then
		return true
	else
		return false
	end
end

local fl = 1
game:GetService("RunService").RenderStepped:Connect(function(dt)
	fl += dt

	if godmode then
		if not Character:FindFirstChild("ForceField") then
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("ToggleMenu"):FireServer(true)
		elseif Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("HumanoidRootPart").Anchored then
			UseSkill("Bloodlust")
			UseSkill("Burn Scars V2: Destroy Everything")
		end
	elseif Character:FindFirstChild("ForceField") then
		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("ToggleMenu"):FireServer(false)
	end

	if FastSpin.CurrentValue and not AutoSEC and not AutoBoss and not AutoInvestgations then
		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Data"):WaitForChild("InnateSpin"):InvokeServer(tonumber(CurrentSlot.CurrentOption[1]))
	end
	if KillAura then
		for _,Mob in ipairs(workspace.Objects.Mobs:GetChildren()) do
			local Humanoid : Humanoid = Mob:FindFirstChild("Humanoid")
			if Humanoid and Humanoid.Health > 0 and (Humanoid.Health / Humanoid.MaxHealth)*100 <= KillAuraN then
				Humanoid.Health = 0
			end
		end
	end

	if ToggleCurseTool and CurseTool then
		local Equipped = Player.ReplicatedData.primary.Value
		if Equipped and Equipped ~= "" and Equipped ~= CurseTool then
			local Tool : Tool = Player.Backpack:FindFirstChild(Equipped) or Player.Character:FindFirstChild(Equipped)
			if Tool then
				Player.ReplicatedData.primary.Value = CurseTool
				Tool.Name = CurseTool
				Tool.TextureId = Items[CurseTool] and Items[CurseTool].icon or ""
			end
		end
	end

	for i,v in pairs(Cooldowns) do
		Cooldowns[i] -= dt
		if Cooldowns[i] <= 0 then
			Cooldowns[i] = nil
			if SkillsBar:FindFirstChild(i) then
				if SkillsBar:FindFirstChild("MobileGrid") then
					SkillsBar[i].Cooldown.Visible = false
				else
					SkillsBar[i].Bar.Visible = true
					SkillsBar[i].SkillName.Text = i
				end
			end
		else
			if SkillsBar:FindFirstChild(i) then
				if SkillsBar:FindFirstChild("MobileGrid") then
					SkillsBar[i].Cooldown.Visible = true
					SkillsBar[i].Cooldown.Text = math.floor(Cooldowns[i]*10)/10
				else
					SkillsBar[i].Bar.Visible = false
					SkillsBar[i].SkillName.Text = i.." ("..(math.floor(Cooldowns[i]*10)/10)..") "
				end
			end
		end
	end

	SEC = workspace.Objects.Mobs:FindFirstChild("Six Eyed Calamity")
	Character = Player.Character

	if SECShield then
		FirstGlobal.shieldMeter = 100
	end

	if not Character then return end

	if AutoSEC or AutoBoss or AutoInvestgations then
		if not Character.PrimaryPart:FindFirstChild("Archored") then
			local a = Instance.new("BodyVelocity",Character.PrimaryPart)
			a.Name = "Archored"
			a.Velocity = Vector3.new(0,0,0)
			a.MaxForce = Vector3.new(1,1,1)*math.huge
		end

		Player.PlayerGui.Loot.Enabled = false

		for _,v in ipairs(Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end

		if #workspace.Objects.Drops:GetChildren() >= 1 then
			for i,v in ipairs(workspace.Objects.Drops:GetChildren()) do
				v:PivotTo(Character:GetPivot())
				local p : ProximityPrompt = v:FindFirstChild("Collect",true)
				if p and p:IsA("ProximityPrompt") then
					fireproximityprompt(p)
				end
			end
		end
	end

	if AutoSEC or AutoBoss then
		if Player.PlayerGui.ReadyScreen.Enabled then
			task.delay(5,function()
				if Player.PlayerGui.ReadyScreen.Enabled then
					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Misc"):WaitForChild("ReadyReplay"):FireServer()
				end
			end)
		end
	elseif AutoInvestgations then
		if game:GetService("Players").LocalPlayer.PlayerGui.ReadyScreen.Enabled then
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Misc"):WaitForChild("ReadyReplay"):FireServer()
		end

		game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Client"):WaitForChild("StorylineDialogueSkip"):FireServer()
	end

	if AutoSEC and SEC then
		if Player.Backpack:FindFirstChild("Infinity Shard") then
			Character:FindFirstChild("Humanoid"):EquipTool(Player.Backpack["Infinity Shard"])
			UseSkill("Drop Shard")
		elseif Player.Character:FindFirstChild("Infinity Shard") then
			UseSkill("Drop Shard")
		end



		local red : AnimationTrack = Find(SECAnimations.redcharge)
		local purple : AnimationTrack = Find(SECAnimations.purple)
		local stun : AnimationTrack = Find(SECAnimations.Stun)

		if (stun and stun.TimePosition >= 3 - Player:GetNetworkPing()) or Find(SECAnimations.Stun2) and SECInStunned() then
			if InInfinityShield() and fl >= .5+Player:GetNetworkPing() then
				fl = 0
				UseSkill("Toggle Shield")
			end
			local bosspos = SEC.Costume["UMesh_Skin_ZSphere_3.004"].Root.LowerTorso.UpperTorso["UpperTorso.001"]["UpperTorso.002"].WorldCFrame
			Character:PivotTo(bosspos*CFrame.new(0,0,-50))
			workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,bosspos.Position)
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("Skill"):FireServer("Demon Vessel: Switch")
			BlackFlash(SEC:FindFirstChild("Humanoid"))
			return
		end



		local handa : AnimationTrack = Find(SECAnimations.hand)
		local HandQTE : AnimationTrack = Find(SECAnimations.HandQTEA)
		if not godmode then
			if purple and purple.TimePosition >= (5-Player:GetNetworkPing()) then
				for i,v in ipairs(workspace.Objects.Locations.PurpleCover:GetChildren()) do
					if v.Transparency == 0 then
						Character:PivotTo(v.CFrame)
						return
					end
				end
			end


			if Find(SECAnimations.Purple2) then
				Character:PivotTo(SEC:GetPivot()*CFrame.new(0,-50,300))
				return
			end
			if red and red.TimePosition >= (4.5-Player:GetNetworkPing()) or Find(SECAnimations.redfire) then
				Character:PivotTo(SEC:GetPivot()*CFrame.new(0,-50,300))
				return
			end

			if purple then
				if #workspace.Objects.Locations.PurpleCover:GetChildren() > 0 then
					for i,v in ipairs(workspace.Objects.Locations.PurpleCover:GetChildren()) do
						if v:FindFirstChild("AngularVelocity") and v.CloudParticles.Enabled then
							Character:PivotTo(v.CFrame)
							Combat:WaitForChild("Block"):FireServer(true)
							return
						end
					end
				end
			end
		end

		if handa then
			Combat:WaitForChild("Block"):FireServer(true)
			Combat:WaitForChild("Block"):FireServer(false)
		elseif HandQTE then
			Character.HumanoidRootPart.Anchored = false
			AddUi(Player.PlayerGui.Main.Frame.BottomMiddle.DomainClash)
		elseif not handa and not HandQTE then
			AddUi(Player.PlayerGui.Main.Frame.BottomMiddle.DomainClash)
		end
		AddUi(Player.PlayerGui.Main.Frame.BottomMiddle.QTE)
		if game:GetService("ReplicatedStorage"):FindFirstChild("GlobalDomainMeter") and game:GetService("ReplicatedStorage"):FindFirstChild("GlobalDomainMeter").Value >= 100 then
			Combat:WaitForChild("Skill"):FireServer("Domain Expansion: Unlimited Void")
			return
		end

		for i,Obj:Part in ipairs(workspace.Objects.Effects:GetChildren()) do
			if Obj.Name == "SECEye" then
				Obj:Destroy()
			elseif Obj.Name == "SECBlueBurst" and not purple then
				local power:Part = workspace.Objects.Effects:FindFirstChild("SECEnergyImbue")
				if Obj:FindFirstChild("Warning") and Obj.Warning.Enabled then
					if (Obj.Position - Character:GetPivot().Position).Magnitude <= 100 then
						game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("Block"):FireServer(true)
						Character:PivotTo(Obj.CFrame)
						return
					end
				elseif not godmode then
					Character:PivotTo(SEC:GetPivot()*CFrame.new(350,-150,50))
					return
				end
			elseif Obj.Name == "SECEnergyImbue" and Obj:FindFirstChild("Ambience") and Obj.Ambience.Volume > 0 and Obj.Ambience.IsPlaying then
				Character:PivotTo(get().WeldToPart.CFrame*CFrame.new(0,-50,0))
				return
			end
		end

		if workspace.Objects.Effects:FindFirstChild("SECEnergyCharge") then
			for i,v in ipairs(workspace.Objects.Effects:GetChildren()) do
				if v.Name == "SECEnergyCharge" and v:FindFirstChild("BillboardGui") and v.BillboardGui.Enabled and getnearstplayer(v) > v.Size.Y/2 then
					Character:PivotTo(v.CFrame*CFrame.new(0,1,0))
					return
				end
			end
		end
	elseif AutoBoss then
		if #workspace.Objects.Mobs:GetChildren() == 0 then
			if #workspace.Objects.Drops:GetChildren() >= 1 then
				return
			end
			game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Server"):WaitForChild("Combat"):WaitForChild("Skill"):FireServer("Demon Vessel: Switch")

			if workspace.Objects.Spawns:FindFirstChild("BossSpawn") then
				Character:PivotTo(workspace.Objects.Spawns.BossSpawn.CFrame)
			end
			UseSkill("Maximum: True Sphere")
		elseif workspace.Objects.Mobs:GetChildren()[1]:FindFirstChild("Humanoid").Health > 0 then
			Character:PivotTo(workspace.Objects.Mobs:GetChildren()[1]:GetPivot())
			UseSkill("Maximum: True Sphere")
			--BlackFlash()
		end
	elseif AutoInvestgations then
		if not Character then return end
		for i,v : Model in ipairs(workspace.Objects.Mobs:GetChildren()) do
			if v:FindFirstChild("Humanoid") then
				TweenService:Create(Character.PrimaryPart,TweenInfo.new(0),{CFrame = v:GetPivot()}):Play()
				v.Humanoid.Health = 0
			end
		end

		if #workspace.Objects.MissionItems:GetChildren() >= 1 then
			local ACharacter = getnearst(workspace.Objects.MissionItems)
			local p : ProximityPrompt = ACharacter:FindFirstChild("PickUp")
			if p then
				TweenService:Create(Character.PrimaryPart,TweenInfo.new(0),{CFrame = ACharacter:GetPivot()}):Play()
				fireproximityprompt(p)
			elseif ACharacter:FindFirstChild("Collect") then
				p = ACharacter:FindFirstChild("Collect")
				fireproximityprompt(p)
				TweenService:Create(Character.PrimaryPart,TweenInfo.new(0),{CFrame = ACharacter:GetPivot()}):Play()
			else
				if workspace:FindFirstChild("Map") and workspace.Map.Parts:FindFirstChild("SpawnLocation") then
					TweenService:Create(Character.PrimaryPart,TweenInfo.new(0),{CFrame = workspace.Map.Parts.SpawnLocation.CFrame}):Play()
				end
			end
		end
	end
end)
