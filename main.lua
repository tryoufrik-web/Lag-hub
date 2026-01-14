-- ServerLagHub.lua - Universal Server Stress Test
-- Menciptakan lag server-side yang terlihat dan dirasakan semua player

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- Server-Side Lag Injection (Advanced)
local function CreateServerLag()
    print("[OxyX] Initializing Server-Side Lag Protocols...")
    
    -- Metode 1: Network Flood
    for i = 1, 100 do
        spawn(function()
            local remote = Instance.new("RemoteEvent")
            remote.Name = "LagEvent_" .. HttpService:GenerateGUID(false):sub(1,8)
            remote.Parent = game:GetService("ReplicatedStorage")
            
            -- Kirim data besar berulang kali
            while task.wait(0.01) do
                pcall(function()
                    remote:FireServer({
                        Data = string.rep("L", 10000), -- Data besar
                        Timestamp = os.time(),
                        Random = math.random(1, 1000000),
                        Flood = true
                    })
                end)
            end
        end)
    end
    
    -- Metode 2: Instance Creation Loop (Server-Side)
    spawn(function()
        while task.wait(0.05) do
            pcall(function()
                -- Buat banyak part di server
                local folder = Instance.new("Folder")
                folder.Name = "LagFolder_" .. tick()
                folder.Parent = workspace
                
                for i = 1, 50 do
                    local part = Instance.new("Part")
                    part.Name = "LagPart_" .. i
                    part.Size = Vector3.new(1,1,1)
                    part.Position = Vector3.new(
                        math.random(-500, 500),
                        math.random(0, 100),
                        math.random(-500, 500)
                    )
                    part.Anchored = true
                    part.CanCollide = false
                    part.Transparency = 0.5
                    part.Parent = folder
                    
                    -- Tambahkan script untuk beban ekstra
                    local script = Instance.new("Script")
                    script.Parent = part
                    script.Disabled = false
                end
                
                -- Hapus setelah beberapa detik
                game:GetService("Debris"):AddItem(folder, 10)
            end)
        end
    end)
    
    -- Metode 3: HTTP Request Flood (Jika diizinkan)
    spawn(function()
        while task.wait(0.1) do
            pcall(function()
                local success, response = pcall(function()
                    return HttpService:GetAsync("https://httpbin.org/delay/1", true)
                end)
            end)
        end
    end)
end

-- Visual Lag Indicator untuk semua player
local function CreateGlobalLagEffects()
    -- Buat efek visual yang terlihat semua player
    local lagIndicator = Instance.new("Part")
    lagIndicator.Name = "GlobalLagIndicator"
    lagIndicator.Size = Vector3.new(50, 50, 50)
    lagIndicator.Position = Vector3.new(0, 100, 0)
    lagIndicator.Anchored = true
    lagIndicator.CanCollide = false
    lagIndicator.Material = Enum.Material.Neon
    lagIndicator.Color = Color3.fromRGB(255, 0, 0)
    lagIndicator.Transparency = 0.3
    lagIndicator.Parent = workspace
    
    -- Pulsating effect
    spawn(function()
        while lagIndicator.Parent do
            for i = 0.3, 0.7, 0.05 do
                lagIndicator.Transparency = i
                task.wait(0.1)
            end
            for i = 0.7, 0.3, -0.05 do
                lagIndicator.Transparency = i
                task.wait(0.1)
            end
        end
    end)
    
    -- Particle effect
    local particles = Instance.new("ParticleEmitter")
    particles.Texture = "rbxassetid://242019912"
    particles.Rate = 1000
    particles.Speed = NumberRange.new(20)
    particles.Lifetime = NumberRange.new(1, 3)
    particles.Size = NumberSequence.new(1, 3)
    particles.Transparency = NumberSequence.new(0.5, 1)
    particles.Color = ColorSequence.new(
        Color3.fromRGB(255, 0, 0),
        Color3.fromRGB(255, 100, 0)
    )
    particles.Parent = lagIndicator
    
    -- Sound effect looping (terdengar semua player)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://131147845" -- Static noise
    sound.Volume = 0.5
    sound.Looped = true
    sound.Parent = lagIndicator
    sound:Play()
    
    -- Billboard untuk semua player
    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.Adornee = lagIndicator
    billboard.Parent = lagIndicator
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = "⚠ SERVER LAG ACTIVE ⚠\nPing: HIGH | FPS: LOW"
    label.TextColor3 = Color3.fromRGB(255, 50, 50)
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.Parent = billboard
    
    -- Update ping info
    spawn(function()
        while lagIndicator.Parent do
            label.Text = string.format("⚠ SERVER LAG ACTIVE ⚠\n[OxyX Protocol: Server Stress]\nTime: %s", os.date("%X"))
            task.wait(1)
        end
    end)
end

