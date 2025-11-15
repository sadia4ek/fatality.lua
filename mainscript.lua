print("atached")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
print("attempt menu load")

local Window = Rayfield:CreateWindow({
   Name = "fatality.lua",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading fatality",
   LoadingSubtitle = "by sadia4ek",
   ShowText = "fatality", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "fatality.lua"
   },
   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Fatality subscription check",
      Subtitle = "Subscription check",
      Note = "For buy subscription: t.me/pyzatui", -- Use this to tell the user how to get a key
      FileName = "fatalityluasub", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"FATALITYSUB-14886967"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- tabs
local Tab = Window:CreateTab("Player", "rewind") 
local Tab = Window:CreateTab("Anti-Aim", "rewind") 
local Tab = Window:CreateTab("Aim", "rewind") 
local Tab = Window:CreateTab("Misc", "rewind") 
local Tab = Window:CreateTab("Visuals", "rewind") 
local Tab = Window:CreateTab("Info", "rewind") 


























