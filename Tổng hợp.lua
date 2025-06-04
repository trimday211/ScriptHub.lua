-- Script Tổng hợp các Hub Blox Fruits với khả năng mở rộng
-- Cảnh báo: Sử dụng script có thể vi phạm ToS của Roblox. Hãy cẩn thận!

local Player = game.Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Khởi tạo GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 600)
Frame.Position = UDim2.new(0.5, -200, 0.5, -300)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "Blox Fruits Ultimate Hub (Modular)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Parent = Frame

-- Biến trạng thái toàn cục
_G.HubStates = {}

-- Hàm tạo nút điều khiển
local function CreateButton(name, positionY, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 300, 0, 50)
    Button.Position = UDim2.new(0, 50, 0, positionY)
    Button.Text = text
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = Frame
    Button.MouseButton1Click:Connect(callback)
    return Button
end

-- Danh sách các Hub (mô-đun)
local Hubs = {
    -- Rubu V3 Hub
    RubuV3 = {
        Name = "Rubu V3",
        Features = {
            {
                Name = "AutoFarmLevel",
                Display = "Auto Farm Level",
                Function = function()
                    while _G.HubStates["RubuV3_AutoFarmLevel"] do
                        for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                            if mob:IsA("Model") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                                Player.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 5, -5)
                                VirtualUser:CaptureController()
                                VirtualUser:ClickButton1(Vector2.new(0, 0))
                                wait(0.3)
                            end
                        end
                        wait(0.1)
                    end
                end,
                Toggle = true
            },
            {
                Name = "AutoRaceV3",
                Display = "Auto Race V3",
                Function = function()
                    while _G.HubStates["RubuV3_AutoRaceV3"] do
                        for _, npc in pairs(Workspace.NPCs:GetChildren()) do
                            if string.find(npc.Name, "Race V3") or npc.Name == "Mysterious Man" then
                                Player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                                wait(1)
                                VirtualInputManager:SendKeyEvent(true, "E", false, game)
                                wait(1)
                                VirtualInputManager:SendKeyEvent(false, "E", false, game)
                            end
                        end
                        wait(2)
                    end
                end,
                Toggle = true
            }
        }
    },
    -- Maru Hub
    Maru = {
        Name = "Maru Hub",
        Features = {
            {
                Name = "AutoRaid",
                Display = "Auto Raid",
                Function = function()
                    while _G.HubStates["Maru_AutoRaid"] do
                        for _, raid in pairs(Workspace.Raids:GetChildren()) do
                            if raid:IsA("Model") and raid:FindFirstChild("Start") then
                                Player.Character.HumanoidRootPart.CFrame = raid.Start.CFrame
                                wait(1)
                                VirtualInputManager:SendKeyEvent(true, "E", false, game)
                                wait(1)
                                VirtualInputManager:SendKeyEvent(false, "E", false, game)
                            end
                        end
                        wait(5)
                    end
                end,
                Toggle = true
            },
            {
                Name = "TeleportToNPC",
                Display = "Teleport to NPC (Bartilo)",
                Function = function()
                    for _, npc in pairs(Workspace.NPCs:GetChildren()) do
                        if npc.Name == "Bartilo" then
                            Player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                            break
                        end
                    end
                end,
                Toggle = false
            }
        }
    },
    -- Redz Hub
    Redz = {
        Name = "Redz Hub",
        Features = {
            {
                Name = "AutoBoss",
                Display = "Auto Boss (Darkbeard)",
                Function = function()
                    while _G.HubStates["Redz_AutoBoss"] do
                        for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                            if boss.Name == "Darkbeard" and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                                Player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 5, -5)
                                VirtualUser:CaptureController()
                                VirtualUser:ClickButton1(Vector2.new(0, 0))
                                wait(0.3)
                            end
                        end
                        wait(0.1)
                    end
                end,
                Toggle = true
            },
            {
                Name = "ESP",
                Display = "ESP (Enemies)",
                Function = function()
                    while _G.HubStates["Redz_ESP"] do
                        for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                            if mob:IsA("Model") and mob:FindFirstChild("Humanoid") and not mob:FindFirstChild("ESP") then
                                local Billboard = Instance.new("BillboardGui")
                                Billboard.Name = "ESP"
                                Billboard.Parent = mob
                                Billboard.Size = UDim2.new(0, 100, 0, 30)
                                Billboard.StudsOffset = Vector3.new(0, 3, 0)
                                Billboard.AlwaysOnTop = true
                                local TextLabel = Instance.new("TextLabel")
                                TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                TextLabel.BackgroundTransparency = 1
                                TextLabel.Text = mob.Name
                                TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                                TextLabel.Parent = Billboard
                            end
                        end
                        wait(1)
                    end
                end,
                Toggle = true
            }
        }
    },
    -- Monster Hub
    Monster = {
        Name = "Monster Hub",
        Features = {
            {
                Name = "DevilFruitSniper",
                Display = "Devil Fruit Sniper",
                Function = function()
                    while _G.HubStates["Monster_DevilFruitSniper"] do
                        for _, fruit in pairs(Workspace:GetChildren()) do
                            if string.find(fruit.Name, "Fruit") then
                                Player.Character.HumanoidRootPart.CFrame = fruit.CFrame
                                wait(0.5)
                            end
                        end
                        wait(0.5)
                    end
                end,
                Toggle = true
            }
        }
    }
}

-- Hàm khởi tạo GUI cho tất cả Hub
local function InitializeHubs()
    local yOffset = 100
    for hubName, hub in pairs(Hubs) do
        for _, feature in ipairs(hub.Features) do
            local featureKey = hubName .. "_" .. feature.Name
            if feature.Toggle then
                CreateButton(featureKey, yOffset, feature.Display, function()
                    _G.HubStates[featureKey] = not _G.HubStates[featureKey]
                    local buttonText = _G.HubStates[featureKey] and feature.Display .. ": ON" or feature.Display .. ": OFF"
                    Frame:FindFirstChild(featureKey).Text = buttonText
                    if _G.HubStates[featureKey] then
                        spawn(feature.Function)
                    end
                end)
            else
                CreateButton(featureKey, yOffset, feature.Display, feature.Function)
            end
            yOffset = yOffset + 60
        end
    end
end

-- Khởi tạo GUI
InitializeHubs()

print("Blox Fruits Ultimate Hub (Rubu V3, Maru, Redz, Monster) loaded successfully!")
