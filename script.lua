local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "CANDY BLOSSOM SPANWER",
   Icon = 0,
   LoadingTitle = "SPAWNER",
   LoadingSubtitle = "by CODE PHANTOM",
   Theme = "Default", 

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("SPAWNER", 4483362458) 
local Button = Tab:CreateButton({
   Name = "SPAWN CANDY BLOSSOM (RAINBOW)",
   Callback = function()
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local RunService = game:GetService("RunService")

local InventoryService = require(ServerScriptService.Modules.InventoryService)

local SeedVariants = { "Normal", "Gold", "Rainbow" }

local function Give_Seed(player, seedName, quantity, variant)
    assert(RunService:IsServer(), "Give_Seed must be called on the server!")

    quantity = (type(quantity) == "number" and quantity > 0) and quantity or 1
    variant = variant or "Normal"

    if not table.find(SeedVariants, variant) then
        warn(`Invalid variation given in Give_Seed, got "{variant}"\n{debug.traceback()}`)
        return
    end

    if not ServerStorage:FindFirstChild("Seed_Models"):FindFirstChild(seedName) then
        warn(`Seed "{seedName}" does not exist\n{debug.traceback()}`)
        return
    end

    local foundKey, foundItem = next(InventoryService:Find(player, "Seed", function(item)
        return item.ItemName == seedName and item.Variant == variant
    end))

    if foundItem then
        foundItem.ItemData.Quantity += quantity
    else
        local newItem = {
            ItemName = seedName,
            Quantity = quantity,
            Variant = variant
        }
        InventoryService:CreateItem(player, "Seed", newItem)
    end
end

ReplicatedStorage:WaitForChild("GiveSeedEvent").OnServerEvent:Connect(function(player)
    Give_Seed(player, "Candy Blossom", 1, "Rainbow")
end)
   end,
})
