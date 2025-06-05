-- Script Tổng hợp các Hub Blox Fruits với Avatar, Tắt Menu, và Nút Back
-- Cảnh báo: Sử dụng script có thể vi phạm ToS của Roblox. Hãy cẩn thận!
-- Ngày cập nhật: 05/06/2025, 07:00 AM +07

local Player = game.Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Khởi tạo GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 20, 70) -- Màu tím đậm giống hình ảnh
MainFrame.Parent = ScreenGui

-- Menu Frame (Menu chính)
local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(1, -20, 0, 380)
MenuFrame.Position = UDim2.new(0, 10, 0, 10)
MenuFrame.BackgroundColor3 = Color3.fromRGB(60, 30, 80)
MenuFrame.Parent = MainFrame
MenuFrame.Visible = true

-- SubMenu Frame (Giao diện chi tiết của Hub)
local SubMenuFrame = Instance.new("Frame")
SubMenuFrame.Size = UDim2.new(1, -20, 0, 380)
SubMenuFrame.Position = UDim2.new(0, 10, 0, 10)
SubMenuFrame.BackgroundColor3 = Color3.fromRGB(70, 40, 90)
SubMenuFrame.Parent = MainFrame
SubMenuFrame.Visible = false

-- Biến trạng thái toàn cục
_G.HubStates = {}

-- Hàm tạo nút menu chính với avatar
local function CreateMenuButton(name, positionY, hubName, avatarUrl)
    local HubFrame = Instance.new("Frame")
    HubFrame.Size = UDim2.new(0, 260, 0, 60)
    HubFrame.Position = UDim2.new(0, 20, 0, positionY)
    HubFrame.BackgroundTransparency = 1
    HubFrame.Parent = MenuFrame

    -- Avatar
    local Avatar = Instance.new("ImageLabel")
    Avatar.Size = UDim2.new(0, 50, 0, 50)
    Avatar.Position = UDim2.new(0, 0, 0, 5)
    Avatar.Image = avatarUrl -- URL avatar (giả định)
    Avatar.BackgroundTransparency = 1
    Avatar.Parent = HubFrame

    -- Nút tên Hub
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 200, 0, 50)
    Button.Position = UDim2.new(0, 60, 0, 5)
    Button.Text = name
    Button.BackgroundColor3 = Color3.fromRGB(80, 40, 100)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = HubFrame

    -- Sự kiện khi nhấp vào avatar hoặc tên Hub
    local function ShowHub()
        MenuFrame.Visible = false -- Tắt menu tổng hợp
        SubMenuFrame.Visible = true
        SubMenuFrame.Name = hubName
        UpdateSubMenu(hubName)
    end

    Avatar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            ShowHub()
        end
    end)

    Button.MouseButton1Click:Connect(ShowHub)

    return HubFrame
end

-- Hàm tạo nhãn thông tin (TextLabel)
local function CreateInfoLabel(text, positionY)
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 260, 0, 30)
    Label.Position = UDim2.new(0, 20, 0, positionY)
    Label.Text = text
    Label.BackgroundColor3 = Color3.fromRGB(90, 50, 110)
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Parent = SubMenuFrame
    return Label
end

-- Hàm tạo nút sub-menu (cho tính năng bật/tắt)
local function CreateSubMenuButton(name, positionY, featureKey, display, toggle)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 260, 0, 40)
    Button.Position = UDim2.new(0, 20, 0, positionY)
    Button.Text = display
    Button.BackgroundColor3 = Color3.fromRGB(90, 50, 110)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = SubMenuFrame
    if toggle then
        Button.MouseButton1Click:Connect(function()
            _G.HubStates[featureKey] = not _G.HubStates[featureKey]
            Button.Text = _G.HubStates[featureKey] and display .. ": ON" or display .. ": OFF"
            if _G.HubStates[featureKey] then
                spawn(Hubs[SubMenuFrame.Name].Features[featureKey].Function)
            end
        end)
    else
        Button.MouseButton1Click:Connect(Hubs[SubMenuFrame.Name].Features[featureKey].Function)
    end
    return Button
end

