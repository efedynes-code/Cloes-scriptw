-- Cloes Multi-Game Menu | By Cloes
-- Mobile + PC Uyumlu

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "CLOES MENU",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "By Cloes",
   ConfigurationSaving = {Enabled = true, FolderName = "Cloes", FileName = "MultiGame"},
   KeySystem = false
})

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local camera = workspace.CurrentCamera

-- ============================================
-- ARSENAL SEKMESİ
-- ============================================
local ArsenalTab = Window:CreateTab("Arsenal", 4483362458)

ArsenalTab:CreateSection("Aimbot")

local aimbotOn = false
ArsenalTab:CreateToggle({
   Name = "Aimbot",
   CurrentValue = false,
   Flag = "ArsenalAimbot",
   Callback = function(Value) aimbotOn = Value end,
})

RunService.RenderStepped:Connect(function()
   if aimbotOn then
       local closest = nil
       local dist = math.huge
       for _, v in pairs(game.Players:GetPlayers()) do
           if v ~= player and v.Character and v.Character:FindFirstChild("Head") then
               local d = (v.Character.Head.Position - camera.CFrame.Position).Magnitude
               if d < dist then dist = d; closest = v.Character.Head end
           end
       end
       if closest then camera.CFrame = CFrame.new(camera.CFrame.Position, closest.Position) end
   end
end)

ArsenalTab:CreateSection("Visual")

ArsenalTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "ArsenalESP",
   Callback = function(Value)
       if Value then
           for _, v in pairs(game.Players:GetPlayers()) do
               if v ~= player and v.Character then
                   local h = Instance.new("Highlight")
                   h.Parent = v.Character
                   h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                   h.FillColor = Color3.fromRGB(255, 0, 0)
                   h.OutlineColor = Color3.fromRGB(255, 255, 255)
               end
           end
       else
           for _, v in pairs(game.Players:GetPlayers()) do
               if v.Character and v.Character:FindFirstChildOfClass("Highlight") then
                   v.Character:FindFirstChildOfClass("Highlight"):Destroy()
               end
           end
       end
   end,
})

ArsenalTab:CreateSection("Movement")

ArsenalTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 200},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "ArsenalSpeed",
   Callback = function(Value) humanoid.WalkSpeed = Value end,
})

-- ============================================
-- DA HOOD SEKMESİ
-- ============================================
local DaHoodTab = Window:CreateTab("Da Hood", 4483362458)

DaHoodTab:CreateSection("Movement")

DaHoodTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 200},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "DaHoodSpeed",
   Callback = function(Value) humanoid.WalkSpeed = Value end,
})

DaHoodTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "DaHoodJump",
   Callback = function(Value)
       if Value then
           UIS.JumpRequest:Connect(function()
               humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
           end)
       end
   end,
})

DaHoodTab:CreateSection("Visual")

DaHoodTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "DaHoodESP",
   Callback = function(Value)
       if Value then
           for _, v in pairs(game.Players:GetPlayers()) do
               if v ~= player and v.Character then
                   local h = Instance.new("Highlight")
                   h.Parent = v.Character
                   h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                   h.FillColor = Color3.fromRGB(255, 100, 0)
                   h.OutlineColor = Color3.fromRGB(255, 255, 255)
               end
           end
       else
           for _, v in pairs(game.Players:GetPlayers()) do
               if v.Character and v.Character:FindFirstChildOfClass("Highlight") then
                   v.Character:FindFirstChildOfClass("Highlight"):Destroy()
               end
           end
       end
   end,
})

-- ============================================
-- BLOX FRUITS SEKMESİ
-- ============================================
local BloxTab = Window:CreateTab("Blox Fruits", 4483362458)

BloxTab:CreateSection("Auto Farm")

local bloxFarmOn = false
BloxTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "BloxFarm",
   Callback = function(Value)
       bloxFarmOn = Value
       if Value then
           task.spawn(function()
               while bloxFarmOn do
                   task.wait(0.5)
                   for _, v in pairs(workspace:GetChildren()) do
                       if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                           if v.Name ~= player.Name then
                               root.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                           end
                       end
                   end
               end
           end)
       end
   end,
})

BloxTab:CreateSection("Movement")

BloxTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "BloxSpeed",
   Callback = function(Value) humanoid.WalkSpeed = Value end,
})

BloxTab:CreateSection("Combat")

BloxTab:CreateToggle({
   Name = "Auto Attack",
   CurrentValue = false,
   Flag = "BloxAttack",
   Callback = function(Value)
       if Value then
           task.spawn(function()
               while Value do
                   task.wait(0.3)
                   local tool = char:FindFirstChildOfClass("Tool")
                   if tool then tool:Activate() end
               end
           end)
       end
   end,
})

-- ============================================
-- PET SIM 99 SEKMESİ
-- ============================================
local PetTab = Window:CreateTab("Pet Sim 99", 4483362458)

PetTab:CreateSection("Auto")

