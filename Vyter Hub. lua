-- Vyter Hub by Trần Tú (Updated Interface with ESP, Auto Farm, and Colors)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local TabList = Instance.new("Frame")
local FarmBtn = Instance.new("TextButton")
local WeaponBtn = Instance.new("TextButton")
local TeleportBtn = Instance.new("TextButton")
local SettingsBtn = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local BackButton = Instance.new("TextButton")

-- Parent GUI
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "VyterHubGUI"

-- Main Frame (Menu trái)
MainFrame.Size = UDim2.new(0, 350, 0, 450) -- 350x450
MainFrame.Position = UDim2.new(0.1, 0, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 150) -- Vàng nhạt
MainFrame.Parent = ScreenGui

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Nút đóng/mở
ToggleButton.Text = "−"
ToggleButton.Size = UDim2.new(0, 30, 0, 30)
ToggleButton.Position = UDim2.new(1, -40, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
ToggleButton.TextColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.TextSize = 18
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Parent = MainFrame
local isOpen = true
ToggleButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    ToggleButton.Text = isOpen and "−" or "+"
    MainFrame.Visible = isOpen
    ContentFrame.Visible = isOpen and ContentFrame.Visible or false
end)

-- Title
Title.Text = "Vyter Hub"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.TextSize = 18
Title.Font = Enum.Font.SourceSansBold
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

-- Tab List (Bên trái)
TabList.Size = UDim2.new(1, 0, 1, -50)
TabList.Position = UDim2.new(0, 0, 0, 50)
TabList.BackgroundTransparency = 1
TabList.Parent = MainFrame

-- Farm Button
FarmBtn.Text = "Farm"
FarmBtn.Size = UDim2.new(0, 310, 0, 50)
FarmBtn.Position = UDim2.new(0, 20, 0, 20)
FarmBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
FarmBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
FarmBtn.TextSize = 18
FarmBtn.Font = Enum.Font.SourceSansBold
FarmBtn.Parent = TabList
FarmBtn.MouseButton1Click:Connect(function()
    ContentFrame.Visible = true
    FarmTab.Visible = true
    WeaponTab.Visible = false
    TeleportTab.Visible = false
    SettingsTab.Visible = false
end)

-- Weapon Button
WeaponBtn.Text = "Weapon"
WeaponBtn.Size = UDim2.new(0, 310, 0, 50)
WeaponBtn.Position = UDim2.new(0, 20, 0, 90)
WeaponBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
WeaponBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
WeaponBtn.TextSize = 18
WeaponBtn.Font = Enum.Font.SourceSansBold
WeaponBtn.Parent = TabList
WeaponBtn.MouseButton1Click:Connect(function()
    ContentFrame.Visible = true
    FarmTab.Visible = false
    WeaponTab.Visible = true
    TeleportTab.Visible = false
    SettingsTab.Visible = false
end)

-- Teleport Button
TeleportBtn.Text = "Teleport"
TeleportBtn.Size = UDim2.new(0, 310, 0, 50)
TeleportBtn.Position = UDim2.new(0, 20, 0, 160)
TeleportBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
TeleportBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
TeleportBtn.TextSize = 18
TeleportBtn.Font = Enum.Font.SourceSansBold
TeleportBtn.Parent = TabList
TeleportBtn.MouseButton1Click:Connect(function()
    ContentFrame.Visible = true
    FarmTab.Visible = false
    WeaponTab.Visible = false
    TeleportTab.Visible = true
    SettingsTab.Visible = false
end)

-- Settings Button
SettingsBtn.Text = "Settings"
SettingsBtn.Size = UDim2.new(0, 310, 0, 50)
SettingsBtn.Position = UDim2.new(0, 20, 0, 230)
SettingsBtn.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
SettingsBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
SettingsBtn.TextSize = 18
SettingsBtn.Font = Enum.Font.SourceSansBold
SettingsBtn.Parent = TabList
SettingsBtn.MouseButton1Click:Connect(function()
    ContentFrame.Visible = true
    FarmTab.Visible = false
    WeaponTab.Visible = false
    TeleportTab.Visible = false
    SettingsTab.Visible = true
end)

