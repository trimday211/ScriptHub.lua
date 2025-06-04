-- Script Tổng hợp các Hub Blox Fruits với Menu Phân cấp (Phong cách Hình ảnh)
-- Cảnh báo: Sử dụng script có thể vi phạm ToS của Roblox. Hãy cẩn thận!
-- Ngày cập nhật: 04/06/2025, 10:10 PM +07

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
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "Đã Khởi Đầu cuộc Cướp Biển"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(40, 15, 60)
Title.Parent = MainFrame

-- Menu Frame (ẩn ban đầu)
local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(1, -20, 0, 300)
MenuFrame.Position = UDim2.new(0, 10, 0, 50)
MenuFrame.BackgroundColor3 = Color3.fromRGB(60, 30, 80)
MenuFrame.Parent = MainFrame
MenuFrame.Visible = true

-- SubMenu Frame (ẩn ban đầu)
local SubMenuFrame = Instance.new("Frame")
SubMenuFrame.Size = UDim2.new(1, -20, 0, 300)
SubMenuFrame.Position = UDim2.new(0, 10, 0, 50)
SubMenuFrame.BackgroundColor3 = Color3.fromRGB(70, 40, 90)
SubMenuFrame.Parent = MainFrame
SubMenuFrame.Visible = false

-- Biến trạng thái toàn cục
_G.HubStates = {}

-- Hàm tạo nút menu chính
local function CreateMenuButton(name, positionY, hubName)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 260, 0, 40)
    Button.Position = UDim2.new(0, 20, 0, positionY)
    Button.Text = name
    Button.BackgroundColor3 = Color3.fromRGB(80, 40, 100)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = MenuFrame
    Button.MouseButton1Click:Connect(function()
        for _, frame in pairs(MainFrame:GetChildren()) do
            if frame:IsA("Frame") and frame ~= MainFrame and frame ~= MenuFrame then
                frame.Visible = false
            end
        end
        SubMenuFrame.Visible = true
        SubMenuFrame.Name = hubName
        UpdateSubMenu(hubName)
    end)
    return Button
end

-- Hàm tạo nút sub-menu
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
        if obj:IsA("TextButton") then
            obj:Destroy()
        end
    end
    local yOffset = 0
    for featureKey, feature in pairs(Hubs[hubName].Features) do
        CreateSubMenuButton(featureKey, yOffset, featureKey, feature.Display, feature.Toggle)
        yOffset = yOffset + 50
    end
end

-- Danh sách các Hub (mô-đun)
local Hubs = {
    Redz = {
        Name = "Redz Hub",
        Features = {
            AutoBoss = {Display = "Auto Boss (Darkbeard)", Function = function()
                while _G.HubStates["Redz_AutoBoss"] do
                    for _, boss in pairs(Workspace.Enemies:GetChildren()) do
                        if boss.Name == "Darkbeard" and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                            Player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 5, -5)
                            VirtualUser:CaptureController()
                            VirtualUser:ClickButton1(Vector2.new(0, 0))
                            task.wait(0.3)
                        end
                    end
                    task.wait(0.1)
                end
            end, Toggle = true},
            ESP = {Display = "ESP (Enemies)", Function = function()
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
                    task.wait(1)
                end
            end, Toggle = true}
        }
    },
    RubuV3English = {
        Name = "rubu v3 English",
        Features = {
            AutoFarmLevel = {Display = "Auto Farm Level", Function = function()
                while _G.HubStates["RubuV3English_AutoFarmLevel"] do
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
            AutoRaceV3 = {Display = "Auto Race V3", Function = function()
                while _G.HubStates["RubuV3English_AutoRaceV3"] do
                    for _, npc in pairs(Workspace.NPCs:GetChildren()) do
                        if string.find(npc.Name, "Race V3") or npc.Name == "Mysterious Man" then
                            Player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(true, "E", false, game)
                            task.wait(1)
                            VirtualInputManager:SendKeyEvent(false, "E", false, game)
                        end
                    end
                    task.wait(2)
                end
            end, Toggle = true}
        }
    },
    RubuV3VN = {
        Name = "rubu v3 VN",
        Features = {
            AutoFarmLevel = {Display = "Auto Farm Level (VN)", Function = function()
                while _G.HubStates["RubuV3VN_AutoFarmLevel"] do
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
            end, Toggle = true}
        }
    },
    Xeter = {
        Name = "xeter Vl",
        Features = {
            -- Thêm tính năng nếu có, hiện tại để trống vì không rõ
        }
    }
}

-- Khởi tạo menu chính
local function InitializeMenu()
    local yOffset = 0
    for hubName, hub in pairs(Hubs) do
        if next(hub.Features) ~= nil then -- Chỉ hiển thị Hub có tính năng
            CreateMenuButton(hub.Name, yOffset, hubName)
            yOffset = yOffset + 50
        end
    end
end

-- Khởi tạo GUI
InitializeMenu()

print("Blox Fruits Ultimate Hub with Sub-Menus (Phong cách Hình ảnh) loaded successfully!")
