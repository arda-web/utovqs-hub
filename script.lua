-- [[ UTOVQS HUB - GÜVENLİ KEY SİSTEMİ ]] --
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

-- Key: 6931 (Kod içinde düz metin olarak geçmez)
local function verifyKey(input)
    local targetCheck = (3465.5 * 2) + 0 -- 6931
    local numericInput = tonumber(input)
    if numericInput and numericInput == targetCheck then
        return true
    end
    return false
end

-- Şık bir UI Giriş Ekranı Oluşturma
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
TextBox.PlaceholderText = "Key'i buraya girin..."
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

-- Butona Basıldığında Kontrol Etme
SubmitButton.MouseButton1Click:Connect(function()
    local enteredText = TextBox.Text
    if verifyKey(enteredText) then
        -- Key Doğru -> Giriş Ekranını Kapat ve Utovqs Hub'ı Başlat
        ScreenGui:Destroy()
        
        -- [[ UTOVQS HUB ANA MENÜ BAŞLANGICI ]] --
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
        local Window = Library.CreateLib("Utovqs Hub - Brookhaven", "DarkTheme")

        -- 1. Sekme: Karakter (Hız, Zıplama vb.)
        local Tab1 = Window:NewTab("Karakter")
        local Section1 = Tab1:NewSection("Hareket ve Fizik")

        Section1:NewSlider("Hız (WalkSpeed)", "Karakterin hızını ayarlar", 250, 16, function(v)
            localPlayer.Character.Humanoid.WalkSpeed = v
        end)

        Section1:NewSlider("Zıplama Gücü (JumpPower)", "Zıplama yüksekliğini ayarlar", 300, 50, function(v)
            localPlayer.Character.Humanoid.JumpPower = v
        end)

        Section1:NewButton("Uçma Modu (Fly)", "Havada uçmanızı sağlar", function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/mciiscool/flyscript_link/raw/main/fly.lua", true))()
        end)

        Section1:NewToggle("Duvarlardan Geçme (Noclip)", "Duvarların içinden geçmenizi sağlar", function(state)
            local noclip = state
            game:GetService("RunService").Stepped:Connect(function()
                if noclip and localPlayer.Character then
                    for _, v in pairs(localPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end)

        -- 2. Sekme: Avatar (Korblox, Zombie Leg, Headless)
        local TabAvatar = Window:NewTab("Avatar")
        local SectionAvatar = TabAvatar:NewSection("Özel Görünüm Paketleri")

        SectionAvatar:NewButton("Korblox Bacak", "Sağ bacağı Korblox yapar (ID: 139607718)", function()
            local char = localPlayer.Character
            if char and char:FindFirstChild("RightLeg") then
                local rightLeg = char.RightLeg
                for _, child in pairs(rightLeg:GetChildren()) do
                    if child:IsA("SpecialMesh") then child:Destroy() end
                end
                local mesh = Instance.new("SpecialMesh")
                mesh.MeshId = "rbxassetid://139607718"
                mesh.TextureId = "rbxassetid://139607721"
                mesh.Parent = rightLeg
            end
        end)

        SectionAvatar:NewButton("Zombie Bacağı", "Bacağı zombi bacağı yapar (ID: 37754710)", function()
            local char = localPlayer.Character
            if char and (char:FindFirstChild("RightLowerLeg") or char:FindFirstChild("RightLeg")) then
                local leg = char:FindFirstChild("RightLowerLeg") or char:FindFirstChild("RightLeg")
                for _, child in pairs(leg:GetChildren()) do
                    if child:IsA("SpecialMesh") then child:Destroy() end
                end
                local mesh = Instance.new("SpecialMesh")
                mesh.MeshId = "rbxassetid://37754710"
                mesh.Parent = leg
            end
        end)

        SectionAvatar:NewButton("Headless (Kafasız)", "Kafanızı gizler (ID: 134082579)", function()
            local char = localPlayer.Character
            if char and char:FindFirstChild("Head") then
                local head = char.Head
                head.Transparency = 1
                for _, child in pairs(head:GetChildren()) do
                    if child:IsA("Decal") then
                        child.Transparency = 1
                    end
                end
            end
        end)

        -- 3. Sekme: Animasyonlar (Asker Animasyon Paketi)
        local TabAnim = Window:NewTab("Animasyonlar")
        local SectionAnim = TabAnim:NewSection("Asker Animasyon Paketi")

        SectionAnim:NewButton("Asker Animasyonunu Etkinleştir", "Özel Asker Idle, Walk, Run, Jump animasyonlarını uygular", function()
            local char = localPlayer.Character
            if char and char:FindFirstChild("Animate") then
                local animateScript = char.Animate
                
                -- Asker animasyon ID atamaları
                local anims = {
                    idle = { {Id = "rbxassetid://114264441201765", Weight = 9} },
                    walk = { {Id = "rbxassetid://122783976375321", Weight = 10} },
                    run  = { {Id = "rbxassetid://117276571225301", Weight = 10} },
                    jump = { {Id = "rbxassetid://92738460397646", Weight = 10} },
                    fall = { {Id = "rbxassetid://121807925179208", Weight = 10} },
                    swim = { {Id = "rbxassetid://78517162186590", Weight = 10} },
                    climb= { {Id = "rbxassetid://104015116392523", Weight = 10} }
                }

                for animName, animData in pairs(anims) do
                    if animateScript:FindFirstChild(animName) then
                        local animTrack = animateScript[animName]
                        for _, child in pairs(animTrack:GetChildren()) do
                            if child:IsA("Animation") then
                                child.AnimationId = animData[1].Id
                            end
                        end
                    end
                end
                
                -- Karakterin animasyonlarını yenilemek için resetleme
                char.Humanoid.Jump = true
            end
        end)

        -- 4. Sekme: Işınlanma
        local Tab2 = Window:NewTab("Işınlanma")
        local Section2 = Tab2:NewSection("Harita Yerleri")

        Section2:NewButton("Banka", "Bankaya ışınlanır", function()
            localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(105, 40, -290)
        end)

        Section2:NewButton("Polis Merkezi", "Polis merkezine ışınlanır", function()
            localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 40, 920)
        end)

        Section2:NewButton("Gizli Oda / Kasa", "Gizli alanlara ışınlanır", function()
            localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(465, 20, -100)
        end)

        -- 5. Sekme: Eğlence
        local Tab3 = Window:NewTab("Eğlence")
        local Section3 = Tab3:NewSection("Ekstra Araçlar")

        Section3:NewButton("Infinite Yield (Admin Komutları)", "Gelişmiş admin komutları menüsü", function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)

        Section3:NewButton("Işık / Fullbright", "Ortamı tamamen aydınlatır", function()
            local Light = game:GetService("Lighting")
            Light.Ambient = Color3.new(1, 1, 1)
            Light.Brightness = 2
            Light.ClockTime = 14
        end)

        -- Açılır Kapanır Yüzen Ekran Butonu (Floating Toggle Button)
        local ToggleGui = Instance.new("ScreenGui")
        ToggleGui.Name = "UtovqsFloatingToggle"
        ToggleGui.Parent = game.CoreGui
        ToggleGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        local ToggleBtn = Instance.new("TextButton")
        ToggleBtn.Size = UDim2.new(0, 110, 0, 40)
        ToggleBtn.Position = UDim2.new(0, 20, 0.5, -20)
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        ToggleBtn.TextColor3 = Color3.fromRGB(0, 170, 255)
        ToggleBtn.TextSize = 13
        ToggleBtn.Font = Enum.Font.GothamBold
        ToggleBtn.Text = "Utovqs AÇ/KAPAT"
        ToggleBtn.Parent = ToggleGui

        local TBtnCorner = Instance.new("UICorner")
        TBtnCorner.CornerRadius = UDim.new(0, 8)
        TBtnCorner.Parent = ToggleBtn

        local menuVisible = true
        ToggleBtn.MouseButton1Click:Connect(function()
            menuVisible = not menuVisible
            game:GetService("CoreGui"):FindFirstChild("KavoUI").Enabled = menuVisible
        end)
        -- [[ UTOVQS HUB SONU ]] --
        
    else
        -- Key Yanlış -> Oyuncuyu Kickle
        localPlayer:Kick("Geçersiz Key girdiniz! Oyundan atıldınız.")
    end
end)
￼Enter-- [[ UTOVQS HUB - GÜVENLİ KEY SİSTEMİ ]] --
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

-- Key: 6931 (Kod içinde düz metin olarak geçmez)
local function verifyKey(input)
    local targetCheck = (3465.5 * 2) + 0 -- 6931
    local numericInput = tonumber(input)
    if numericInput and numericInput == targetCheck then
        return true
    end
    return false
end

-- Şık bir UI Giriş Ekranı Oluşturma
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
Text = "Utovqs Hub - Key Doğrulama"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 45)
TextBox.Position = UDim2.new(0.1, 0, 0.35, 0)
TextBox.PlaceholderText = "Key'i buraya girin..."
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