-- Content Frame (Phần tab phải)
ContentFrame.Size = UDim2.new(0, 550, 0, 450) -- 550x450
ContentFrame.Position = UDim2.new(0.1, 370, 0.5, -225) -- Bên phải MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 150) -- Vàng nhạt
ContentFrame.Visible = false
ContentFrame.Parent = ScreenGui

-- Back Button (Nút mũi tên quay về)
BackButton.Text = "←"
BackButton.Size = UDim2.new(0, 30, 0, 30)
BackButton.Position = UDim2.new(1, -40, 0, 10)
BackButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
BackButton.TextColor3 = Color3.fromRGB(255, 0, 0)
BackButton.TextSize = 18
BackButton.Font = Enum.Font.SourceSansBold
BackButton.Parent = ContentFrame
BackButton.MouseButton1Click:Connect(function()
    ContentFrame.Visible = false
    FarmTab.Visible = false
    WeaponTab.Visible = false
    TeleportTab.Visible = false
    SettingsTab.Visible = false
end)

-- Tab Farm
local FarmTab = Instance.new("Frame")
FarmTab.Size = UDim2.new(1, 0, 1, 0)
FarmTab.Position = UDim2.new(0, 0, 0, 0)
FarmTab.BackgroundTransparency = 1
FarmTab.Visible = false
FarmTab.Parent = ContentFrame

-- Auto Farm Option (Cập nhật farm theo level, nhặt rương)
local AutoFarmOption = Instance.new("TextLabel")
AutoFarmOption.Text = "Auto Farm (Level to Max)"
AutoFarmOption.Size = UDim2.new(0, 450, 0, 40)
AutoFarmOption.Position = UDim2.new(0, 20, 0, 50)
AutoFarmOption.BackgroundTransparency = 1
AutoFarmOption.TextColor3 = Color3.fromRGB(255, 0, 0)
AutoFarmOption.TextSize = 18
AutoFarmOption.Font = Enum.Font.SourceSansBold
AutoFarmOption.Parent = FarmTab

local AutoFarmSwitch = Instance.new("TextButton")
AutoFarmSwitch.Text = ""
AutoFarmSwitch.Size = UDim2.new(0, 40, 0, 20)
AutoFarmSwitch.Position = UDim2.new(0, 490, 0, 60)
AutoFarmSwitch.BackgroundTransparency = 1 -- Tắt
AutoFarmSwitch.Parent = FarmTab
local autoFarming = false
AutoFarmSwitch.MouseButton1Click:Connect(function()
    autoFarming = not autoFarming
    AutoFarmSwitch.BackgroundTransparency = autoFarming and 0 or 1
    AutoFarmSwitch.BackgroundColor3 = Color3.fromRGB(100, 100, 100) -- Xám đậm
    while autoFarming do
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            -- Kiểm tra level người chơi
            local level = player.Data.Level.Value
            local farmLocation, farmMobLevel
            if level < 10 then
                farmLocation = CFrame.new(1037, 15, 1350) -- Starter Island
                farmMobLevel = 1 -- Quái level thấp
            elseif level < 700 then
                farmLocation = CFrame.new(-2500, 15, 1000) -- Middle Island (giả định)
                farmMobLevel = 300
            else
                farmLocation = CFrame.new(-10149.78125, 142.135437, 5836.06934) -- Haunted Castle
                farmMobLevel = 700
            end
            -- Teleport đến khu vực farm
            character.HumanoidRootPart.CFrame = farmLocation
            wait(1)
            -- Farm quái
            for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    local mobLevel = v:FindFirstChild("Level") and v.Level.Value or 0
                    if mobLevel >= farmMobLevel then
                        repeat
                            character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                            wait(0.1)
                            game:GetService("VirtualUser"):CaptureController()
                            game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                            wait(0.1)
                            game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                        until v.Humanoid.Health <= 0 or not autoFarming
                    end
                end
            end
            -- Nhặt rương
            for _, chest in pairs(game.Workspace:GetChildren()) do
                if chest.Name:find("Chest") and chest:IsA("Model") and chest:FindFirstChild("ClickDetector") then
                    local distance = (chest:GetPivot().Position - character.HumanoidRootPart.Position).Magnitude
                    if distance < 50 then
                        character.HumanoidRootPart.CFrame = chest:GetPivot() * CFrame.new(0, 5, 0)
                        wait(0.5)
                        fireclickdetector(chest.ClickDetector)
                        wait(1)
                    end
                end
            end
            wait(1)
        else
            autoFarming = false
            AutoFarmSwitch.BackgroundTransparency = 1
            break
        end
    end
end)

