local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

wait(1)

Rayfield:Notify({
    Title = "Loading",
    Content = "Loading fatality.lua",
    Duration = 4
})

local Window = Rayfield:CreateWindow({
   Name = "fatality.lua",
   LoadingTitle = "Loading fatality",
   LoadingSubtitle = "by sadia4ek",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "fatality_lua",
      FileName = "fatalitycfg"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Fatality subscription check",
      Subtitle = "Subscription check",
      Note = "For buy subscription: t.me/pyzatui",
      FileName = "fatalityluasub",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"FATALITYSUB-14886967"}
   }
})

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local plrtab = Window:CreateTab("Player") 
local aatab = Window:CreateTab("Anti-Aim") 
local aimtab = Window:CreateTab("Aim") 
local misctab = Window:CreateTab("Misc") 
local visaulstab = Window:CreateTab("Visuals") 
local infotab = Window:CreateTab("Info") 

local desyncT = {enabled = false, loc = CFrame.new()}
local prevLookVector = nil
local isSpinning = false
local spinThreshold = 15

local desyncSettings = {
    customEnabled = false,
    offsetX = 0,
    offsetY = 0,
    offsetZ = -2,
    autoPause = true
}

local changewalkksped = plrtab:CreateSlider({
    Name = "Change Walkspeed",
    Range = {1, 125},
    Increment = 1,
    Suffix = "Walkspeed",
    CurrentValue = 16,
    Flag = "wlksc",
    Callback = function(Value)
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end,
})

local changejumpheit = plrtab:CreateSlider({
    Name = "Change Jump Height",
    Range = {1, 125},
    Increment = 1,
    Suffix = "Jump Height",
    CurrentValue = 16,
    Flag = "jh",
    Callback = function(Value)
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = Value
        end
    end,
})

misctab:CreateSection("Desync")

local DesyncToggle = misctab:CreateToggle({
    Name = "Desync Enabled",
    CurrentValue = false,
    Flag = "DesyncToggle",
    Callback = function(Value)
        desyncT.enabled = Value
    end,
})

local DesyncKeybind = misctab:CreateKeybind({
    Name = "Desync Toggle Keybind",
    CurrentKeybind = "C",
    HoldToInteract = false,
    Flag = "DesyncKeybind",
    Callback = function(Keybind)
        desyncT.enabled = not desyncT.enabled
        DesyncToggle:Set(desyncT.enabled)
    end,
})

local CustomDesyncToggle = misctab:CreateToggle({
    Name = "Custom Desync Offset",
    CurrentValue = false,
    Flag = "CustomDesyncToggle",
    Callback = function(Value)
        desyncSettings.customEnabled = Value
    end,
})

local OffsetXSlider = misctab:CreateSlider({
    Name = "Offset X",
    Range = {-10, 10},
    Increment = 0.1,
    Suffix = "studs",
    CurrentValue = 0,
    Flag = "OffsetX",
    Callback = function(Value)
        desyncSettings.offsetX = Value
    end,
})

local OffsetYSlider = misctab:CreateSlider({
    Name = "Offset Y",
    Range = {-10, 10},
    Increment = 0.1,
    Suffix = "studs",
    CurrentValue = 0,
    Flag = "OffsetY",
    Callback = function(Value)
        desyncSettings.offsetY = Value
    end,
})

local OffsetZSlider = misctab:CreateSlider({
    Name = "Offset Z",
    Range = {-10, 10},
    Increment = 0.1,
    Suffix = "studs",
    CurrentValue = -2,
    Flag = "OffsetZ",
    Callback = function(Value)
        desyncSettings.offsetZ = Value
    end,
})

local AutoPauseToggle = misctab:CreateToggle({
    Name = "Auto Pause When Spinning",
    CurrentValue = true,
    Flag = "AutoPauseToggle",
    Callback = function(Value)
        desyncSettings.autoPause = Value
    end,
})

local SpinThresholdSlider = misctab:CreateSlider({
    Name = "Spin Detection Threshold",
    Range = {5, 45},
    Increment = 1,
    Suffix = "degrees",
    CurrentValue = 15,
    Flag = "SpinThreshold",
    Callback = function(Value)
        spinThreshold = Value
    end,
})

local function getOffsetCFrame()
    if desyncSettings.customEnabled then
        return CFrame.new(desyncSettings.offsetX, desyncSettings.offsetY, desyncSettings.offsetZ)
    else
        local ping = LocalPlayer:GetNetworkPing() * 1000
        if ping < 100 then return CFrame.new(0, 0, -2)
        elseif ping <= 170 then return CFrame.new(0, 0, -2.7)
        else return CFrame.new(0, 0, -3.7) end
    end
end

RunService.Heartbeat:Connect(function()
    if not desyncT.enabled or not LocalPlayer.Character then return end
    
    local character = LocalPlayer.Character
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    if desyncSettings.autoPause then
        local currentLook = root.CFrame.LookVector
        if prevLookVector then
            local dot = math.clamp(prevLookVector:Dot(currentLook), -1, 1)
            local angleDiff = math.deg(math.acos(dot))
            isSpinning = angleDiff > spinThreshold
        end
        prevLookVector = currentLook
        
        if isSpinning then return end
    end
    
    desyncT.loc = root.CFrame
    
    local offset = getOffsetCFrame()
    local newCFrame = desyncT.loc * offset
    root.CFrame = newCFrame
    
    RunService.RenderStepped:Wait()
    root.CFrame = desyncT.loc
end)

local desynchook = nil
desynchook = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if desyncT.enabled and not checkcaller() and 
       key == "CFrame" and 
       LocalPlayer.Character and 
       self == LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
       not (desyncSettings.autoPause and isSpinning) then
        return desyncT.loc
    end
    return desynchook(self, key)
end))
