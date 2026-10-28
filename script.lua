-- [[ UTOVQS HUB - GÜNCELLENMİŞ VE DÜZELTİLMİŞ SÜRÜM ]] --
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

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
        HubFrame.Size = UDim2.new(0, 400, 0, 360)
        HubFrame.Position = UDim2.new(0.5, -200, 0.5, -180)
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

        -- Buton Oluşturucu Fonksiyon
        local function createButton(name, yPos, callback)
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(0.9, 0, 0, 32)
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
            localPlayer.Character.Humanoid.WalkSpeed = 100
        end)

        -- 2. Korblox Bacak (R15 Desteği ile Düzeltildi - ID: 139607718)
        createButton("Korblox Bacak Yap", 90, function()
            local char = localPlayer.Character
            if char then
                local rightLeg = char:FindFirstChild("RightUpperLeg")
                if rightLeg then
                    for _, child in pairs(rightLeg:GetChildren()) do
                        if child:IsA("SpecialMesh") then child:Destroy() end
                    end
                    local mesh = Instance.new("SpecialMesh")
                    mesh.MeshId = "rbxassetid://139607718"
                    mesh.TextureId = "rbxassetid://139607721"
                    mesh.Parent = rightLeg
                end
            end
        end)

        -- 3. Zombie leg
        createButton("Zombie Leg (Zombi Bacağı)", 130, function()
            local char = localPlayer.Character
            if char then
                local rightLeg = char:FindFirstChild("RightUpperLeg")
                if rightLeg then
                    for _, child in pairs(rightLeg:GetChildren()) do
                        if child:IsA("SpecialMesh") then child:Destroy() end
                    end
                    local mesh = Instance.new("SpecialMesh")
                    mesh.MeshId = "rbxassetid://37754710"
                    mesh.Parent = rightLeg
                end
            end
        end)

        -- 4. Headless
        createButton("Headless (Kafasız Yap)", 170, function()
            local char = localPlayer.Character
            if char and char:FindFirstChild("Head") then
                char.Head.Transparency = 1
                for _, child in pairs(char.Head:GetChildren()) do
                    if child:IsA("Decal") then child.Transparency = 1 end
                end
            end
        end)

        -- 5. Asker Animasyonu
        createButton("Asker Animasyonu Uygula", 210, function()
            local char = localPlayer.Character
            if char and char:FindFirstChild("Animate") then
                local animateScript = char.Animate
                local anims = {
                    idle = "rbxassetid://114264441201765",
                    walk = "rbxassetid://122783976375321",
                    run  = "rbxassetid://117276571225301"
                }
                for animName, id in pairs(anims) do
                    if animateScript:FindFirstChild(animName) then
                        for _, child in pairs(animateScript[animName]:GetChildren()) do
                            if child:IsA("Animation") then child.AnimationId = id end
                        end
                    end
                end
                char.Humanoid.Jump = true
            end
        end)

        -- 6. Menüyü Kapat / Aç
        createButton("Menüyü Kapat / Aç (Gizle)", 250, function()
            HubFrame.Visible = not HubFrame.Visible
        end)

    else
        localPlayer:Kick("Geçersiz Key girdiniz! Oyundan atıldınız.")
    end
end)