-- Butona Basıldığında Kontrol Etme
SubmitButton.MouseButton1Click:Connect(function()
    local enteredText = TextBox.Text
    if verifyKey(enteredText) then
        -- Key Doğru -> Giriş Ekranını Kapat ve Utovqs Hub'ı Başlat
        ScreenGui:Destroy()
        
        -- [[ UTOVQS HUB ANA MENÜ BAŞLANGICI ]] --
        local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
        local Window = Library.CreateLib("Utovqs Hub - Brookhaven", "DarkTheme")

        -- 1. Sekme: Karakter (Hız, Zıplama vb.)
        local Tab1 = Window:NewTab("Karakter")
        local Section1 = Tab1:NewSection("Hareket ve Fizik")

        Section1:NewSlider("Hız (WalkSpeed)", "Karakterin hızını ayarlar", 250, 16, function(v)
            localPlayer.Character.Humanoid.WalkSpeed = v
        end)

        Section1:NewSlider("Zıplama Gücü (JumpPower)", "Zıplama yüksekliğini ayarlar", 300, 50, function(v)
            localPlayer.Character.Humanoid.JumpPower = v
        end)

        Section1:NewButton("Uçma Modu (Fly)", "Havada uçmanızı sağlar", function()
            loadstring(game:HttpGet("https://gist.githubusercontent.com/mciiscool/flyscript_link/raw/main/fly.lua", true))()
        end)

        Section1:NewToggle("Duvarlardan Geçme (Noclip)", "Duvarların içinden geçmenizi sağlar", function(state)
            local noclip = state
            game:GetService("RunService").Stepped:Connect(function()
                if noclip and localPlayer.Character then
                    for _, v in pairs(localPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end)

        -- 2. Sekme: Avatar (Korblox, Zombie Leg, Headless)
        local TabAvatar = Window:NewTab("Avatar")
        local SectionAvatar = TabAvatar:NewSection("Özel Görünüm Paketleri")

        SectionAvatar:NewButton("Korblox Bacak", "Sağ bacağı Korblox yapar (ID: 139607718)", function()
            local char = localPlayer.Character
            if char and char:FindFirstChild("RightLeg") then
                local rightLeg = char.RightLeg
                for _, child in pairs(rightLeg:GetChildren()) do
                    if child:IsA("SpecialMesh") then child:Destroy() end
                end
                local mesh = Instance.new("SpecialMesh")
                mesh.MeshId = "rbxassetid://139607718"
                mesh.TextureId = "rbxassetid://139607721"
                mesh.Parent = rightLeg
            end
        end)

        SectionAvatar:NewButton("Zombie Bacağı", "Bacağı zombi bacağı yapar (ID: 37754710)", function()
            local char = localPlayer.Character
            if char and (char:FindFirstChild("RightLowerLeg") or char:FindFirstChild("RightLeg")) then
                local leg = char:FindFirstChild("RightLowerLeg") or char:FindFirstChild("RightLeg")
                for _, child in pairs(leg:GetChildren()) do
                    if child:IsA("SpecialMesh") then child:Destroy() end
                end
                local mesh = Instance.new("SpecialMesh")
                mesh.MeshId = "rbxassetid://37754710"
                mesh.Parent = leg
            end
        end)

        SectionAvatar:NewButton("Headless (Kafasız)", "Kafanızı gizler (ID: 134082579)", function()
            local char = localPlayer.Character
            if char and char:FindFirstChild("Head") then