-- GUI yang bisa dikecilkan/besarkan
local function CreateResizableLagGUI()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    -- Hapus GUI lama jika ada
    local oldGUI = PlayerGui:FindFirstChild("LagControlCenter")
    if oldGUI then oldGUI:Destroy() end
    
    -- Buat GUI utama
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LagControlCenter"
    ScreenGui.Parent = PlayerGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 999
    
    -- Main window (resizable)
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainWindow"
    MainFrame.Size = UDim2.new(0, 400, 0, 300) -- Default size
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    MainFrame.BorderColor3 = Color3.fromRGB(255, 50, 50)
    MainFrame.BorderSizePixel = 2
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    
    -- Title bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -60, 1, 0)
    Title.Text = "⚠ OxyX Lag Control Center ⚠"
    Title.TextColor3 = Color3.fromRGB(255, 100, 100)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.Parent = TitleBar
    
    -- Close button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 30, 0, 30)
    CloseButton.Position = UDim2.new(1, -30, 0, 0)
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseButton.Parent = TitleBar
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui.Enabled = not ScreenGui.Enabled
    end)
    
    -- Minimize button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
    MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
    MinimizeButton.Text = "_"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    MinimizeButton.Parent = TitleBar
    MinimizeButton.MouseButton1Click:Connect(function()
        if MainFrame.Size.Y.Offset == 30 then
            -- Restore size
            MainFrame.Size = UDim2.new(0, 400, 0, 300)
        else
            -- Minimize
            MainFrame.Size = UDim2.new(0, 400, 0, 30)
        end
    end)
    
    -- Resize handle (bottom right)
    local ResizeHandle = Instance.new("Frame")
    ResizeHandle.Size = UDim2.new(0, 10, 0, 10)
    ResizeHandle.Position = UDim2.new(1, -10, 1, -10)
    ResizeHandle.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    ResizeHandle.BorderSizePixel = 0
    ResizeHandle.Parent = MainFrame
    
    -- Buat resizable
    local dragging = false
    local startPos
    local startSize
    
    ResizeHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            startPos = input.Position
            startSize = MainFrame.Size
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - startPos
            local newSize = UDim2.new(
                startSize.X.Scale, 
                math.max(200, startSize.X.Offset + delta.X),
                startSize.Y.Scale,
                math.max(100, startSize.Y.Offset + delta.Y)
            )
            MainFrame.Size = newSize
        end
    end)
    
    -- Control buttons
    local controls = {
        {"Light Lag", Color3.fromRGB(100, 200, 100), function()
            CreateServerLag()
            CreateGlobalLagEffects()
        end},
        {"Heavy Lag", Color3.fromRGB(200, 100, 100), function()
            for i = 1, 5 do
                CreateServerLag()
            end
            CreateGlobalLagEffects()
        end},
        {"Particle Storm", Color3.fromRGB(200, 200, 100), function()
            -- Buat badai particle
            for i = 1, 1000 do
                local particle = Instance.new("Part")
                particle.Size = Vector3.new(1,1,1)
                particle.Position = Vector3.new(
                    math.random(-200, 200),
                    math.random(0, 100),
                    math.random(-200, 200)
                )
                particle.Anchored = false
                particle.CanCollide = false
                particle.Transparency = 0.7
                particle.Color = Color3.fromRGB(math.random(100,255), 50, 50)
                particle.Parent = workspace
                particle.Velocity = Vector3.new(
                    math.random(-50, 50),
                    math.random(10, 50),
                    math.random(-50, 50)
                )
                game:GetService("Debris"):AddItem(particle, 10)
            end
        end},
        {"Clear Lag", Color3.fromRGB(100, 100, 200), function()
            -- Coba bersihkan
            for _, obj in pairs(workspace:GetChildren()) do
                if obj.Name:find("Lag") or obj.Name:find("OxyX") then
                    pcall(function() obj:Destroy() end)
                end
            end
        end}
    }
    
    for i, control in ipairs(controls) do
        local button = Instance.new("TextButton")
        button.Text = control[1]
        button.Size = UDim2.new(0.45, 0, 0, 40)
        button.Position = UDim2.new(
            (i-1)%2 * 0.5 + 0.025, 
            0, 
            0.1 + math.floor((i-1)/2) * 0.2, 
            0
        )
        button.BackgroundColor3 = control[2]
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 12
        button.Parent = MainFrame
        
        button.MouseButton1Click:Connect(control[3])
    end
    
    -- Status display
    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1, -20, 0, 40)
    status.Position = UDim2.new(0, 10, 0.9, -50)
    status.Text = "Status: Ready\nServer Ping: " .. tostring(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
    status.TextColor3 = Color3.fromRGB(200, 200, 200)
    status.BackgroundTransparency = 1
    status.Font = Enum.Font.Gotham
    status.TextSize = 12
    status.TextXAlignment = Enum.TextXAlignment.Left
    status.Parent = MainFrame
    
    -- Update status
    spawn(function()
        while MainFrame.Parent do
            local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
            status.Text = string.format("Status: Active\nServer Ping: %dms\nPlayers: %d/%d", 
                ping, #Players:GetPlayers(), Players.MaxPlayers)
            task.wait(1)
        end
    end)
    
    return ScreenGui
end

-- Toggle GUI dengan key
local gui = CreateResizableLagGUI()
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if not
