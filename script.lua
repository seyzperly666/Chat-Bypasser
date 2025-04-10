local p=game.Players.LocalPlayer
local m=p:GetMouse()
local s=Instance.new("ScreenGui")
s.Parent=p:WaitForChild("PlayerGui")
local f=Instance.new("Frame")
f.Size=UDim2.new(0,400,0,200)
f.Position=UDim2.new(0.5,-200,0.5,-100)
f.BackgroundColor3=Color3.fromRGB(30,30,30)
f.BorderSizePixel=0
f.Parent=s
f.AnchorPoint=Vector2.new(0.5,0.5)
local t=Instance.new("TextLabel")
t.Text="Chat Bypasser by Melouxis"
t.Size=UDim2.new(1,0,0.2,0)
t.TextSize=24
t.BackgroundTransparency=1
t.TextColor3=Color3.fromRGB(255,255,255)
t.TextAlign=Enum.TextAlign.Center
t.Parent=f
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
local b=Instance.new("TextButton")
b.Size=UDim2.new(0.4,0,0.2,0)
b.Position=UDim2.new(0.05,0,0.75,0)
b.Text="Send"
b.TextSize=18
b.BackgroundColor3=Color3.fromRGB(0,122,255)
b.TextColor3=Color3.fromRGB(255,255,255)
b.BorderSizePixel=0
b.Parent=f
local c=Instance.new("TextButton")
c.Size=UDim2.new(0.4,0,0.2,0)
c.Position=UDim2.new(0.55,0,0.75,0)
c.Text="Clear"
c.TextSize=18
c.BackgroundColor3=Color3.fromRGB(255,59,48)
c.TextColor3=Color3.fromRGB(255,255,255)
c.BorderSizePixel=0
c.Parent=f
local d=false
local y=nil
local z=nil
f.InputBegan:Connect(function(a)
    if a.UserInputType==Enum.UserInputType.MouseButton1 then
        d=true
        y=a.Position
        z=f.Position
    end
end)
f.InputEnded:Connect(function(a)
    if a.UserInputType==Enum.UserInputType.MouseButton1 then
        d=false
    end
end)
game:GetService("UserInputService").InputChanged:Connect(function(a)
    if d then
        local b=a.Position-y
        f.Position=UDim2.new(z.X.Scale,z.X.Offset+b.X,z.Y.Scale,z.Y.Offset+b.Y)
    end
end)
b.MouseButton1Click:Connect(function()
    local a=x.Text
    if a~="" then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(a,"All")
        x.Text=""
    end
end)
c.MouseButton1Click:Connect(function()
    x.Text=""
end)
local q=Instance.new("TextButton")
q.Size=UDim2.new(0.1,0,0.1,0)
q.Position=UDim2.new(0.9,-30,0.1,0)
q.Text="X"
q.TextSize=18
q.BackgroundColor3=Color3.fromRGB(255,0,0)
q.TextColor3=Color3.fromRGB(255,255,255)
q.BorderSizePixel=0
q.Parent=f
q.MouseButton1Click:Connect(function()
    s:Destroy()
end)
s.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui")
