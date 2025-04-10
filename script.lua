local _0x01 = game.Players.LocalPlayer
local _0x02 = Instance.new("ScreenGui")
_0x02.Parent = _0x01:WaitForChild("PlayerGui")

local _0x03 = Instance.new("Frame")
_0x03.Size = UDim2.new(0, 400, 0, 250)
_0x03.Position = UDim2.new(0.5, -200, 0.5, -125)
_0x03.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
_0x03.BorderSizePixel = 0
_0x03.Parent = _0x02
_0x03.AnchorPoint = Vector2.new(0.5, 0.5)

local _0x04 = Instance.new("TextLabel")
_0x04.Text = "Chat Bypasser by LK-Gonna11"
_0x04.Size = UDim2.new(1, 0, 0.2, 0)
_0x04.TextSize = 24
_0x04.BackgroundTransparency = 1
_0x04.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x04.TextAlign = Enum.TextAlign.Center
_0x04.Parent = _0x03

local _0x05 = Instance.new("TextBox")
_0x05.Size = UDim2.new(0.9, 0, 0.4, 0)
_0x05.Position = UDim2.new(0.05, 0, 0.3, 0)
_0x05.ClearTextOnFocus = true
_0x05.TextSize = 18
_0x05.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x05.PlaceholderText = "Enter your message here..."
_0x05.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
_0x05.BorderSizePixel = 0
_0x05.Parent = _0x03

local _0x06 = Instance.new("TextButton")
_0x06.Size = UDim2.new(0.4, 0, 0.2, 0)
_0x06.Position = UDim2.new(0.05, 0, 0.75, 0)
_0x06.Text = "Send"
_0x06.TextSize = 18
_0x06.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
_0x06.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x06.BorderSizePixel = 0
_0x06.Parent = _0x03

local _0x07 = Instance.new("TextButton")
_0x07.Size = UDim2.new(0.4, 0, 0.2, 0)
_0x07.Position = UDim2.new(0.55, 0, 0.75, 0)
_0x07.Text = "Clear"
_0x07.TextSize = 18
_0x07.BackgroundColor3 = Color3.fromRGB(255, 59, 48)
_0x07.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x07.BorderSizePixel = 0
_0x07.Parent = _0x03

local _0x08 = Instance.new("TextButton")
_0x08.Size = UDim2.new(0.1, 0, 0.1, 0)
_0x08.Position = UDim2.new(0.9, -30, 0.1, 0)
_0x08.Text = "X"
_0x08.TextSize = 18
_0x08.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
_0x08.TextColor3 = Color3.fromRGB(255, 255, 255)
_0x08.BorderSizePixel = 0
_0x08.Parent = _0x03

local _0x09 = game:GetService("ReplicatedStorage")
local _0x0A = _0x09.DefaultChatSystemChatEvents.SayMessageRequest

_0x06.MouseButton1Click:Connect(function()
    local _0x0B = _0x05.Text
    if _0x0B ~= "" then
        _0x0A:FireServer(_0x0B, "All")
        _0x05.Text = ""
    end
end)

_0x07.MouseButton1Click:Connect(function()
    _0x05.Text = ""
end)

_0x08.MouseButton1Click:Connect(function()
    _0x02:Destroy()
end)
