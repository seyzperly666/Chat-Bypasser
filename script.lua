local p=game.Players.LocalPlayer
local m=p:GetMouse()
local s=Instance.new("ScreenGui")
s.Parent=p:WaitForChild("PlayerGui")

-- Base
local f=Instance.new("Frame")
f.Size=UDim2.new(0,400,0,200)
f.Position=UDim2.new(0.5,-200,0.5,-100)
f.BackgroundColor3=Color3.fromRGB(30,30,30)
f.BorderSizePixel=0
f.Parent=s
f.AnchorPoint=Vector2.new(0.5,0.5)

-- Title
local t=Instance.new("TextLabel")
t.Text="Chat Bypasser by LK-Gonna11"
t.Size=UDim2.new(1,0,0.2,0)
t.TextSize=24
t.BackgroundTransparency=1
t.TextColor3=Color3.fromRGB(255,255,255)
t.TextAlign=Enum.TextAlign.Center
t.Parent=f

-- TextBox
local x=Instance.new("TextBox")
x.Size=UDim2.new(0.9,0,0.4,0)
x.Position=UDim2.new(0.05,0,0.3,0)
x.ClearTextOnFocus=true
x.TextSize=18
x.TextColor3=Color3.fromRGB(255,255,255)
x.PlaceholderText="Enter your message here..."
x.BackgroundColor3=Color3.fromRGB(50,50,50)
x.BorderSizePixel=0
x.Parent=f

-- Send Button
local b=Instance.new("TextButton")
b.Size=UDim2.new(0.4,0,0.2,0)
b.Position=UDim2.new(0.05,0,0.75,0)
b.Text="Send"
b.TextSize=18
b.BackgroundColor3=Color3.fromRGB(0,122,255)
b.TextColor3=Color3.fromRGB(255,255,255)
b.BorderSizePixel=0
b.Parent=f

-- Clear Button
local c=Instance.new("TextButton")
c.Size=UDim2.new(0.4,0,0.2,0)
c.Position=UDim2.new(0.55,0,0.75,0)
c.Text="Clear"
c.TextSize=18
c.BackgroundColor3=Color3.fromRGB(255,59,48)
c.TextColor3=Color3.fromRGB(255,255,255)
c.BorderSizePixel=0
c.Parent=f

-- Dragging
local d=false
local r=nil
local p0=nil
f.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        d=true
        r=i.Position
        p0=f.Position
    end
end)

f.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        d=false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(i)
    if d then
        local v=i.Position-r
        f.Position=UDim2.new(p0.X.Scale,p0.X.Offset+v.X,p0.Y.Scale,p0.Y.Offset+v.Y)
    end
end)

-- Send function
b.MouseButton1Click:Connect(function()
    local m=x.Text
    if m~="" then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(m,"All")
        print("Message sent: "..m)
        x.Text=""
    end
end)

-- Clear function
c.MouseButton1Click:Connect(function()
    x.Text=""
end)
