-- ===============================
-- OXYX LAG GENERATOR PRO - FULL
-- ===============================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

print("[OXYX] Initializing Lag Generator Pro...")

-- Lag Levels Configuration
local LagLevels = {
    Light = {Particles = 100, Loops = 5, Delay = 0.1},
    Medium = {Particles = 300, Loops = 15, Delay = 0.05},
    Heavy = {Particles = 600, Loops = 30, Delay = 0.02},
    Extreme = {Particles = 1000, Loops = 50, Delay = 0.01}
}

-- Create Main Lag GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OxyXLagControl"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 3
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Text = "⚡ OXYX LAG GENERATOR PRO ⚡"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 18
Title.Parent = MainFrame

-- Lag Level Buttons
local LagButtons = {
    {"🌙 LIGHT LAG", Color3.fromRGB(0, 150, 0), "Light"},
    {"⚡ MEDIUM LAG", Color3.fromRGB(200, 200, 0), "Medium"},
    {"🔥 HEAVY LAG", Color3.fromRGB(255, 100, 0), "Heavy"},
    {"☢️ EXTREME LAG", Color3.fromRGB(255, 0, 0), "Extreme"}
}

local buttonY = 0.15
for i, btnInfo in ipairs(LagButtons) do
    local Button = Instance.new("TextButton")
    Button.Text = btnInfo[1]
    Button.Size = UDim2.new(0.8, 0, 0, 45)
    Button.Position = UDim2.new(0.1, 0, buttonY, 0)
    Button.BackgroundColor3 = btnInfo[2]
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 14
    Button.Parent = MainFrame
    buttonY = buttonY + 0.12
    
    Button.MouseButton1Click:Connect(function()
        StartLagGeneration(btnInfo[3])
    end)
end

-- Special Lag Functions
local SpecialButtons = {
    {"🌀 PARTICLE STORM", Color3.fromRGB(150, 0, 255), function()
        CreateParticleStorm()
    end},
    {"📡 NETWORK FLOOD", Color3.new(0, 100, 255), function()
        NetworkFlood()
    end},
    {"🖥️ UI LAG", Color3.fromRGB(255, 150, 0), function()
        CreateUILag()
    end},
    {"🔊 SOUND SPAM", Color3.fromRGB(0, 200, 200), function()
        SoundSpam()
    end}
}

buttonY = 0.65
for i, btnInfo in ipairs(SpecialButtons) do
    local Button = Instance.new("TextButton")
    Button.Text = btnInfo[1]
    Button.Size = UDim2.new(0.8, 0, 0, 40)
    Button.Position = UDim2.new(0.1, 0, buttonY, 0)
    Button.BackgroundColor3 = btnInfo[2]
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 12
    Button.Parent = MainFrame
    buttonY = buttonY + 0.1
    
    Button.MouseButton1Click:Connect(btnInfo[3])
end

-- Status Display
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Text = "Status: Ready"
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0.95, -30)
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Parent = MainFrame

-- Lag Generation Functions
function StartLagGeneration(level)
    local config = LagLevels[level] or LagLevels.Medium
    StatusLabel.Text = "Status: Generating " .. level .. " Lag..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    -- Method 1: Particle Spam
    for i = 1, config.Particles do
        spawn(function()
            local Part = Instance.new("Part")
            Part.Size = Vector3.new(math.random(1, 3), math.random(1, 3), math.random(1, 3))
            Part.Position = Vector3.new(
                math.random(-200, 200),
                math.random(0, 100),
                math.random(-200, 200)
            )
            Part.Anchored = true
            Part.CanCollide = false
            Part.Transparency = math.random(30, 70) / 100
            Part.Color = Color3.fromRGB(math.random(150, 255), 0, 0)
            Part.Parent = workspace
            
            -- Add Particles
            local Emitter = Instance.new("ParticleEmitter")
            Emitter.Rate = 20
            Emitter.Lifetime = NumberRange.new(0.5, 2)
            Emitter.Size = NumberSequence.new(0.3, 1.5)
            Emitter.Parent = Part
            
            wait(math.random(5, 15))
            Part:Destroy()
        end)
        wait(config.Delay)
    end
    
    -- Method 2: Script Loops
    for i = 1, config.Loops do
        spawn(function()
            while true do
                local Folder = Instance.new("Folder")
                Folder.Name = "LagFolder_" .. math.random(1, 10000)
                Folder.Parent = workspace
                
                for j = 1, 10 do
                    local Value = Instance.new("StringValue")
                    Value.Name = "LagData_" .. j
                    Value.Value = string.rep("LAG", 500)
                    Value.Parent = Folder
                end
                
                wait(0.2)
                Folder:Destroy()
                wait(0.2)
            end
        end)
    end
    
    StatusLabel.Text = "Status: " .. level .. " Lag Active"
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
end