-- Farm Bones Option
local FarmBonesOption = Instance.new("TextLabel")
FarmBonesOption.Text = "Farm Bones"
FarmBonesOption.Size = UDim2.new(0, 450, 0, 40)
FarmBonesOption.Position = UDim2.new(0, 20, 0, 100)
FarmBonesOption.BackgroundTransparency = 1
FarmBonesOption.TextColor3 = Color3.fromRGB(255, 0, 0)
FarmBonesOption.TextSize = 18
FarmBonesOption.Font = Enum.Font.SourceSansBold
FarmBonesOption.Parent = FarmTab

local FarmBonesSwitch = Instance.new("TextButton")
FarmBonesSwitch.Text = ""
FarmBonesSwitch.Size = UDim2.new(0, 40, 0, 20)
FarmBonesSwitch.Position = UDim2.new(0, 490, 0, 110)
FarmBonesSwitch.BackgroundTransparency = 1
FarmBonesSwitch.Parent = FarmTab
local farmingBones = false
FarmBonesSwitch.MouseButton1Click:Connect(function()
    farmingBones = not farmingBones
    FarmBonesSwitch.BackgroundTransparency = farmingBones and 0 or 1
    FarmBonesSwitch.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    while farmingBones do
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(-10149.78125, 142.135437, 5836.06934)
            wait(1)
            for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    repeat
                        character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        wait(0.1)
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                        wait(0.1)
                        game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    until v.Humanoid.Health <= 0 or not farmingBones
                end
            end
            wait(1)
        else
            farmingBones = false
            FarmBonesSwitch.BackgroundTransparency = 1
            break
        end
    end
end)

-- Boss Quest Option
local BossQuestOption = Instance.new("TextLabel")
BossQuestOption.Text = "Boss Quest"
BossQuestOption.Size = UDim2.new(0, 450, 0, 40)
BossQuestOption.Position = UDim2.new(0, 20, 0, 150)
BossQuestOption.BackgroundTransparency = 1
BossQuestOption.TextColor3 = Color3.fromRGB(255, 0, 0)
BossQuestOption.TextSize = 18
BossQuestOption.Font = Enum.Font.SourceSansBold
BossQuestOption.Parent = FarmTab

local BossQuestSwitch = Instance.new("TextButton")
BossQuestSwitch.Text = ""
BossQuestSwitch.Size = UDim2.new(0, 40, 0, 20)
BossQuestSwitch.Position = UDim2.new(0, 490, 0, 160)
BossQuestSwitch.BackgroundTransparency = 1
BossQuestSwitch.Parent = FarmTab
local doingBossQuest = false
BossQuestSwitch.MouseButton1Click:Connect(function()
    doingBossQuest = not doingBossQuest
    BossQuestSwitch.BackgroundTransparency = doingBossQuest and 0 or 1
    BossQuestSwitch.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    while doingBossQuest do
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(-5412.012207, 314.174927, -2666.801758)
            wait(1)
            local eliteHunter = game.Workspace:FindFirstChild("Elite Hunter")
            if eliteHunter then
                character.HumanoidRootPart.CFrame = eliteHunter.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                wait(1)
                print("Accepted Elite Hunter quest")
            end
            character.HumanoidRootPart.CFrame = CFrame.new(3904.49976, 37.6849289, -1216.03662)
            wait(1)
            local boss = game.Workspace.Enemies:FindFirstChild("Darkbeard")
            if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                repeat
                    character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                    wait(0.1)
                    game:GetService("VirtualUser"):CaptureController()
                    game:GetService("VirtualUser"):Button1Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    wait(0.1)
                    game:GetService("VirtualUser"):Button1Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                until boss.Humanoid.Health <= 0 or not doingBossQuest
            end
            wait(1)
        else
            doingBossQuest = false
            BossQuestSwitch.Background
