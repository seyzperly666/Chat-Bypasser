local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui
frame.AnchorPoint = Vector2.new(0.5, 0.5)

local title = Instance.new("TextLabel")
title.Text = "Chat Bypasser by Melouxis"
title.Size = UDim2.new(1, 0, 0.2, 0)
title.TextSize = 24
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextAlign = Enum.TextAlign.Center
title.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.9, 0, 0.4, 0)
textBox.Position = UDim2.new(0.05, 0, 0.3, 0)
textBox.ClearTextOnFocus = true
textBox.TextSize = 18
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.PlaceholderText = "Enter your message here..."
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.BorderSizePixel = 0
textBox.Parent = frame

local sendButton = Instance.new("TextButton")
sendButton.Size = UDim2.new(0.4, 0, 0.2, 0)
sendButton.Position = UDim2.new(0.05, 0, 0.75, 0)
sendButton.Text = "Send"
sendButton.TextSize = 18
sendButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
sendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
sendButton.BorderSizePixel = 0
sendButton.Parent = frame

local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(0.4, 0, 0.2, 0)
clearButton.Position = UDim2.new(0.55, 0, 0.75, 0)
clearButton.Text = "Clear"
clearButton.TextSize = 18
clearButton.BackgroundColor3 = Color3.fromRGB(255, 59, 48)
clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
clearButton.BorderSizePixel = 0
clearButton.Parent = frame

local isDragging = false
local dragStart = nil
local initialPosition = nil
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
        initialPosition = frame.Position
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if isDragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(initialPosition.X.Scale, initialPosition.X.Offset + delta.X, initialPosition.Y.Scale, initialPosition.Y.Offset + delta.Y)
    end
end)

sendButton.MouseButton1Click:Connect(function()
    local message = textBox.Text
    if message ~= "" then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        textBox.Text = ""
    end
end)

clearButton.MouseButton1Click:Connect(function()
    textBox.Text = ""
end)

-- Croissance de la croix pour fermer l'interface
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.9, -30, 0.1, 0)
closeButton.Text = "X"
closeButton.TextSize = 18
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BorderSizePixel = 0
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Pour tester l'affichage
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
