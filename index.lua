-- LAG HUB FIXED VERSION
-- Simple and working

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

print("=== OXYX LAG HUB ===")

-- Simple Lag Function
local function CreateLag(amount)
    print("Creating lag: Level " .. amount)
    
    -- Method 1: Part Spam
    for i = 1, amount * 10 do
        spawn(function()
            local part = Instance.new("Part")
            part.Name = "LagPart_" .. i
            part.Size = Vector3.new(2,2,2)
            part.Position = Vector3.new(
                math.random(-50,50),
                math.random(5,30),
                math.random(-50,50)
            )
            part.Anchored = true
            part.CanCollide = false
            part.Transparency = 0.5
            part.Color = Color3.fromRGB(255,0,0)
            part.Parent = workspace
            
            wait(math.random(3,8))
            part:Destroy()
        end)
        wait(0.05)
    end
    
    -- Method 2: GUI Spam
    local gui = Instance.new("ScreenGui")
    gui.Name = "LagGUI"
    gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    for i = 1, amount * 5 do
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, math.random(30,100), 0, math.random(30,100))
        frame.Position = UDim2.new(0, math.random(0,500), 0, math.random(0,300))
        frame.BackgroundColor3 = Color3.fromRGB(255,0,0)
        frame.BorderSizePixel = 0
        frame.Parent = gui
    end
    
    -- Method 3: Sound Spam
    for i = 1, math.min(amount, 5) do
        spawn(function()
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://184702873"
            sound.Volume = 0.3
            sound.Parent = workspace
            sound:Play()
            wait(2)
            sound:Destroy()
        end)
        wait(0.3)
    end
end

-- Simple GUI
local function CreateLagGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LagHubGUI"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 200, 0, 250)
    mainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.fromRGB(255,0,0)
    mainFrame.Parent = screenGui
    
    local title = Instance.new("TextLabel")
    title.Text = "LAG HUB"
    title.Size = UDim2.new(1,0,0,40)
    title.TextColor3 = Color3.fromRGB(255,0,0)
    title.BackgroundColor3 = Color3.fromRGB(50,50,50)
    title.Font = Enum.Font.GothamBold
    title.Parent = mainFrame
    
    -- Lag Buttons
    local buttons = {
        {"Low Lag", 1, Color3.fromRGB(0,150,0)},
        {"Medium Lag", 2, Color3.fromRGB(200,150,0)},
        {"High Lag", 3, Color3.fromRGB(255,100,0)},
        {"Extreme Lag", 5, Color3.fromRGB(255,0,0)}
    }
    
    for i, btn in ipairs(buttons) do
        local button = Instance.new("TextButton")
        button.Text = btn[1]
        button.Size = UDim2.new(0.8,0,0,35)
        button.Position = UDim2.new(0.1,0, 0.1 + (i*0.18), 0)
        button.BackgroundColor3 = btn[3]
        button.TextColor3 = Color3.fromRGB(255,255,255)
        button.Font = Enum.Font.Gotham
        button.Parent = mainFrame
        
        button.MouseButton1Click:Connect(function()
            CreateLag(btn[2])
        end)
    end
    
    -- Clear Button
    local clearBtn = Instance.new("TextButton")
    clearBtn.Text = "Clear Lag"
    clearBtn.Size = UDim2.new(0.8,0,0,35)
    clearBtn.Position = UDim2.new(0.1,0,0.85,0)
    clearBtn.BackgroundColor3 = Color3.fromRGB(0,100,200)
    clearBtn.Parent = mainFrame
    
    clearBtn.MouseButton1Click:Connect(function()
        for _, obj in pairs(workspace:GetChildren()) do
            if obj.Name:find("Lag") then
                pcall(function() obj:Destroy() end)
            end
        end
    end)
    
    return screenGui
end

-- Auto Create GUI
wait(1)
CreateLagGUI()
print("Lag Hub GUI Created")
print("Ready to use!")
