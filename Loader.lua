-- Создатель: ImNzkss52
-- Murder Mystery 2 Script - Full GUI

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

local Window = OrionLib:MakeWindow({Name = "MM2 Hub | Создатель: ImNzkss52", HidePremium = false, SaveConfig = true, ConfigFolder = "MM2Hub"})

-- Главная вкладка
local MainTab = Window:MakeTab({Name = "Основное", Icon = "rbxassetid://4483345998", PremiumOnly = false})

MainTab:AddButton({
	Name = "ESP (роли, пушки)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/zaptosis/FE-ESP/main/ESP.lua"))()
	end
})

MainTab:AddButton({
	Name = "Kill All (если ты убийца)",
	Callback = function()
		for _, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				game:GetService("ReplicatedStorage").Remotes.ThrowKnife:FireServer(v.Character.HumanoidRootPart.Position)
			end
		end
	end
})

MainTab:AddButton({
	Name = "Auto Grab Gun",
	Callback = function()
		for i,v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "GunDrop" then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
			end
		end
	end
})

MainTab:AddButton({
	Name = "Fly (F to toggle)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ImNzkss52/Scripts/main/fly.lua"))()
	end
})

MainTab:AddButton({
	Name = "Speed Hack",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
	end
})

MainTab:AddButton({
	Name = "Teleport to Random Player",
	Callback = function()
		local players = game.Players:GetPlayers()
		local random = players[math.random(1, #players)]
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = random.Character.HumanoidRootPart.CFrame
	end
})

MainTab:AddButton({
	Name = "Knife Aura",
	Callback = function()
		while true do
			wait(0.2)
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Knife") or game.Players.LocalPlayer.Character:FindFirstChild("Knife") then
				for _, player in pairs(game.Players:GetPlayers()) do
					if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
						game:GetService("ReplicatedStorage").Remotes.ThrowKnife:FireServer(player.Character.HumanoidRootPart.Position)
					end
				end
			end
		end
	end
})

MainTab:AddButton({
	Name = "Anti Lag",
	Callback = function()
		for _, v in pairs(game:GetDescendants()) do
			if v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v:Destroy()
			end
		end
	end
})

OrionLib:Init()
