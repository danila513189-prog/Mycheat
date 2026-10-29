local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local function addHighlight(player)
player.CharacterAdded:Connect(function(character)
if player ~= LocalPlayer then
local hl = Instance.new("Highlight")
hl.Name = "MyESP"
hl.FillColor = Color3.fromRGB(255, 0, 0)
hl.OutlineColor = Color3.fromRGB(255, 255, 255)
hl.Parent = character
end
end)
end
Players.PlayerAdded:Connect(addHighlight)
for _, p in pairs(Players:GetPlayers()) do
if p ~= LocalPlayer and p.Character then
if not p.Character:FindFirstChild("MyESP") then
local hl = Instance.new("Highlight", p.Character)
hl.Name = "MyESP"
hl.FillColor = Color3.fromRGB(255, 0, 0)
end
end
end
local FlingVelocity = 250000
RunService.Heartbeat:Connect(function()
local char = LocalPlayer.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
if hrp then
for _, p in pairs(Players:GetPlayers()) do
if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
local targetHrp = p.Character.HumanoidRootPart
local dist = (hrp.Position - targetHrp.Position).Magnitude
if dist < 4 then
local rot = Instance.new("AngularVelocity")
rot.Attachment0 = hrp:FindFirstChildOfClass("Attachment") or Instance.new("Attachment", hrp)
rot.AngularVelocity = Vector3.new(FlingVelocity, FlingVelocity, FlingVelocity)
rot.MaxTorque = math.huge
rot.Parent = hrp
hrp.Velocity = Vector3.new(FlingVelocity, 0, FlingVelocity)
task.wait(0.05)
rot:Destroy()
end
end
end
end
end)