function CreateParticleStorm()
    for i = 1, 500 do
        local Part = Instance.new("Part")
        Part.Size = Vector3.new(0.5, 0.5, 0.5)
        Part.Position = Vector3.new(
            math.random(-100, 100),
            math.random(0, 50),
            math.random(-100, 100)
        )
        Part.Velocity = Vector3.new(
            math.random(-20, 20),
            math.random(5, 30),
            math.random(-20, 20)
        )
        Part.CanCollide = false
        Part.Transparency = 0.3
        Part.Color = Color3.fromRGB(math.random(50, 255), math.random(50, 255), math.random(50, 255))
        Part.Parent = workspace
        
        local Emitter = Instance.new("ParticleEmitter")
        Emitter.Rate = 100
        Emitter.Lifetime = NumberRange.new(0.5, 2)
        Emitter.Parent = Part
        
        Debris:AddItem(Part, 5)
        wait(0.01)
    end
end

function NetworkFlood()
    local Remotes = {}
    
    -- Create Fake Remotes
    for i = 1, 5 do
        local Remote = Instance.new("RemoteEvent")
        Remote.Name = "OxyXLagRemote_" .. i
        Remote.Parent = game:GetService("ReplicatedStorage")
        table.insert(Remotes, Remote)
    end
    
    -- Spam Fire
    spawn(function()
        while true do
            for _, remote in pairs(Remotes) do
                pcall(function()
                    remote:FireServer({
                        data = string.rep("X", 5000),
                        timestamp = os.time(),
                        spam = true
                    })
                end)
            end
            wait(0.05)
        end
    end)
end

function CreateUILag()
    local UIGui = Instance.new("ScreenGui")
    UIGui.Name = "OxyXUILag"
    UIGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    for i = 1, 200 do
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0, math.random(30, 150), 0, math.random(30, 150))
        Frame.Position = UDim2.new(0, math.random(0, 1000), 0, math.random(0, 800))
        Frame.BackgroundColor3 = Color3.fromRGB(math.random(100, 255), 0, 0)
        Frame.BorderSizePixel = 0
        Frame.Parent = UIGui
        
        -- Animate
        spawn(function()
            while Frame.Parent do
                Frame.BackgroundTransparency = math.random(0, 50) / 100
                Frame.Position = Frame.Position + UDim2.new(0, math.random(-3, 3), 0, math.random(-3, 3))
                wait(0.1)
            end
        end)
    end
end

function SoundSpam()
    for i = 1, 20 do
        spawn(function()
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://184702873"
            Sound.Volume = 0.5
            Sound.Parent = workspace
            Sound:Play()
            wait(0.5)
            Sound:Destroy()
        end)
        wait(0.1)
    end
end

-- Control Buttons
local ClearButton = Instance.new("TextButton")
ClearButton.Text = "🧹 CLEAR ALL LAG"
ClearButton.Size = UDim2.new(0.8, 0, 0, 40)
ClearButton.Position = UDim2.new(0.1, 0, 0.9, -40)
ClearButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.Font = Enum.Font.GothamBold
ClearButton.Parent = MainFrame

ClearButton.MouseButton1Click:Connect(function()
    -- Clean up lag objects
    for _, obj in pairs(workspace:GetChildren()) do
        if obj.Name:find("Lag") or obj.Name:find("OxyX") then
            pcall(function() obj:Destroy() end)
        end
    end
    StatusLabel.Text = "Status: Cleared"
    wait(2)
    StatusLabel.Text = "Status: Ready"
end)

-- Toggle Key
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F6 then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

print("======================================")
print("OXYX LAG GENERATOR PRO LOADED")
print("Press F6 to toggle control panel")
print("======================================")

-- Auto start medium lag
wait(3)
StartLagGeneration("Medium")