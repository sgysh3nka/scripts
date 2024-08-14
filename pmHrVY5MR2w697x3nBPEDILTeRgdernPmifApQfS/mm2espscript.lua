local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local roles

function CreateHighlight()
	for i, v in pairs(Players:GetChildren()) do
		if v ~= LP and v.Character and not v.Character:FindFirstChild("Highlight") then
			Instance.new("Highlight", v.Character)           
		end
	end
end

function UpdateHighlights()
	for _, v in pairs(Players:GetChildren()) do
		if v ~= LP and v.Character and v.Character:FindFirstChild("Highlight") then
			Highlight = v.Character:FindFirstChild("Highlight")
			if v.Name == Sheriff and IsAlive(v) then
				Highlight.FillColor = Color3.fromRGB(0, 0, 225)
			elseif v.Name == Murder and IsAlive(v) then
				Highlight.FillColor = Color3.fromRGB(225, 0, 0)
			elseif v.Name == Hero and IsAlive(v) and not IsAlive(game.Players[Sheriff]) then
				Highlight.FillColor = Color3.fromRGB(255, 250, 0)
			else
				Highlight.FillColor = Color3.fromRGB(0, 225, 0)
			end
		end
	end
end	

function IsAlive(Player)
	for i, v in pairs(roles) do
		if Player.Name == i then
			if not v.Killed and not v.Dead then
				return true
			else
				return false
			end
		end
	end
end

local function createVisibleThroughWallsTextLabel(playerName, position)
    local label = Instance.new("TextLabel")
    label.Text = playerName
    label.Size = UDim2.new(0, 200, 0, 50)
    label.Position = UDim2.new(0, position.X, 0, position.Y)
    label.TextSize = 20
    label.TextColor3 = Color3.new(1, 1, 1)
    label.BackgroundTransparency = 1
    label.Parent = game.Workspace
end

local player = game.Players:GetPlayerFromCharacter(script.Parent)
if player then
    createVisibleThroughWallsTextLabel(player.Name, Vector2.new(0, 0))
end

function CreateTextWaterMark() -- may not work on phones
    TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    TextLabel.AnchorPoint = Vector2.new(1, 0)
    TextLabel.Position = UDim2.new(1, -10, 0, 10)
    TextLabel.Size = UDim2.new(0, 200, 0, 50)
    TextLabel.Text = "sgysh3nkaHub"
    TextLabel.TextSize = 24
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.BackgroundTransparency = 1
    TextLabel.ZIndex = 2
end


RunService.RenderStepped:connect(function()
	roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()
	for i, v in pairs(roles) do
		if v.Role == "Murderer" then
			Murder = i
		elseif v.Role == 'Sheriff'then
			Sheriff = i
		elseif v.Role == 'Hero'then
			Hero = i
		end
	end
	CreateHighlight()
	UpdateHighlights()
	CreateTextWaterMark()
end)
