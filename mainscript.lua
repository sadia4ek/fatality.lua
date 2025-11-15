local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
Rayfield:Notify({
	Title = "Loading",
	Content = "Loading fatality.lua",
	Duration = 4
})

local Window = Rayfield:CreateWindow({
   Name = "fatality.lua",
   Icon = 0,
   LoadingTitle = "Loading fatality",
   LoadingSubtitle = "by sadia4ek",
   ShowText = "fatality", 
   Theme = "DarkBlue", 
   ToggleUIKeybind = "K", 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = fatality,lua, 
      FileName = "fatalitycfg.lua"
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

-- tabs
local plrtab = Window:CreateTab("Player", "rewind") 
local aatab = Window:CreateTab("Anti-Aim", "rewind") 
local aimtab = Window:CreateTab("Aim", "rewind") 
local misctab = Window:CreateTab("Misc", "rewind") 
local visaulstab = Window:CreateTab("Visuals", "rewind") 
local infotab = Window:CreateTab("Info", "rewind") 

local changewalkksped = plrtab:CreateSlider({
    Name = "Change Walkspeed",
    Range = {1, 125},
    Increment = 1,
    Suffix = "Walkspeed",
    CurrentValue = 16,
    Flag = "wlksc",
    Callback = function(Value)
        local plrs = game:GetService("Players")
        local plr = plrs.LocalPlayer
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
        local plrs = game:GetService("Players")
        local plr = plrs.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.JumpPower = Value
        end
    end,
})




























