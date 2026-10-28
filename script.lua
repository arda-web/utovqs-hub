-- [[ UTOVQS HUB - KESİN ÇÖZÜMLÜ SON SÜRÜM ]] --
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local runService = game:GetService("RunService")

-- Durum Değişkenleri
local activeHeadless = false
local activeKorblox = false
local activeZombie = false

-- Key Doğrulama (Key: 6931)
local function verifyKey(input)
    local targetCheck = (3465.5 * 2) + 0 -- 6931
    local numericInput = tonumber(input)
    if numericInput and numericInput == targetCheck then
        return true
    end
    return false
end

-- Giriş Ekranı (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UtovqsKeyGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 200)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Utovqs Hub - Key Doğrulama"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 45)
TextBox.Position = UDim2.new(0.1, 0, 0.35, 0)
TextBox.PlaceholderText = "Key'i buraya girin (6931)..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextBox.TextSize = 14
TextBox.Font = Enum.Font.Gotham
TextBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = TextBox

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.8, 0, 0, 40)
SubmitButton.Position = UDim2.new(0.1, 0, 0.68, 0)
SubmitButton.Text = "Giriş Yap"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitButton.TextSize = 15
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = SubmitButton

SubmitButton.MouseButton1Click:Connect(function()
    local enteredText = TextBox.Text
    if verifyKey(enteredText) then
        ScreenGui:Destroy()
        
        -- [[ ANA HUB EKRANI ]] --
        local HubGui = Instance.new("ScreenGui")
        HubGui.Name = "UtovqsHubMain"
        HubGui.Parent = game.CoreGui
        HubGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local HubFrame = Instance.new("Frame")
        HubFrame.Size = UDim2.new(0, 400, 0, 320)
        HubFrame.Position = UDim2.new(0.5, -200, 0.5, -160)
        HubFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        HubFrame.Active = true
        HubFrame.Draggable = true
        HubFrame.Parent = HubGui

        local HubCorner = Instance.new("UICorner")
        HubCorner.CornerRadius = UDim.new(0, 10)
        HubCorner.Parent = HubFrame

        local HubTitle = Instance.new("TextLabel")
        HubTitle.Size = UDim2.new(1, 0, 0, 40)
        HubTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        HubTitle.Text = "  Utovqs Hub - Brookhaven"
        HubTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
        HubTitle.TextSize = 16
        HubTitle.Font = Enum.Font.GothamBold
        HubTitle.TextXAlignment = Enum.TextXAlignment.Left
        HubTitle.Parent = HubFrame

        -- Buton Oluşturucu
        local function createButton(name, yPos, callback)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.9, 0, 0, 35)
            btn.Position = UDim2.new(0.05, 0, 0, yPos)
            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.TextSize = 13
            btn.Font = Enum.Font.Gotham
            btn.Text = name
            btn.Parent = HubFrame
            
            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(0, 6)
            c.Parent = btn
            
            btn.MouseButton1Click:Connect(callback)
        end

        -- 1. Hız
        createButton("Hız Ver (100)", 50, function()
            if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                localPlayer.Character.Humanoid.WalkSpeed = 100
            end
        end)

        -- 2. Korblox Bacak (HumanoidDescription ile kesin çözüm)
        createButton("Korblox Bacak Aç/Kapat", 95, function()
            activeKorblox = not activeKorblox
            activeZombie = false
            local char = localPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                local hum = char:FindFirstChildOfClass("Humanoid")
                local desc = hum:GetAppliedDescription()
                if activeKorblox then
                    desc.RightLeg = 139607718
                else
                    desc.RightLeg = 0
                end
                hum:ApplyDescription(desc)
            end
        end)

        -- 3. Zombi Bacağı (HumanoidDescription ile kesin çözüm)
        createButton("Zombie Leg Aç/Kapat", 140, function()
            activeZombie = not activeZombie
            activeKorblox = false
            local char = localPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                local hum = char:FindFirstChildOfClass("Humanoid")
                local desc = hum:GetAppliedDescription()
                if activeZombie then
                    desc.RightLeg = 37754710
                else
                    desc.RightLeg = 0
                end
                hum:ApplyDescription(desc)
            end
        end)

        -- 4. Headless
        createButton("Headless (Kafasız) Aç/Kapat", 185, function()
            activeHeadless = not activeHeadless
        end)

        -- 5. Menüyü Kapat / Aç
        createButton("Menüyü Kapat / Aç (Gizle)", 230, function()
            HubFrame.Visible = not HubFrame.Visible
        end)

        -- Sürekli Döngü (Headless ve kıyafetleri korumak için)
        runService.RenderStepped:Connect(function()
            local char = localPlayer.Character
            if not char then return end

            if activeHeadless then
                local head = char:FindFirstChild("Head")
                if head then
                    head.Transparency = 1
                    for _, child in pairs(head:GetChildren()) do
                        if child:IsA("Decal") then child.Transparency = 1 end
                    end
                end
            end
        end)

    else
        localPlayer:Kick("Geçersiz Key girdiniz! Oyundan atıldınız.")
    end
end)