-- Hàm cập nhật sub-menu
local function UpdateSubMenu(hubName)
    for _, obj in pairs(SubMenuFrame:GetChildren()) do
        if obj:IsA("TextButton") or obj:IsA("TextLabel") then
            obj:Destroy()
        end
    end
    local yOffset = 0
    if Hubs[hubName].Info then
        for _, info in pairs(Hubs[hubName].Info) do
            CreateInfoLabel(info, yOffset)
            yOffset = yOffset + 30
        end
    end
    for featureKey, feature in pairs(Hubs[hubName].Features) do
        CreateSubMenuButton(featureKey, yOffset, featureKey, feature.Display, feature.Toggle)
        yOffset = yOffset + 50
    end
    -- Thêm nút Back ở dưới cùng
    local BackButton = Instance.new("TextButton")
    BackButton.Size = UDim2.new(0, 100, 0, 30)
    BackButton.Position = UDim2.new(0, 20, 0, yOffset + 10) -- Cách mép dưới 10 pixel
    BackButton.Text = "Back"
    BackButton.BackgroundColor3 = Color3.fromRGB(80, 40, 100)
    BackButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    BackButton.Parent = SubMenuFrame
    BackButton.MouseButton1Click:Connect(function()
        SubMenuFrame.Visible = false
        MenuFrame.Visible = true
    end)
end

-- Danh sách các Hub (mô-đun) với thông tin chi tiết
local Hubs = {
    Maru = {
        Name = "Maru Hub",
        Avatar = "https://example.com/maru_avatar.png", -- URL giả định
        Info = {
            "Trạng Thái",
            "Link Discord: https://discord.com/invite/MaruHub",
            "Time: 0h 0m 30s",
            "FPS: 60",
            "Ping: 150ms",
            "Team: Marines" -- Dựa trên getgenv().Team = "Marines"
        },
        Features = {
            AutoFarm = {Display = "Auto Farm", Function = function()
                while _G.HubStates["Maru_AutoFarm"] do
                    for _, mob in pairs(Workspace.Enemies:GetChildren()) do
                        if mob:IsA("Model") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                            Player.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0, 5, -5)
                            VirtualUser:CaptureController()
                            VirtualUser:ClickButton1(Vector2.new(0, 0))
                            task.wait(0.3)
                        end
                    end
                    task.wait(0.1)
                end
            end, Toggle = true},
            SelectTeam = {Display = "Select Team: Marines", Function = function()
                getgenv().Team = "Marines"
                print("Team set to Marines")
            end, Toggle = false}
        }
    },
    Vxeze = {
        Name = "Vxeze Hub",
        Avatar = "https://example.com/vxeze_avatar.png", -- URL giả định
        Info = {
            "Trạng Thái",
            "Link Discord: https://discord.com/invite/VxezeHub",
            "Time: 0h 0m 20s",
            "FPS: 60",
            "Ping: 130ms"
        },
        Features = {
            ESP = {Display = "ESP (Enemies)", Function = function()
                while _G.HubStates["Vxeze_ESP"] do
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
                    task.wait(1)
                end
            end, Toggle = true},
            Teleport = {Display = "Teleport to NPC", Function = function()
                for _, npc in pairs(Workspace.NPCs:GetChildren()) do
                    if npc:FindFirstChild("HumanoidRootPart") then
                        Player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                        break
                    end
                end
            end, Toggle = false}
        }
    },
    Aurora = {
        Name = "Aurora Hub",
        Avatar = "https://example.com/aurora_avatar.png", -- URL giả định
        Info = {
            "Trạng Thái",
            "Link Discord: https://discord.com/invite/AuroraHub",
            "Time: 0h 0m 15s",
            "FPS: 60",
            "Ping: 120ms"
        },
        Features = {
            AutoQuest = {Display = "Auto Quest", Function = function()
                while _G.HubStates["Aurora_AutoQuest"] do
                    for _, npc in pairs(Workspace.NPCs:GetChildren()) do
                        if npc:FindFirstChild("Quest") then
                            Player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(true, "E", false, game)
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(false, "E", false, game)
                        end
                    end
                    task.wait(2)
                end
            end, Toggle = true},
            AutoRaid = {Display = "Auto Raid", Function = function()
                while _G.HubStates["Aurora_AutoRaid"] do
                    for _, raid in pairs(Workspace.Raids:GetChildren()) do
                        if raid:IsA("Model") and raid:FindFirstChild("Start") then
                            Player.Character.HumanoidRootPart.CFrame = raid.Start.CFrame
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(true, "E", false, game)
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(false, "E", false, game)
                        end
                    end
                    task.wait(5)
                end
            end, Toggle = true}
        }
    }
}

-- Khởi tạo menu chính
local function InitializeMenu()
    local yOffset = 0
    for hubName, hub in pairs(Hubs) do
        if next(hub.Features) ~= nil or next(hub.Info) ~= nil then
            CreateMenuButton(hub.Name, yOffset, hubName, hub.Avatar)
            yOffset = yOffset + 70
        end
    end
end

-- Khởi tạo GUI
InitializeMenu()

print("Blox Fruits Ultimate Hub with Avatars and Back Button loaded successfully!")