local petFarmOn = false
PetTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "PetFarm",
   Callback = function(Value)
       petFarmOn = Value
       if Value then
           task.spawn(function()
               while petFarmOn do
                   task.wait(0.5)
                   for _, v in pairs(workspace:GetDescendants()) do
                       if v:IsA("BasePart") and (v.Name:lower():find("coin") or v.Name:lower():find("breakable")) then
                           root.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                       end
                   end
               end
           end)
       end
   end,
})

PetTab:CreateButton({
   Name = "Auto Hatch Eggs",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("egg") and v:IsA("BasePart") then
               root.CFrame = v.CFrame + Vector3.new(0, 3, 0)
           end
       end
   end,
})

-- ============================================
-- MM2 SEKMESİ
-- ============================================
local MM2Tab = Window:CreateTab("MM2", 4483362458)

MM2Tab:CreateSection("General")

MM2Tab:CreateButton({
   Name = "Coin Farm",
   Callback = function()
       task.spawn(function()
           while true do
               task.wait(0.3)
               for _, v in pairs(workspace:GetDescendants()) do
                   if v:IsA("BasePart") or v:IsA("MeshPart") then
                       local n = v.Name:lower()
                       if n:find("coin") or n:find("cash") then
                           root.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                           task.wait(0.1)
                       end
                   end
               end
           end
       end)
   end,
})

MM2Tab:CreateButton({
   Name = "Kill All (Murder Only)",
   Callback = function()
       for _, v in pairs(game.Players:GetPlayers()) do
           if v ~= player and v.Character and v.Character:FindFirstChild("Humanoid") then
               if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
                   v.Character.Humanoid.Health = 0
               end
           end
       end
   end,
})

MM2Tab:CreateToggle({
   Name = "Auto Shout (Sheriff Only)",
   CurrentValue = false,
   Flag = "AutoShout",
   Callback = function(Value)
       if Value then
           task.spawn(function()
               while Value do
                   task.wait(2)
                   local isSheriff = false
                   if player.Character and (player.Character:FindFirstChild("Gun") or player.Character:FindFirstChild("Revolver")) then
                       isSheriff = true
                   end
                   if not isSheriff and player.Backpack and (player.Backpack:FindFirstChild("Gun") or player.Backpack:FindFirstChild("Revolver")) then
                       isSheriff = true
                   end
                   if isSheriff then
                       local murderName = "None"
                       for _, v in pairs(game.Players:GetPlayers()) do
                           if v ~= player and v.Character then
                               local hasKnife = false
                               if v.Character:FindFirstChild("Knife") then hasKnife = true end
                               if v.Backpack and v.Backpack:FindFirstChild("Knife") then hasKnife = true end
                               if hasKnife then murderName = v.Name end
                           end
                       end
                       local chatEvent = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
                       if chatEvent and chatEvent:FindFirstChild("SayMessageRequest") then
                           chatEvent.SayMessageRequest:FireServer("Murder: " .. murderName, "All")
                       else
                           game:GetService("ReplicatedStorage").SayMessageRequest:FireServer("Murder: " .. murderName, "All")
                       end
                   end
               end
           end)
       end
   end,
})

MM2Tab:CreateToggle({
   Name = "Wall Shots (Sheriff Only)",
   CurrentValue = false,
   Flag = "WallShots",
   Callback = function(Value)
       if Value then
           task.spawn(function()
               while Value do
                   task.wait(0.1)
                   for _, v in pairs(game.Players:GetPlayers()) do
                       if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                           local args = {v.Character.HumanoidRootPart}
                           game:GetService("ReplicatedStorage").ShootGun:FireServer(unpack(args))
                       end
                   end
               end
           end)
       end
   end,
})

MM2Tab:CreateSection("ESP")

MM2Tab:CreateToggle({
   Name = "ESP (Renkli)",
   CurrentValue = false,
   Flag = "ESPMM2",
   Callback = function(Value)
       if Value then
           for _, v in pairs(game.Players:GetPlayers()) do
               if v ~= player and v.Character then
                   local h = Instance.new("Highlight")
                   h.Parent = v.Character
                   h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                   h.OutlineColor = Color3.fromRGB(255, 255, 255)
                   h.FillTransparency = 0.5
                   local hasKnife = false
                   local hasGun = false
                   if v.Character:FindFirstChild("Knife") then hasKnife = true end
                   if v.Character:FindFirstChild("Gun") or v.Character:FindFirstChild("Revolver") then hasGun = true end
                   if v.Backpack then
                       if v.Backpack:FindFirstChild("Knife") then hasKnife = true end
                       if v.Backpack:FindFirstChild("Gun") or v.Backpack:FindFirstChild("Revolver") then hasGun = true end
                   end
                   if hasKnife then
                       h.FillColor = Color3.fromRGB(255, 0, 0)
                   elseif hasGun then
                       h.FillColor = Color3.fromRGB(0, 100, 255)
                   else
                       h.FillColor = Color3.fromRGB(0, 255, 0)
                   end
               end
           end
       else
           for _, v in pairs(game.Players:GetPlayers()) do
               if v.Character and v.Character:FindFirstChildOfClass("Highlight") then
                   v.Character:FindFirstChildOfClass("Highlight"):Destroy()
               end
           end
       end
   end,
})

MM2Tab:CreateSection("Teleport")

MM2Tab:CreateButton({
   Name = "Current Map",
   Callback = function()
       for _, v in pairs(workspace:GetChildren()) do
           if v:FindFirstChild("TeleportPart") then
               root.CFrame = v.TeleportPart.CFrame
               break
           end
       end
   end,
})

MM2Tab:CreateButton({
   Name = "Lobby",
   Callback = function()
       for _, v in pairs(workspace:GetChildren()) do
           if v.Name:lower():find("lobby") then
               root.CFrame = v.CFrame + Vector3.new(0, 10, 0)
               break
           end
       end
   end,
})

-- ============================================
-- MUSCLE LEGENDS SEKMESİ
-- ============================================
local MLTab = Window:CreateTab("Muscle Legends", 4483362458)

MLTab:CreateSection("Auto")

MLTab:CreateToggle({
   Name = "Auto Dumbbell",
   CurrentValue = false,
   Flag = "AutoDambil",
   Callback = function(Value)
       if Value then
           task.spawn(function()
               while Value do
                   task.wait(1)
                   game:GetService("ReplicatedStorage").Events.Dambil:FireServer(true)
               end
           end)
       end
   end,
})

MLTab:CreateToggle({
   Name = "Auto Pushup",
   CurrentValue = false,
   Flag = "AutoSinav",
   Callback = function(Value)
       if Value then
           task.spawn(function()
               while Value do
                   task.wait(1)
                   game:GetService("ReplicatedStorage").Events.Sinav:FireServer(true)
               end
           end)
       end
   end,
})

MLTab:CreateToggle({
   Name = "Auto Situp",
   CurrentValue = false,
   Flag = "AutoMekik",
   Callback = function(Value)
       if Value then
           task.spawn(function()
               while Value do
                   task.wait(1)
                   game:GetService("ReplicatedStorage").Events.Mekik:FireServer(true)
               end
           end)
       end
   end,
})

MLTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "AutoRebirth",
   Callback = function(Value)
       if Value then
           task.spawn(function()
               while Value do
                   task.wait(2)
                   game:GetService("ReplicatedStorage").Events.Rebirth:FireServer()
               end
           end)
       end
   end,
})

MLTab:CreateSection("Teleport")

MLTab:CreateButton({
   Name = "Safe Zone",
   Callback = function() root.CFrame = CFrame.new(0, 100, 0) end,
})

-- ============================================
-- UNIVERSAL SEKMESİ (Her oyunda çalışır)
-- ============================================
local UniTab = Window:CreateTab("Universal", 4483362458)

UniTab:CreateSection("Visual")

UniTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "UniESP",
   Callback = function(Value)
       if Value then
           for _, v in pairs(game.Players:GetPlayers()) do
               if v ~= player and v.Character then
                   local h = Instance.new("Highlight")
                   h.Parent = v.Character
                   h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                   h.FillColor = Color3.fromRGB(255, 0, 0)
                   h.OutlineColor = Color3.fromRGB(255, 255, 255)
               end
           end
       else
           for _, v in pairs(game.Players:GetPlayers()) do
               if v.Character and v.Character:FindFirstChildOfClass("Highlight") then
                   v.Character:FindFirstChildOfClass("Highlight"):Destroy()
               end
           end
       end
   end,
})

UniTab:CreateToggle({
   Name = "Fullbright",
   CurrentValue = false,
   Flag = "UniBright",
   Callback = function(Value)
       if Value then
           game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
           game.Lighting.Brightness = 2
           game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
       else
           game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
           game.Lighting.Brightness = 1
           game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
       end
   end,
})

UniTab:CreateSection("Movement")

UniTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "UniSpeed",
   Callback = function(Value) humanoid.WalkSpeed = Value end,
})

UniTab:CreateToggle({
   Name = "Anti-AFK",
   CurrentValue = false,
   Flag = "UniAFK",
   Callback = function(Value)
       if Value then
           player.Idled:Connect(function()
               game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0))
               task.wait(1)
               game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0))
           end)
       end
   end,
})

-- ============================================
-- BYPASS SEKMESİ
-- ============================================
local BypassTab = Window:CreateTab("Bypass", 4483362458)

BypassTab:CreateToggle({
   Name = "Anti-Cheat Bypass",
   CurrentValue = false,
   Flag = "Bypass",
   Callback = function(Value)
       if Value then
           local mt = getrawmetatable(game)
           local oldNamecall = mt.__namecall
           setreadonly(mt, false)
           mt.__namecall = newcclosure(function(self, ...)
               local method = getnamecallmethod()
               if method == "Kick" then return nil end
               return oldNamecall(self, ...)
           end)
           setreadonly(mt, true)
       end
   end,
})

-- ============================================
-- ABOUT SEKMESİ
-- ============================================
Window:CreateTab("About", 4483362458):CreateParagraph({
   Title = "CLOES MENU",
   Content = "Bu script Cloes tarafından yapılmıştır. By Cloes. Mobil + PC uyumlu."
})

Rayfield:Notify({
   Title = "CLOES MENU",
   Content = "Menu loaded! By Cloes",
   Duration = 5,
   Image = 4483362458,
})

print("Cloes Multi-Game Menu loaded. By Cloes.")
