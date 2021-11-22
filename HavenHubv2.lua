--[[
All future updates will be on https://github.com/qertyuiop12345678?tab=repositories
This account is more of a throwaway account, as it can be easily compromised, so please don't trust this account.
]]
game:GetService("StarterGui"):SetCore("SendNotification",{     
Title = "Info",     
Text = "We re-wrote our GUI, so sorry if some sections like credits are missing.",
Button1 = "Ok",
Duration = 60
})

game:GetService("StarterGui"):SetCore("SendNotification",{     
Title = "Info",     
Text = "Created by HavenRBX on YouTube.",
Button1 = "Ok",
Duration = 60
})


if game.CoreGui:FindFirstChild("Library") then
    game.CoreGui:FindFirstChild("Library"):Destroy()
  end   
  local VLib = {RainbowColorValue = 0, HueSelectionPosition = 0}
  local UserInputService = game:GetService("UserInputService")
  local TweenService = game:GetService("TweenService")
  local RunService = game:GetService("RunService")
  local LocalPlayer = game:GetService("Players").LocalPlayer
  local Mouse = LocalPlayer:GetMouse()
  
  
  coroutine.wrap(
   function()
      while wait() do
         VLib.RainbowColorValue = VLib.RainbowColorValue + 1 / 255
         VLib.HueSelectionPosition = VLib.HueSelectionPosition + 1
  
         if VLib.RainbowColorValue >= 1 then
            VLib.RainbowColorValue = 0
         end
  
         if VLib.HueSelectionPosition == 80 then
            VLib.HueSelectionPosition = 0
         end
      end
   end
  )()
  
  local function MakeDraggable(topbarobject, object)
   local Dragging = nil
   local DragInput = nil
   local DragStart = nil
   local StartPosition = nil
  
   local function Update(input)
      local Delta = input.Position - DragStart
      local pos =
         UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
         )
      local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
      Tween:Play()
   end
  
   topbarobject.InputBegan:Connect(
      function(input)
         if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            DragStart = input.Position
            StartPosition = object.Position
  
            input.Changed:Connect(
               function()
                  if input.UserInputState == Enum.UserInputState.End then
                     Dragging = false
                  end
               end
            )
         end
      end
   )
  
   topbarobject.InputChanged:Connect(
      function(input)
         if
            input.UserInputType == Enum.UserInputType.MouseMovement or
               input.UserInputType == Enum.UserInputType.Touch
         then
            DragInput = input
         end
      end
   )
  
   UserInputService.InputChanged:Connect(
      function(input)
         if input == DragInput and Dragging then
            Update(input)
         end
      end
   )
  end
  
  local Library = Instance.new("ScreenGui")
  Library.Name = "Library"
  Library.Parent =  game.CoreGui
  Library.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  
  local uitoggled = false
  UserInputService.InputBegan:Connect(
   function(io, p)
      if io.KeyCode == Enum.KeyCode.RightControl then
         if uitoggled == false then
            Library.Enabled = false
            uitoggled = true
         else
            Library.Enabled = true
            uitoggled = false
         end
      end
   end
  )
  
  function VLib:Window(text, textgame, textcircle)
   local FirstTab = false
   local MainFrame = Instance.new("Frame")
   local MainCorner = Instance.new("UICorner")
   local LeftFrame = Instance.new("Frame")
   local LeftFrameCorner = Instance.new("UICorner")
   local MainTitle = Instance.new("TextLabel")
   local Circle = Instance.new("Frame")
   local CircleCorner = Instance.new("UICorner")
   local CircleName = Instance.new("TextLabel")
   local GameTitle = Instance.new("TextLabel")
   local TabHolder = Instance.new("Frame")
   local TabHoldLayout = Instance.new("UIListLayout")
   local RainbowLine = Instance.new("Frame")
   local RainbowLineCorner = Instance.new("UICorner")
   local ContainerHold = Instance.new("Folder")
   local DragFrame = Instance.new("Frame")
   local Glow = Instance.new("ImageLabel")
  
   MainFrame.Name = "MainFrame"
   MainFrame.Parent = Library
   MainFrame.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
   MainFrame.Position = UDim2.new(0.5, -325, 0.5, -250)
   MainFrame.Size = UDim2.new(0, 650, 0, 500)
  
   MainCorner.CornerRadius = UDim.new(0, 5)
   MainCorner.Name = "MainCorner"
   MainCorner.Parent = MainFrame
  
   LeftFrame.Name = "LeftFrame"
   LeftFrame.Parent = MainFrame
   LeftFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
   LeftFrame.Position = UDim2.new(-0.000674468291, 0, -0.000149806539, 0)
   LeftFrame.Size = UDim2.new(0, 190, 0, 500)
  
   LeftFrameCorner.CornerRadius = UDim.new(0, 5)
   LeftFrameCorner.Name = "LeftFrameCorner"
   LeftFrameCorner.Parent = LeftFrame
  
   MainTitle.Name = "MainTitle"
   MainTitle.Parent = LeftFrame
   MainTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   MainTitle.BackgroundTransparency = 1.000
   MainTitle.Position = UDim2.new(0.168, 0, 0.043, 0)
   MainTitle.Size = UDim2.new(0, 71, 0, 20)
   MainTitle.Font = Enum.Font.Gotham 
   MainTitle.Text = text
   MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   MainTitle.TextSize = 25.000
   MainTitle.TextXAlignment = Enum.TextXAlignment.Left
  
  
   GameTitle.Name = "GameTitle"
   GameTitle.Parent = LeftFrame
   GameTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   GameTitle.BackgroundTransparency = 1.000
   GameTitle.Position = UDim2.new(0.168, 0, 0.089, 6)
   GameTitle.Size = UDim2.new(0, 71, 0, 20)
   GameTitle.Font = Enum.Font.Gotham
   GameTitle.Text = textgame
   GameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   GameTitle.TextSize = 17.000
   GameTitle.TextTransparency = 0.400
   GameTitle.TextXAlignment = Enum.TextXAlignment.Left
  
   TabHolder.Name = "TabHolder"
   TabHolder.Parent = LeftFrame
   TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TabHolder.BackgroundTransparency = 1.000
   TabHolder.Position = UDim2.new(0.0806451589, 0, 0.189360261, 0)
   TabHolder.Size = UDim2.new(0, 159, 0, 309)
  
   TabHoldLayout.Name = "TabHoldLayout"
   TabHoldLayout.Parent = TabHolder
   TabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
   TabHoldLayout.Padding = UDim.new(0,5)
  
   ContainerHold.Name = "ContainerHold"
   ContainerHold.Parent = MainFrame
  
   DragFrame.Name = "DragFrame"
   DragFrame.Parent = MainFrame
   DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DragFrame.BackgroundTransparency = 1.000
   DragFrame.Position = UDim2.new(0.30130294, 0, 0.00253164559, 0)
   DragFrame.Size = UDim2.new(0, 428, 0, 21)
  
   Glow.Name = "Glow"
   Glow.Parent = LeftFrame
   Glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Glow.BackgroundTransparency = 1.000
   Glow.BorderSizePixel = 0
   Glow.Position = UDim2.new(0, -15, 0, -15)
   Glow.Size = UDim2.new(1, 30, 1, 30)
   Glow.ZIndex = 0
   Glow.Image = "rbxassetid://4996891970"
   Glow.ImageColor3 = Color3.fromRGB(15, 15, 15)
   Glow.ScaleType = Enum.ScaleType.Slice
   Glow.SliceCenter = Rect.new(20, 20, 280, 280)
  
   MakeDraggable(MainFrame, MainFrame)
  
   function VLib:Notification(textdesc)
      local NotificationHold = Instance.new("TextButton")
      local NotificationFrame = Instance.new("Frame")
      local OkayBtn = Instance.new("TextButton")
      local OkayBtnCorner = Instance.new("UICorner")
      local OkayBtnTitle = Instance.new("TextLabel")
      local NotificationTitle = Instance.new("TextLabel")
      local NotificationDesc = Instance.new("TextLabel")
  
      NotificationHold.Name = "NotificationHold"
      NotificationHold.Parent = MainFrame
      NotificationHold.BackgroundColor3 = Color3.fromRGB(125, 125, 125)
      NotificationHold.BackgroundTransparency = 0.700
      NotificationHold.BorderSizePixel = 0
      NotificationHold.Size = UDim2.new(0, 650, 0, 500)
      NotificationHold.AutoButtonColor = false
      NotificationHold.Font = Enum.Font.SourceSans
      NotificationHold.Text = ""
      NotificationHold.TextColor3 = Color3.fromRGB(0, 0, 0)
      NotificationHold.TextSize = 14.000
  
      TweenService:Create(
         NotificationHold,
         TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
         {BackgroundTransparency = 0.7}
      ):Play()
      wait(0.4)
  
      NotificationFrame.Name = "NotificationFrame"
      NotificationFrame.Parent = NotificationHold
      NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
      NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
      NotificationFrame.BorderSizePixel = 0
      NotificationFrame.ClipsDescendants = true
      NotificationFrame.Position = UDim2.new(0.5, 0, 0.498432577, 0)
      NotificationFrame.Size = UDim2.new(0, 0, 0, 0)		
  
      NotificationFrame:TweenSize(UDim2.new(0, 305,0, 283), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
  
      OkayBtn.Name = "OkayBtn"
      OkayBtn.Parent = NotificationFrame
      OkayBtn.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
      OkayBtn.Position = UDim2.new(0.171131134, 0, 0.759717345, 0)
      OkayBtn.Size = UDim2.new(0, 200, 0, 42)
      OkayBtn.AutoButtonColor = false
      OkayBtn.Font = Enum.Font.SourceSans
      OkayBtn.Text = ""
      OkayBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
      OkayBtn.TextSize = 14.000
  
      OkayBtnCorner.CornerRadius = UDim.new(0, 5)
      OkayBtnCorner.Name = "OkayBtnCorner"
      OkayBtnCorner.Parent = OkayBtn
  
      OkayBtnTitle.Name = "OkayBtnTitle"
      OkayBtnTitle.Parent = OkayBtn
      OkayBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      OkayBtnTitle.BackgroundTransparency = 1.000
      OkayBtnTitle.Size = UDim2.new(0, 200, 0, 42)
      OkayBtnTitle.Text = "Okey"
      OkayBtnTitle.Font = Enum.Font.Gotham
      OkayBtnTitle.TextColor3 = Color3.fromRGB(202, 202, 202)
      OkayBtnTitle.TextSize = 24.000
  
      NotificationTitle.Name = "NotificationTitle"
      NotificationTitle.Parent = NotificationFrame
      NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      NotificationTitle.BackgroundTransparency = 1.000
      NotificationTitle.Position = UDim2.new(0.0559394211, 0, 0.0652336925, 0)
      NotificationTitle.Size = UDim2.new(0, 272, 0, 26)
      NotificationTitle.ZIndex = 3
      NotificationTitle.Font = Enum.Font.Gotham
      NotificationTitle.Text = "Notification"
      NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
      NotificationTitle.TextSize = 24.000
  
      NotificationDesc.Name = "NotificationDesc"
      NotificationDesc.Parent = NotificationFrame
      NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      NotificationDesc.BackgroundTransparency = 1.000
      NotificationDesc.Position = UDim2.new(0.0670000017, 0, 0.218999997, 0)
      NotificationDesc.Size = UDim2.new(0, 274, 0, 146)
      NotificationDesc.Font = Enum.Font.Gotham
      NotificationDesc.Text = textdesc
      NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
      NotificationDesc.TextSize = 20.000
      NotificationDesc.TextWrapped = true
      NotificationDesc.TextXAlignment = Enum.TextXAlignment.Center
      NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top
  
      OkayBtn.MouseEnter:Connect(function()
         TweenService:Create(
            OkayBtn,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(37,37,37)}
         ):Play()
      end)
  
      OkayBtn.MouseLeave:Connect(function()
         TweenService:Create(
            OkayBtn,
            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
         ):Play()
      end)
  
      OkayBtn.MouseButton1Click:Connect(function()
         NotificationFrame:TweenSize(UDim2.new(0, 0,0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
  
         wait(0.4)
  
         TweenService:Create(
            NotificationHold,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 1}
         ):Play()
  
         wait(.3)
  
         NotificationHold:Destroy()
      end)
   end
  
   coroutine.wrap(
      function()
         while wait() do
         end
      end
   )()
   local Tabs = {}
   function Tabs:Tab(text)
      local Tab = Instance.new("TextButton")
      local TabCorner = Instance.new("UICorner")
      local Title = Instance.new("TextLabel")
      local UIGradient = Instance.new('UIGradient')
      Tab.Name = "Tab"
      Tab.Parent = TabHolder
      Tab.BackgroundColor3 = Color3.fromRGB(255,255,255)
      Tab.Size = UDim2.new(0, 170, 0, 35)
      Tab.AutoButtonColor = false
      Tab.Font = Enum.Font.SourceSans
      Tab.Text = ""
      Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
      Tab.TextSize = 15.000
      Tab.BackgroundTransparency = 1
  
      UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(160, 207, 236)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 152, 255))}
      UIGradient.Parent = Tab
  
  
      TabCorner.CornerRadius = UDim.new(0, 3)
      TabCorner.Name = "TabCorner"
      TabCorner.Parent = Tab
  
      Title.Name = "Title"
      Title.Parent = Tab
      Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Title.BackgroundTransparency = 1.000
      Title.Position = UDim2.new(0.0566037744, 0, 0.1, 0)
      Title.Size = UDim2.new(0, 150, 0, 29)
      Title.Font = Enum.Font.Gotham
      Title.Text = text
      Title.TextColor3 = Color3.fromRGB(255, 255, 255)
      Title.TextSize = 17.000
      Title.TextXAlignment = Enum.TextXAlignment.Left
  
      local Container = Instance.new("ScrollingFrame")
      local ContainerLayout = Instance.new("UIListLayout")
  
      Container.Name = "Container"
      Container.Parent = ContainerHold
      Container.Active = true
      Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      Container.BackgroundTransparency = 1.000
      Container.BorderSizePixel = 0
      Container.Position = UDim2.new(0.34, 0, 0.0506329127, 0)
      Container.Size = UDim2.new(0, 420, 0, 450)
      Container.ScrollBarThickness = 5
      Container.CanvasSize = UDim2.new(0, 0, 0, 0)
      Container.Visible = false
      Container.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
  
      ContainerLayout.Name = "ContainerLayout"
      ContainerLayout.Parent = Container
      ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
      ContainerLayout.Padding = UDim.new(0, 15)
  
      if FirstTab == false then
         FirstTab = true
         Tab.BackgroundTransparency = 0
         Container.Visible = true
      end
      Tab.MouseButton1Click:Connect(
         function()
            for i, v in next, ContainerHold:GetChildren() do
               if v.Name == "Container" then
                  v.Visible = false
               end
            end
  
            for i, v in next, TabHolder:GetChildren() do
               if v.ClassName == "TextButton" then
                  TweenService:Create(
                     v,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {BackgroundTransparency = 1}
                  ):Play()
                  TweenService:Create(
                     Tab,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {BackgroundTransparency = 0}
                  ):Play()
               end
            end
            Container.Visible = true
         end
      )
      local ContainerItems = {}
      function ContainerItems:Button(text, callback)
         local Button = Instance.new("TextButton")
         local ButtonCorner = Instance.new("UICorner")
  
         Button.Name = "Button"
         Button.Parent = Container
         Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Button.Size = UDim2.new(0, 405, 0, 40)
         Button.AutoButtonColor = false
         Button.Font = Enum.Font.Gotham
         Button.TextColor3 = Color3.fromRGB(255, 255, 255)
         Button.TextSize = 15.000
         Button.Text = text
  
         ButtonCorner.CornerRadius = UDim.new(0, 5)
         ButtonCorner.Name = "ButtonCorner"
         ButtonCorner.Parent = Button
  
         Button.MouseEnter:Connect(
            function()
               TweenService:Create(
                  Button,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad),
                  {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
               ):Play()
            end
         )
         Button.MouseLeave:Connect(
            function()
               TweenService:Create(
                  Button,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad),
                  {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
               ):Play()
            end
         )
  
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
  
         Button.MouseButton1Click:Connect(
            function()
               pcall(callback)
               Button.TextSize = 0
               TweenService:Create(Button, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 17}):Play()
               wait(.2)
               TweenService:Create(Button, TweenInfo.new(.2, Enum.EasingStyle.Quad), {TextSize = 14}):Play()
            end
         )
      end
      function ContainerItems:Toggle(text,Default,callback)
         local Toggled = Default or false
         local ValueToggle = ValueTogglea or false
         local Toggle = Instance.new("TextButton")
         local ToggleCorner = Instance.new("UICorner")
         local Title = Instance.new("TextLabel")
         local ToggleFrame = Instance.new("Frame")
         local ToggleFrameCorner = Instance.new("UICorner")
         local ToggleFrameRainbow = Instance.new("Frame")
         local ToggleFrameRainbowCorner = Instance.new("UICorner")
         local ToggleDot = Instance.new("Frame")
         local ToggleDotCorner = Instance.new("UICorner")
         local UIGradient_2 = Instance.new('UIGradient')
         Toggle.Name = "Toggle"
         Toggle.Parent = Container
         Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Toggle.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
         Toggle.Size = UDim2.new(0, 405, 0, 40)
         Toggle.AutoButtonColor = false
         Toggle.Font = Enum.Font.Gotham
         Toggle.Text = ""
         Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
         Toggle.TextSize = 14.000
  
         ToggleCorner.CornerRadius = UDim.new(0, 5)
         ToggleCorner.Name = "ToggleCorner"
         ToggleCorner.Parent = Toggle
  
         Title.Name = "Title"
         Title.Parent = Toggle
         Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Title.BackgroundTransparency = 1.000
         Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
         Title.Size = UDim2.new(0, 430, 0, 40)
         Title.Font = Enum.Font.Gotham
         Title.Text = text
         Title.TextColor3 = Color3.fromRGB(255, 255, 255)
         Title.TextSize = 15.000
         Title.TextXAlignment = Enum.TextXAlignment.Left
  
         ToggleFrame.Name = "ToggleFrame"
         ToggleFrame.Parent = Toggle
         ToggleFrame.BackgroundColor3 = Color3.fromRGB(22, 23, 27)
         ToggleFrame.Position = UDim2.new(0.88, 0, 0.21, 0)
         ToggleFrame.Size = UDim2.new(0, 40, 0, 22)
  
         ToggleFrameCorner.CornerRadius = UDim.new(1, 0)
         ToggleFrameCorner.Name = "ToggleFrameCorner"
         ToggleFrameCorner.Parent = ToggleFrame
  
         ToggleFrameRainbow.Name = "ToggleFrameRainbow"
         ToggleFrameRainbow.Parent = ToggleFrame
         ToggleFrameRainbow.BackgroundColor3 = Color3.fromRGB(27,27,27)
         ToggleFrameRainbow.BackgroundTransparency = 1.000
         ToggleFrameRainbow.Position = UDim2.new(-0.0198377371, 0, 0.00601506233, 0)
         ToggleFrameRainbow.Size = UDim2.new(0, 40, 0, 22)
  
         ToggleFrameRainbowCorner.CornerRadius = UDim.new(1, 0)
         ToggleFrameRainbowCorner.Name = "ToggleFrameRainbowCorner"
         ToggleFrameRainbowCorner.Parent = ToggleFrameRainbow
  
         ToggleDot.Name = "ToggleDot"
         ToggleDot.Parent = ToggleFrameRainbow
         ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ToggleDot.Position = UDim2.new(0.104999997, -3, 0.289000005, -4)
         ToggleDot.Size = UDim2.new(0, 16, 0, 16)
  
         UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(160, 207, 236)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 152, 255))}
         UIGradient_2.Parent = ToggleDot
  
         ToggleDotCorner.CornerRadius = UDim.new(1, 0)
         ToggleDotCorner.Name = "ToggleDotCorner"
         ToggleDotCorner.Parent = ToggleDot
  
         Toggle.MouseEnter:Connect(
            function()
               TweenService:Create(
                  Toggle,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad),
                  {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
               ):Play()
  
            end
         )
         Toggle.MouseLeave:Connect(
            function()
               TweenService:Create(
                  Toggle,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad),
                  {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
               ):Play()
            end
         )
  
         if Toggled == true then
          UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(160, 207, 236)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 152, 255))}
  
          TweenService:Create(
             ToggleFrameRainbow,
             TweenInfo.new(.2, Enum.EasingStyle.Quad),
             {BackgroundTransparency = 0}
          ):Play()
          TweenService:Create(
             ToggleDot,
             TweenInfo.new(.2, Enum.EasingStyle.Quad),
             {Position = UDim2.new(0.595, -3, 0.289000005, -4)}
          ):Play()
          pcall(callback, Toggled)
       else
          ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(46, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(228, 92, 255))}
  
          TweenService:Create(
             ToggleFrameRainbow,
             TweenInfo.new(.2, Enum.EasingStyle.Quad),
             {BackgroundTransparency = 1}
          ):Play()
          TweenService:Create(
             ToggleDot,
             TweenInfo.new(.2, Enum.EasingStyle.Quad),
             {Position = UDim2.new(0.104999997, -3, 0.289000005, -4)}
          ):Play()
       end
  
         Toggle.MouseButton1Click:Connect(
            function()
               if Toggled == false then
                  UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(160, 207, 236)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 152, 255))}
  
                  TweenService:Create(
                     ToggleFrameRainbow,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {BackgroundTransparency = 0}
                  ):Play()
                  TweenService:Create(
                     ToggleDot,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {Position = UDim2.new(0.595, -3, 0.289000005, -4)}
                  ):Play()
               else
                  UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(160, 207, 236)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 152, 255))}
  
                  TweenService:Create(
                     ToggleFrameRainbow,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {BackgroundTransparency = 1}
                  ):Play()
                  TweenService:Create(
                     ToggleDot,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {Position = UDim2.new(0.104999997, -3, 0.289000005, -4)}
                  ):Play()
               end
               Toggled = not Toggled
               pcall(callback, Toggled)
            end
         )
  
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
      end
      function ContainerItems:Slider(text, min, max, start, callback)
         local dragging = false
         local Slider = Instance.new("TextButton")
         local Title = Instance.new("TextLabel")
         local SliderFrame = Instance.new("Frame")
         local SliderFrameCorner = Instance.new("UICorner")
         local SliderIndicator = Instance.new("Frame")
         local SliderIndicatorCorner = Instance.new("UICorner")
         local SliderCorner = Instance.new("UICorner")
         local Value = Instance.new("TextLabel")
         local UIGradient_3 = Instance.new('UIGradient')
  
         Slider.Name = "Slider"
         Slider.Parent = Container
         Slider.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Slider.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
         Slider.Size = UDim2.new(0, 405, 0, 49)
         Slider.AutoButtonColor = false
         Slider.Font = Enum.Font.Gotham
         Slider.Text = ""
         Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
         Slider.TextSize = 14.000
  
         Title.Name = "Title"
         Title.Parent = Slider
         Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Title.BackgroundTransparency = 1.000
         Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
         Title.Size = UDim2.new(0, 192, 0, 28)
         Title.Font = Enum.Font.Gotham
         Title.Text = text
         Title.TextColor3 = Color3.fromRGB(255, 255, 255)
         Title.TextSize = 14.000
         Title.TextXAlignment = Enum.TextXAlignment.Left
  
         SliderFrame.Name = "SliderFrame"
         SliderFrame.Parent = Slider
         SliderFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
         SliderFrame.Position = UDim2.new(0.0223324299, 0, 0.563266039, 0)
         SliderFrame.Size = UDim2.new(0, 384, 0, 11)
  
         SliderFrameCorner.Name = "SliderFrameCorner"
         SliderFrameCorner.Parent = SliderFrame
  
         SliderIndicator.Name = "SliderIndicator"
         SliderIndicator.Parent = SliderFrame
         SliderIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         SliderIndicator.BorderSizePixel = 0
         SliderIndicator.Position = UDim2.new(-0.00260408712, 0, 0.0363603085, 0)
         SliderIndicator.Size = UDim2.new((start or 0) / max, 0, 0, 11)
  
         UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(160, 207, 236)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(102, 152, 255))}
         UIGradient_3.Parent = SliderIndicator
  
         SliderIndicatorCorner.Name = "SliderIndicatorCorner"
         SliderIndicatorCorner.Parent = SliderIndicator
  
         SliderCorner.CornerRadius = UDim.new(0, 6)
         SliderCorner.Name = "SliderCorner"
         SliderCorner.Parent = Slider
  
         Value.Name = "Value"
         Value.Parent = Slider
         Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Value.BackgroundTransparency = 1.000
         Value.Position = UDim2.new(0.496277869, 0, 0, 0)
         Value.Size = UDim2.new(0, 192, 0, 28)
         Value.Font = Enum.Font.Gotham
         Value.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
         Value.TextColor3 = Color3.fromRGB(255, 255, 255)
         Value.TextSize = 14.000
         Value.TextXAlignment = Enum.TextXAlignment.Right
  
         local function slide(input)
            local pos =
               UDim2.new(
                  math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1),
                  0,
                  0,
                  11
               )
            SliderIndicator:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
            local val = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
            Value.Text = tostring(val)
            pcall(callback, val)
         end
  
         SliderFrame.InputBegan:Connect(
            function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                  slide(input)
                  dragging = true
               end
            end
         )
  
         SliderFrame.InputEnded:Connect(
            function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                  dragging = false
               end
            end
         )
  
         UserInputService.InputChanged:Connect(
            function(input)
               if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                  slide(input)
               end
            end
         )
  
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
  
      end
      function ContainerItems:Dropdown(text, list, callback)
         local dropfunc = {}
         local DropToggled = false
         local FrameSize = 0
         local ItemCount = 0
  
         local Dropdown = Instance.new("TextButton")
         local Title = Instance.new("TextLabel")
         local DropdownCorner = Instance.new("UICorner")
         local Arrow = Instance.new("ImageLabel")
  
         Dropdown.Name = "Dropdown"
         Dropdown.Parent = Container
         Dropdown.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Dropdown.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
         Dropdown.Size = UDim2.new(0, 405, 0, 45)
         Dropdown.AutoButtonColor = false
         Dropdown.Font = Enum.Font.Gotham
         Dropdown.Text = ""
         Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
         Dropdown.TextSize = 15.000
  
         Title.Name = "Title"
         Title.Parent = Dropdown
         Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Title.BackgroundTransparency = 1.000
         Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
         Title.Size = UDim2.new(0, 192, 0, 40)
         Title.Font = Enum.Font.Gotham
         Title.Text = text
         Title.TextColor3 = Color3.fromRGB(255, 255, 255)
         Title.TextSize = 15.000
         Title.TextXAlignment = Enum.TextXAlignment.Left
  
         DropdownCorner.CornerRadius = UDim.new(0, 6)
         DropdownCorner.Name = "DropdownCorner"
         DropdownCorner.Parent = Dropdown
  
         Arrow.Name = "Arrow"
         Arrow.Parent = Dropdown
         Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Arrow.BackgroundTransparency = 1.000
         Arrow.Position = UDim2.new(0.9, 0, 0.2, 0)
         Arrow.Size = UDim2.new(0, 27, 0, 27)
         Arrow.Image = "http://www.roblox.com/asset/?id=6034818372"
  
         local DropdownFrame = Instance.new("Frame")
         local DropdownFrameCorner = Instance.new("UICorner")
         local DropdownHolder = Instance.new("ScrollingFrame")
         local DropdownItemLayout = Instance.new("UIListLayout")
         local DropdownItemHolder = Instance.new("UIPadding")
  
         DropdownFrame.Name = "DropdownFrame"
         DropdownFrame.Parent = Container
         DropdownFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
         DropdownFrame.BorderSizePixel = 0
         DropdownFrame.Position = UDim2.new(0.334374994, 0, 0.604166687, 0)
         DropdownFrame.Size = UDim2.new(0, 403, 0, 0)
         DropdownFrame.Visible = false
  
         DropdownFrameCorner.Name = "DropdownFrameCorner"
         DropdownFrameCorner.Parent = DropdownFrame
  
         DropdownHolder.Name = "DropdownHolder"
         DropdownHolder.Parent = DropdownFrame
         DropdownHolder.Active = true
         DropdownHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         DropdownHolder.BackgroundTransparency = 1.000
         DropdownHolder.BorderSizePixel = 0
         DropdownHolder.Position = UDim2.new(0.0263156947, 0, 0.00326599111, 0)
         DropdownHolder.Size = UDim2.new(0, 386, 0, 0)
         DropdownHolder.ScrollBarThickness = 3
         DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
         DropdownHolder.ScrollBarImageColor3 = Color3.fromRGB(48, 48, 48)
  
         DropdownItemLayout.Name = "DropdownItemLayout"
         DropdownItemLayout.Parent = DropdownHolder
         DropdownItemLayout.SortOrder = Enum.SortOrder.LayoutOrder
         DropdownItemLayout.Padding = UDim.new(0, 5)
  
         DropdownItemHolder.Name = "DropdownItemHolder"
         DropdownItemHolder.Parent = DropdownHolder
         DropdownItemHolder.PaddingBottom = UDim.new(0, 5)
         DropdownItemHolder.PaddingTop = UDim.new(0, 5)
  
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
  
         Dropdown.MouseEnter:Connect(
            function()
               TweenService:Create(
                  Dropdown,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad),
                  {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
               ):Play()
            end
         )
         Dropdown.MouseLeave:Connect(
            function()
               TweenService:Create(
                  Dropdown,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad),
                  {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
               ):Play()
            end
         )
  
         Dropdown.MouseButton1Click:Connect(
            function()
               if DropToggled == false then
                  DropdownFrame.Visible = true
                  DropdownFrame:TweenSize(
                     UDim2.new(0, 403, 0, FrameSize),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  DropdownHolder:TweenSize(
                     UDim2.new(0, 386, 0, FrameSize),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  TweenService:Create(
                     Arrow,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {Rotation = 180}
                  ):Play()
                  repeat
                     wait()
                  until DropdownFrame.Size == UDim2.new(0, 403, 0, FrameSize)
                  Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
               else
                  DropdownFrame:TweenSize(
                     UDim2.new(0, 403, 0, 0),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  DropdownHolder:TweenSize(
                     UDim2.new(0, 386, 0, 0),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  TweenService:Create(
                     Arrow,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {Rotation = 0}
                  ):Play()
                  repeat
                     wait()
                  until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
                  DropdownFrame.Visible = false
                  Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
               end
               DropToggled = not DropToggled
            end
         )
  
         for i, v in next, list do
            ItemCount = ItemCount + 1
  
            if ItemCount == 1 then
               FrameSize = 39
            elseif ItemCount == 2 then
               FrameSize = 69
            elseif ItemCount >= 3 then
               FrameSize = 100
            end
  
            local Item = Instance.new("TextButton")
            local ItemCorner = Instance.new("UICorner")
  
            Item.Name = "Item"
            Item.Parent = DropdownHolder
            Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
            Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
            Item.Size = UDim2.new(0, 405, 0, 24)
            Item.AutoButtonColor = false
            Item.Font = Enum.Font.Gotham
            Item.TextColor3 = Color3.fromRGB(255, 255, 255)
            Item.TextSize = 14.000
            Item.Text = v
  
            ItemCorner.Name = "ItemCorner"
            ItemCorner.Parent = Item
  
            Item.MouseEnter:Connect(
               function()
                  TweenService:Create(
                     Item,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
                  ):Play()
               end
            )
            Item.MouseLeave:Connect(
               function()
                  TweenService:Create(
                     Item,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
                  ):Play()
               end
            )
  
            Item.MouseButton1Click:Connect(
               function()
                  Title.Text = text .. " - " .. v
                  pcall(callback, v)
                  DropToggled = false
                  DropdownFrame:TweenSize(
                     UDim2.new(0, 403, 0, 0),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  DropdownHolder:TweenSize(
                     UDim2.new(0, 386, 0, 0),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  TweenService:Create(
                     Arrow,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {Rotation = 0}
                  ):Play()
                  repeat
                     wait()
                  until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
                  DropdownFrame.Visible = false
                  Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
               end
            )
  
            DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
         end
  
         function dropfunc:Clear()
            Title.Text = text
            FrameSize = 0
            ItemCount = 0
  
            for i,v in next, DropdownHolder:GetChildren() do
               if v.Name == "Item" then
                  v:Destroy()
               end
            end
  
            DropdownFrame:TweenSize(
               UDim2.new(0, 403, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            DropdownHolder:TweenSize(
               UDim2.new(0, 386, 0, 0),
               Enum.EasingDirection.Out,
               Enum.EasingStyle.Quart,
               0.1,
               true
            )
            TweenService:Create(
               Arrow,
               TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
               {Rotation = 0}
            ):Play()
            repeat
               wait()
            until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
            DropdownFrame.Visible = false
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
         end
  
         function dropfunc:Add(toadd)
            ItemCount = ItemCount + 1
  
            if ItemCount == 1 then
               FrameSize = 39
            elseif ItemCount == 2 then
               FrameSize = 69
            elseif ItemCount >= 3 then
               FrameSize = 100
            end
  
            local Item = Instance.new("TextButton")
            local ItemCorner = Instance.new("UICorner")
  
            Item.Name = "Item"
            Item.Parent = DropdownHolder
            Item.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
            Item.Position = UDim2.new(0, 0, 0.0808080807, 0)
            Item.Size = UDim2.new(0, 405, 0, 24)
            Item.AutoButtonColor = false
            Item.Font = Enum.Font.Gotham
            Item.TextColor3 = Color3.fromRGB(255, 255, 255)
            Item.TextSize = 14.000
            Item.Text = toadd
  
            ItemCorner.Name = "ItemCorner"
            ItemCorner.Parent = Item
  
            Item.MouseEnter:Connect(
               function()
                  TweenService:Create(
                     Item,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
                  ):Play()
               end
            )
            Item.MouseLeave:Connect(
               function()
                  TweenService:Create(
                     Item,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {BackgroundColor3 = Color3.fromRGB(32, 32, 32)}
                  ):Play()
               end
            )
  
            Item.MouseButton1Click:Connect(
               function()
                  Title.Text = text .. " - " .. toadd
                  pcall(callback, toadd)
                  DropToggled = false
                  DropdownFrame:TweenSize(
                     UDim2.new(0, 403, 0, 0),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  DropdownHolder:TweenSize(
                     UDim2.new(0, 386, 0, 0),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  TweenService:Create(
                     Arrow,
                     TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                     {Rotation = 0}
                  ):Play()
                  repeat
                     wait()
                  until DropdownFrame.Size == UDim2.new(0, 403, 0, 0)
                  DropdownFrame.Visible = false
                  Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
               end
            )
  
            DropdownHolder.CanvasSize = UDim2.new(0, 0, 0, DropdownItemLayout.AbsoluteContentSize.Y + 15)
         end
  
         return dropfunc
      end
      function ContainerItems:Colorpicker(text, preset, callback)
         local ColorPickerToggled = false
         local OldToggleColor = Color3.fromRGB(0, 0, 0)
         local OldColor = Color3.fromRGB(0, 0, 0)
         local OldColorSelectionPosition = nil
         local OldHueSelectionPosition = nil
         local ColorH, ColorS, ColorV = 1, 1, 1
         local RainbowColorPicker = false
         local ColorPickerInput = nil
         local ColorInput = nil
         local HueInput = nil
  
         local Colorpicker = Instance.new("TextButton")
         local Title = Instance.new("TextLabel")
         local BoxColor = Instance.new("Frame")
         local BoxcolorCorner = Instance.new("UICorner")
         local ColorpickerCorner = Instance.new("UICorner")
  
         Colorpicker.Name = "Colorpicker"
         Colorpicker.Parent = Container
         Colorpicker.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Colorpicker.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
         Colorpicker.Size = UDim2.new(0, 405, 0, 40)
         Colorpicker.AutoButtonColor = false
         Colorpicker.Font = Enum.Font.Gotham
         Colorpicker.Text = ""
         Colorpicker.TextColor3 = Color3.fromRGB(255, 255, 255)
         Colorpicker.TextSize = 14.000
  
         Title.Name = "Title"
         Title.Parent = Colorpicker
         Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Title.BackgroundTransparency = 1.000
         Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
         Title.Size = UDim2.new(0, 405, 0, 40)
         Title.Font = Enum.Font.Gotham
         Title.Text = text
         Title.TextColor3 = Color3.fromRGB(255, 255, 255)
         Title.TextSize = 15.000
         Title.TextXAlignment = Enum.TextXAlignment.Left
  
         BoxColor.Name = "Boxcolor"
         BoxColor.Parent = Colorpicker
         BoxColor.BackgroundColor3 = preset
         BoxColor.Position = UDim2.new(0.88, 0, 0.3, 0)
         BoxColor.Size = UDim2.new(0, 36, 0, 19)
  
         BoxcolorCorner.CornerRadius = UDim.new(0, 6)
         BoxcolorCorner.Name = "BoxcolorCorner"
         BoxcolorCorner.Parent = BoxColor
  
         ColorpickerCorner.CornerRadius = UDim.new(0, 4)
         ColorpickerCorner.Name = "ColorpickerCorner"
         ColorpickerCorner.Parent = Colorpicker
  
         local ColorpickerFrame = Instance.new("Frame")
         local DropdownFrameCorner = Instance.new("UICorner")
         local Hue = Instance.new("ImageLabel")
         local HueCorner = Instance.new("UICorner")
         local HueGradient = Instance.new("UIGradient")
         local HueSelection = Instance.new("ImageLabel")
         local Color = Instance.new("ImageLabel")
         local ColorCorner = Instance.new("UICorner")
         local ColorSelection = Instance.new("ImageLabel")
         local Confirm = Instance.new("TextButton")
         local ButtonCorner = Instance.new("UICorner")
         local RainbowToggle = Instance.new("TextButton")
         local RainbowToggleCorner = Instance.new("UICorner")
         local RainbowTitle = Instance.new("TextLabel")
         local RainbowToggleFrame = Instance.new("Frame")
         local RainbowToggleFrameCorner = Instance.new("UICorner")
         local RainbowToggleFrameRainbow = Instance.new("Frame")
         local RainbowToggleFrameRainbowCorner = Instance.new("UICorner")
         local RainbowToggleDot = Instance.new("Frame")
         local RainbowToggleDotCorner = Instance.new("UICorner")
  
         ColorpickerFrame.Name = "ColorpickerFrame"
         ColorpickerFrame.Parent = Container
         ColorpickerFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
         ColorpickerFrame.BorderSizePixel = 0
         ColorpickerFrame.Position = UDim2.new(0.165624991, 0, 0.671052635, 0)
         ColorpickerFrame.Size = UDim2.new(0, 403, 0, 0)
         ColorpickerFrame.Visible = false
         ColorpickerFrame.ClipsDescendants = true
  
         DropdownFrameCorner.Name = "DropdownFrameCorner"
         DropdownFrameCorner.Parent = ColorpickerFrame
  
         Hue.Name = "Hue"
         Hue.Parent = ColorpickerFrame
         Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Hue.Position = UDim2.new(0, 209, 0, 9)
         Hue.Size = UDim2.new(0, 25, 0, 80)
  
         HueCorner.CornerRadius = UDim.new(0, 3)
         HueCorner.Name = "HueCorner"
         HueCorner.Parent = Hue
  
         HueGradient.Color =
            ColorSequence.new {
               ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
               ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
               ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
               ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
               ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
               ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
               ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
            }
         HueGradient.Rotation = 270
         HueGradient.Name = "HueGradient"
         HueGradient.Parent = Hue
  
         HueSelection.Name = "HueSelection"
         HueSelection.Parent = Hue
         HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
         HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         HueSelection.BackgroundTransparency = 1.000
         HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
         HueSelection.Size = UDim2.new(0, 18, 0, 18)
         HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
  
         Color.Name = "Color"
         Color.Parent = ColorpickerFrame
         Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
         Color.Position = UDim2.new(0, 9, 0, 9)
         Color.Size = UDim2.new(0, 194, 0, 80)
         Color.ZIndex = 10
         Color.Image = "rbxassetid://4155801252"
  
         ColorCorner.CornerRadius = UDim.new(0, 3)
         ColorCorner.Name = "ColorCorner"
         ColorCorner.Parent = Color
  
         ColorSelection.Name = "ColorSelection"
         ColorSelection.Parent = Color
         ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
         ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ColorSelection.BackgroundTransparency = 1.000
         ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
         ColorSelection.Size = UDim2.new(0, 18, 0, 18)
         ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
         ColorSelection.ScaleType = Enum.ScaleType.Fit
  
         Confirm.Name = "Confirm"
         Confirm.Parent = ColorpickerFrame
         Confirm.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
         Confirm.BackgroundTransparency = 0.010
         Confirm.Position = UDim2.new(0.612244904, 0, 0.0900000036, 0)
         Confirm.Size = UDim2.new(0, 145, 0, 27)
         Confirm.AutoButtonColor = false
         Confirm.Font = Enum.Font.Gotham
         Confirm.Text = "Confirm"
         Confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
         Confirm.TextSize = 14.000
  
         ButtonCorner.Name = "ButtonCorner"
         ButtonCorner.Parent = Confirm
  
         RainbowToggle.Name = "RainbowToggle"
         RainbowToggle.Parent = ColorpickerFrame
         RainbowToggle.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
         RainbowToggle.Position = UDim2.new(0.610732794, 0, 0.431324542, 0)
         RainbowToggle.Size = UDim2.new(0, 145, 0, 27)
         RainbowToggle.AutoButtonColor = false
         RainbowToggle.Font = Enum.Font.Gotham
         RainbowToggle.Text = ""
         RainbowToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
         RainbowToggle.TextSize = 14.000
  
         RainbowToggleCorner.Name = "RainbowToggleCorner"
         RainbowToggleCorner.Parent = RainbowToggle
  
         RainbowTitle.Name = "RainbowTitle"
         RainbowTitle.Parent = RainbowToggle
         RainbowTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         RainbowTitle.BackgroundTransparency = 1.000
         RainbowTitle.Position = UDim2.new(0.0204080511, 0, 0, 0)
         RainbowTitle.Size = UDim2.new(0, 29, 0, 27)
         RainbowTitle.Font = Enum.Font.Gotham
         RainbowTitle.Text = "Rainbow"
         RainbowTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
         RainbowTitle.TextSize = 14.000
         RainbowTitle.TextXAlignment = Enum.TextXAlignment.Left
  
         RainbowToggleFrame.Name = "RainbowToggleFrame"
         RainbowToggleFrame.Parent = RainbowToggle
         RainbowToggleFrame.BackgroundColor3 = Color3.fromRGB(22, 23, 27)
         RainbowToggleFrame.Position = UDim2.new(0.693, 0, 0.142857149, 0)
         RainbowToggleFrame.Size = UDim2.new(0, 36, 0, 19)
  
         RainbowToggleFrameCorner.CornerRadius = UDim.new(1, 0)
         RainbowToggleFrameCorner.Name = "RainbowToggleFrameCorner"
         RainbowToggleFrameCorner.Parent = RainbowToggleFrame
  
         RainbowToggleFrameRainbow.Name = "RainbowToggleFrameRainbow"
         RainbowToggleFrameRainbow.Parent = RainbowToggleFrame
         RainbowToggleFrameRainbow.BackgroundColor3 = Color3.fromRGB(67,136,246)
         RainbowToggleFrameRainbow.BackgroundTransparency = 1.000
         RainbowToggleFrameRainbow.Position = UDim2.new(-0.0198377371, 0, 0.00601506233, 0)
         RainbowToggleFrameRainbow.Size = UDim2.new(0, 36, 0, 19)
  
         RainbowToggleFrameRainbowCorner.CornerRadius = UDim.new(1, 0)
         RainbowToggleFrameRainbowCorner.Name = "RainbowToggleFrameRainbowCorner"
         RainbowToggleFrameRainbowCorner.Parent = RainbowToggleFrameRainbow
  
         RainbowToggleDot.Name = "RainbowToggleDot"
         RainbowToggleDot.Parent = RainbowToggleFrameRainbow
         RainbowToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         RainbowToggleDot.Position = UDim2.new(0.104999997, -3, 0.289000005, -4)
         RainbowToggleDot.Size = UDim2.new(0, 16, 0, 16)
  
         RainbowToggleDotCorner.CornerRadius = UDim.new(1, 0)
         RainbowToggleDotCorner.Name = "RainbowToggleDotCorner"
         RainbowToggleDotCorner.Parent = RainbowToggleDot
  
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
  
         Colorpicker.MouseEnter:Connect(
            function()
               TweenService:Create(
                  Colorpicker,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad),
                  {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}
               ):Play()
            end
         )
         Colorpicker.MouseLeave:Connect(
            function()
               TweenService:Create(
                  Colorpicker,
                  TweenInfo.new(.2, Enum.EasingStyle.Quad),
                  {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}
               ):Play()
            end
         )
  
         local function UpdateColorPicker(nope)
            BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
            Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
  
            pcall(callback, BoxColor.BackgroundColor3)
         end
  
         ColorH =
            1 -
            (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
               Hue.AbsoluteSize.Y)
         ColorS =
            (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
               Color.AbsoluteSize.X)
         ColorV =
            1 -
            (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
               Color.AbsoluteSize.Y)
  
         BoxColor.BackgroundColor3 = preset
         Color.BackgroundColor3 = preset
         pcall(callback, BoxColor.BackgroundColor3)
  
         Color.InputBegan:Connect(
            function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                  if RainbowColorPicker then
                     return
                  end
  
                  if ColorInput then
                     ColorInput:Disconnect()
                  end
  
                  ColorInput =
                     RunService.RenderStepped:Connect(
                        function()
                        local ColorX =
                           (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                              Color.AbsoluteSize.X)
                        local ColorY =
                           (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                              Color.AbsoluteSize.Y)
  
                        ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                        ColorS = ColorX
                        ColorV = 1 - ColorY
  
                        UpdateColorPicker(true)
                     end
                     )
               end
            end
         )
  
         Color.InputEnded:Connect(
            function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                  if ColorInput then
                     ColorInput:Disconnect()
                  end
               end
            end
         )
  
         Hue.InputBegan:Connect(
            function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                  if RainbowColorPicker then
                     return
                  end
  
                  if HueInput then
                     HueInput:Disconnect()
                  end
  
                  HueInput =
                     RunService.RenderStepped:Connect(
                        function()
                        local HueY =
                           (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                              Hue.AbsoluteSize.Y)
  
                        HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
                        ColorH = 1 - HueY
  
                        UpdateColorPicker(true)
                     end
                     )
               end
            end
         )
  
         Hue.InputEnded:Connect(
            function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                  if HueInput then
                     HueInput:Disconnect()
                  end
               end
            end
         )
  
         RainbowToggle.MouseButton1Down:Connect(
            function()
               RainbowColorPicker = not RainbowColorPicker
  
               if ColorInput then
                  ColorInput:Disconnect()
               end
  
               if HueInput then
                  HueInput:Disconnect()
               end
  
               if RainbowColorPicker then
                  TweenService:Create(
                     RainbowToggleFrameRainbow,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {BackgroundTransparency = 0}
                  ):Play()
                  TweenService:Create(
                     RainbowToggleDot,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {Position = UDim2.new(0.595, -3, 0.289000005, -4)}
                  ):Play()
  
                  OldToggleColor = BoxColor.BackgroundColor3
                  OldColor = Color.BackgroundColor3
                  OldColorSelectionPosition = ColorSelection.Position
                  OldHueSelectionPosition = HueSelection.Position
  
                  while RainbowColorPicker do
                     BoxColor.BackgroundColor3 = Color3.fromHSV(VLib.RainbowColorValue, 1, 1)
                     Color.BackgroundColor3 = Color3.fromHSV(VLib.RainbowColorValue, 1, 1)
  
                     ColorSelection.Position = UDim2.new(1, 0, 0, 0)
                     HueSelection.Position = UDim2.new(0.48, 0, 0, VLib.HueSelectionPosition)
  
                     pcall(callback, BoxColor.BackgroundColor3)
                     wait()
                  end
               elseif not RainbowColorPicker then
                  TweenService:Create(
                     RainbowToggleFrameRainbow,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {BackgroundTransparency = 1}
                  ):Play()
                  TweenService:Create(
                     RainbowToggleDot,
                     TweenInfo.new(.2, Enum.EasingStyle.Quad),
                     {Position = UDim2.new(0.104999997, -3, 0.289000005, -4)}
                  ):Play()
  
                  BoxColor.BackgroundColor3 = OldToggleColor
                  Color.BackgroundColor3 = OldColor
  
                  ColorSelection.Position = OldColorSelectionPosition
                  HueSelection.Position = OldHueSelectionPosition
  
                  pcall(callback, BoxColor.BackgroundColor3)
               end
            end
         )
  
         Colorpicker.MouseButton1Click:Connect(
            function()
               if ColorPickerToggled == false then
                  ColorPickerToggled = not ColorPickerToggled
                  ColorpickerFrame.Visible = true
                  ColorpickerFrame:TweenSize(
                     UDim2.new(0, 403, 0, 100),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  repeat
                     wait()
                  until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 100)
                  Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
               else
                  ColorPickerToggled = not ColorPickerToggled
                  ColorpickerFrame:TweenSize(
                     UDim2.new(0, 403, 0, 0),
                     Enum.EasingDirection.Out,
                     Enum.EasingStyle.Quart,
                     0.1,
                     true
                  )
                  repeat
                     wait()
                  until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 0)
                  ColorpickerFrame.Visible = false
                  Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
               end
            end
         )
  
         Confirm.MouseButton1Click:Connect(
            function()
               ColorPickerToggled = not ColorPickerToggled
               ColorpickerFrame:TweenSize(
                  UDim2.new(0, 403, 0, 0),
                  Enum.EasingDirection.Out,
                  Enum.EasingStyle.Quart,
                  0.1,
                  true
               )
               repeat
                  wait()
               until ColorpickerFrame.Size == UDim2.new(0, 403, 0, 0)
               ColorpickerFrame.Visible = false
               Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
            end)
  
         coroutine.wrap(
            function()
               while wait() do
  
               end
            end
         )()
      end
      function ContainerItems:Label(text)
         local labelfunc = {}
         local Label = Instance.new("TextButton")
         local LabelCorner = Instance.new("UICorner")
  
         Label.Name = "Label"
         Label.Parent = Container
         Label.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Label.Size = UDim2.new(0, 405, 0, 40)
         Label.AutoButtonColor = false
         Label.Font = Enum.Font.Gotham
         Label.TextColor3 = Color3.fromRGB(255, 255, 255)
         Label.TextSize = 17.000
         Label.Text = text
  
         LabelCorner.CornerRadius = UDim.new(0, 5)
         LabelCorner.Name = "LabelCorner"
         LabelCorner.Parent = Label
  
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
  
         function labelfunc:Refresh(tochange)
            Label.Text = tochange
         end
  
         return labelfunc
      end
  
      function ContainerItems:line()
         local labelfunc = {}
         local Label = Instance.new("TextButton")
         local LabelCorner = Instance.new("UICorner")
  
         Label.Name = "Label"
         Label.Parent = Container
         Label.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Label.Size = UDim2.new(0, 405, 0, 5)
         Label.AutoButtonColor = false
         Label.Font = Enum.Font.Gotham
         Label.TextColor3 = Color3.fromRGB(255, 255, 255)
         Label.TextSize = 17.000
         Label.Text = ""
  
         LabelCorner.CornerRadius = UDim.new(0, 5)
         LabelCorner.Name = "LabelCorner"
         LabelCorner.Parent = Label
  
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
  
         function labelfunc:Refresh(tochange)
            Label.Text = tochange
         end
  
         return labelfunc
      end
  
      function ContainerItems:Bind(Title, keybind_options, callback)
         local keybind_data = {}
  
         local Keybind = Instance.new("TextButton")
         local Title = Instance.new("TextLabel")
         local KeybindFrame = Instance.new("Frame")
         local KeybindFrameCorner = Instance.new("UICorner")
         local TextButton = Instance.new("TextButton")
         local KeybindCorner = Instance.new("UICorner")
         local ContainerLayout = Instance.new("UIListLayout")
  
  
         Keybind.Name = "Keybind"
         Keybind.Parent = Container
         Keybind.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Keybind.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
         Keybind.Size = UDim2.new(0, 405, 0, 40)
         Keybind.AutoButtonColor = false
         Keybind.Font = Enum.Font.Gotham
         Keybind.Text = ""
         Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
         Keybind.TextSize = 14.000
  
         Title.Name = "Title"
         Title.Parent = Keybind
         Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Title.BackgroundTransparency = 1.000
         Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
         Title.Size = UDim2.new(0, 405, 0, 40)
         Title.Font = Enum.Font.Gotham
         Title.Text = "Keybind"
         Title.TextColor3 = Color3.fromRGB(255, 255, 255)
         Title.TextSize = 15.000
         Title.TextXAlignment = Enum.TextXAlignment.Left
  
         KeybindFrame.Name = "KeybindFrame"
         KeybindFrame.Parent = Keybind
         KeybindFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
         KeybindFrame.Position = UDim2.new(0.650124013, 0, 0.159999996, 0)
         KeybindFrame.Size = UDim2.new(0, 134, 0, 24)
  
         KeybindFrameCorner.CornerRadius = UDim.new(0, 6)
         KeybindFrameCorner.Name = "KeybindFrameCorner"
         KeybindFrameCorner.Parent = KeybindFrame
  
         TextButton.Parent = KeybindFrame
         TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         TextButton.BackgroundTransparency = 1.000
         TextButton.Size = UDim2.new(0, 134, 0, 23)
         TextButton.Font = Enum.Font.Gotham
         TextButton.Text = "Keybind"
         TextButton.TextColor3 = Color3.fromRGB(178, 178, 178)
         TextButton.TextSize = 15.000
  
         KeybindCorner.CornerRadius = UDim.new(0, 6)
         KeybindCorner.Name = "KeybindCorner"
         KeybindCorner.Parent = Keybind
  
         ContainerLayout.Name = "ContainerLayout"
         ContainerLayout.Parent = Container
         ContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
         ContainerLayout.Padding = UDim.new(0, 15)
  
         local UIS = game:GetService('UserInputService')
  
  
         keybind_name = tostring(keybind_name or "New Keybind")
         callback = typeof(callback) == "function" and callback or function()end
         keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
         keybind_options = {
            ["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
         }
  
  
  
         callback = typeof(callback) == "function" and callback or function()end
         keybind_options = typeof(keybind_options) == "table" and keybind_options or {}
         keybind_options = {
            ["standard"] = keybind_options.standard or Enum.KeyCode.RightShift,
         }
  
         local shortkeys = { -- thanks to stroketon for helping me out with this
            RightControl = 'RightCtrl',
            LeftControl = 'LeftCtrl',
            LeftShift = 'LShift',
            RightShift = 'RShift',
            MouseButton1 = "Mouse1",
            MouseButton2 = "Mouse2"
         }
         local checks = {
            binding = false,
  
         }
         function keybind_data:SetKeybind(Keybind)
            local key = shortkeys[Keybind.Name] or Keybind.Name
            TextButton.Text = key
            keybind = Keybind
         end
  
         UIS.InputBegan:Connect(function(a, b)
            if checks.binding then
               spawn(function()
                  wait()
                  checks.binding = false
               end)
               return
            end
            if a.KeyCode == keybind and not b then
               pcall(callback, keybind)
            end
         end)
  
         keybind_data:SetKeybind(keybind_options.standard)
  
         TextButton.MouseButton1Click:Connect(function()
            if checks.binding then return end
            TextButton.Text = "..."
            checks.binding = true
            local a, b = UIS.InputBegan:Wait()
            keybind_data:SetKeybind(a.KeyCode)
         end)
         return keybind_data
      end
  
  
      function ContainerItems:Textbox(text, disapper, callback)
         local Textbox = Instance.new("TextButton")
         local Title = Instance.new("TextLabel")
         local TextboxFrame = Instance.new("Frame")
         local TextboxFrameCorner = Instance.new("UICorner")
         local TextBox = Instance.new("TextBox")
         local TextboxCorner = Instance.new("UICorner")
  
         Textbox.Name = "Textbox"
         Textbox.Parent = Container
         Textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
         Textbox.Position = UDim2.new(-0.747557044, 0, 0.729113936, 0)
         Textbox.Size = UDim2.new(0, 405, 0, 40)
         Textbox.AutoButtonColor = false
         Textbox.Font = Enum.Font.Gotham
         Textbox.Text = ""
         Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
         Textbox.TextSize = 14.000
  
         Title.Name = "Title"
         Title.Parent = Textbox
         Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Title.BackgroundTransparency = 1.000
         Title.Position = UDim2.new(0.0198511165, 0, 0, 0)
         Title.Size = UDim2.new(0, 405, 0, 40)
         Title.Font = Enum.Font.Gotham
         Title.Text = text
         Title.TextColor3 = Color3.fromRGB(255, 255, 255)
         Title.TextSize = 15.000
         Title.TextXAlignment = Enum.TextXAlignment.Left
  
         TextboxFrame.Name = "TextboxFrame"
         TextboxFrame.Parent = Textbox
         TextboxFrame.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
         TextboxFrame.Position = UDim2.new(0.650124013, 0, 0.16, 0)
         TextboxFrame.Size = UDim2.new(0, 134, 0, 24)
  
         TextboxFrameCorner.CornerRadius = UDim.new(0, 6)
         TextboxFrameCorner.Name = "TextboxFrameCorner"
         TextboxFrameCorner.Parent = TextboxFrame
  
         TextBox.Parent = TextboxFrame
         TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         TextBox.BackgroundTransparency = 1.000
         TextBox.Size = UDim2.new(0, 134, 0, 19)
         TextBox.Font = Enum.Font.Gotham
         TextBox.Text = ""
         TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
         TextBox.TextSize = 15.000
  
         TextboxCorner.CornerRadius = UDim.new(0, 6)
         TextboxCorner.Name = "TextboxCorner"
         TextboxCorner.Parent = Textbox
  
         TextBox.FocusLost:Connect(
            function(ep)
               if ep then
                  if #TextBox.Text > 0 then
                     pcall(callback, TextBox.Text)
                     if disapper then
                        TextBox.Text = ""
                     end
                  end
               end
            end
         )
  
         Container.CanvasSize = UDim2.new(0, 0, 0, ContainerLayout.AbsoluteContentSize.Y)
      end
      return ContainerItems
   end
   return Tabs
  end
  local Win = VLib:Window("HavenHub", "v1")
  local CharMods = Win:Tab("Main")

  

Main:Button("Da Hood | Aimlock",function()
loadstring(game:HttpGet("https://www.haven.tk/pastes/tmccmivp.txt",true))()
end)

Main:Button("First Person",function()
loadstring(game:HttpGet("https://pastebin.com/raw/cG6uCWT1",true))()

end)

Main:Button("Arsenal | Aimbot",function()
function getplrsname()
for i,v in pairs(game:GetChildren()) do
if v.ClassName == "Players" then
return v.Name
end
end
end
local players = getplrsname()
local plr = game[players].LocalPlayer
coroutine.resume(coroutine.create(function()
while wait(1) do
coroutine.resume(coroutine.create(function()
for _,v in pairs(game[players]:GetPlayers()) do
if v.Name ~= plr.Name and v.Character then
v.Character.HeadHB.CanCollide = false
v.Character.HeadHB.Transparency = 10
v.Character.HeadHB.Size = Vector3.new(0,0,0)
v.Character.HumanoidRootPart.CanCollide = false
v.Character.HumanoidRootPart.Transparency = 10
v.Character.HumanoidRootPart.Size = Vector3.new(0,0,0)
end
end
end))
end
end))
function CreateSG(name,parent,face)
local SurfaceGui = Instance.new("SurfaceGui",parent)
SurfaceGui.Parent = parent
SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SurfaceGui.Face = Enum.NormalId[face]
SurfaceGui.LightInfluence = 0
SurfaceGui.ResetOnSpawn = false
SurfaceGui.Name = name
SurfaceGui.AlwaysOnTop = true
local Frame = Instance.new("Frame",SurfaceGui)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Size = UDim2.new(1,0,1,0)
end
while wait(1) do
for i,v in pairs (game:GetService("Players"):GetPlayers()) do
if v ~= game:GetService("Players").LocalPlayer and v.Character ~= nil and
v.Character:FindFirstChild("LowerTorso") and v.Character.LowerTorso:FindFirstChild("cham") == nil then
for i,v in pairs (v.Character:GetChildren()) do
if v:IsA("MeshPart") or v.Name == "LowerTorso" then
CreateSG("cham",v,"Back")
CreateSG("cham",v,"Front")
CreateSG("cham",v,"Left")
CreateSG("cham",v,"Right")
CreateSG("cham",v,"Right")
CreateSG("cham",v,"Top")
CreateSG("cham",v,"Bottom")
end
end
end
end
end
end)

Main:Button("Project Bullshit v3",function()
loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY", true))()

end)

Main:Button("Pop-It Simulator | Auto Gems & Cash",function()
game:GetService"RunService".RenderStepped:Connect(function()
local Event = game:GetService("ReplicatedStorage").Remotes.addCash
Event:FireServer()
local A_1 = "cash18"
local Event = game:GetService("ReplicatedStorage").Remotes.pickUpCash
Event:FireServer(A_1)
local A_1 = "gem18"
local Event = game:GetService("ReplicatedStorage").Remotes.addGems
Event:FireServer(A_1)
end)
end)

Main:Button("Legends Re:Written | Gui by senptex",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/LegendsReWritten'),true))()

end)

Main:Button("Ez Hub",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()

end)

Main:Button("Advanced Anti-AFK",function()
for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.Idled)) do
v:Disable()
end
end)

Main:Button("Escape Running Head | All Gamepasses",function()
local Lp = game:GetService("Players").LocalPlayer.GamePasses

Lp.DoubleJump.Value = true
Lp.SkipStage.Value = true
end)

Main:Button("Rate My Avatar | Mass -Rep",function()
local Players = game:GetService("Players"):GetPlayers()
for i, v in pairs(Players) do
  local args = {
      [1] = v,
      [2] = 1
  }
  if v.Name ~= game.Players.LocalPlayer.Name then
     game:GetService("ReplicatedStorage").PostRating:FireServer(unpack(args))
     warn("-rep'd "..v.Name)
  end
end
wait(0.1)
game:GetService('TestService'):Message("-rep'd @everyone ez!! // BlastingStone#8878")
end)

Main:Button("Clicker Madness | Auto Clicker",function()

while wait() do
local ohNumber1 = 9999999999999999

game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.ClickService.Click:FireServer(ohNumber1)
end
end)

Main:Button("Moon Hub | v1.3",function()
loadstring(game:HttpGet("https://pastebin.com/raw/LwQkm563"))();
end)

Main:Button("Citrus Hub",function()
loadstring(game:HttpGet("https://www.haven.tk/pastes/vlyrtfli.txt",true))()

end)

Main:Button("Build & Survive | GUI",function()
--[[
~ Description ~

This is basically just an update to my previous script with some pretty major improvements

To switch the material of the wall click on the "material" button
--------------------------------
~ Game ~

https://www.roblox.com/games/3056526277/Build-and-Survive
--------------------------------
~ Credit ~

Gui - brianops1

Scripter(s) - brianops1 | SilverBeast#1330
--]]

x = -252
y = -8 --starting floor is -8
z = 48 --Change this (by increments of 4) to change where the location of the wall is
amount = 15
WT = .01


_G.KEY = "LeftAlt" -- for the tp to mouse keybind
_G.KEY1 = "H" -- for the Noclip keybind

function define()
plr = game:GetService('Players').LocalPlayer
Root = plr.Character.HumanoidRootPart
UIS = game:GetService("UserInputService")
mouse = plr:GetMouse()
end
print('loading')
repeat
wait()
until pcall(define)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local PreBuilt = Instance.new("Frame")
local EB1 = Instance.new("TextButton")
local Toplabel = Instance.new("TextLabel")
local EB2 = Instance.new("TextButton")
local EB3 = Instance.new("TextButton")
local EB4 = Instance.new("TextButton")
local EB5 = Instance.new("TextButton")
local EB6 = Instance.new("TextButton")
local Bottomlabel = Instance.new("TextLabel")
local Game = Instance.new("TextLabel")
local Minimize = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Credits = Instance.new("TextLabel")
local B1 = Instance.new("TextButton")
local B2 = Instance.new("TextButton")
local B5 = Instance.new("TextButton")
local B8 = Instance.new("TextButton")
local B6 = Instance.new("TextButton")
local B4 = Instance.new("TextButton")
local B7 = Instance.new("TextButton")
local B3 = Instance.new("TextButton")
local BuiltInButton = Instance.new("TextButton")
local Background = Instance.new("ImageLabel")
---------------------Gui Variables----------------------
ScreenGui.Parent = game.CoreGui
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BorderColor3 = Color3.new(1, 0.835294, 0.172549)
MainFrame.BorderSizePixel = 2
MainFrame.Position = UDim2.new(0, 270, 0, 101)
MainFrame.Size = UDim2.new(0, 278, 0, 279)
MainFrame.Selectable = true
MainFrame.Active = true
MainFrame.Draggable = true
PreBuilt.Name = "PreBuilt"
PreBuilt.Parent = MainFrame
PreBuilt.BackgroundColor3 = Color3.new(0.972549, 0.764706, 0.129412)
PreBuilt.BorderSizePixel = 0
PreBuilt.Position = UDim2.new(0, 287, 0, 17)
PreBuilt.Size = UDim2.new(0, 186, 0, 246)
PreBuilt.Visible = false
EB1.Name = "EB1"
EB1.Parent = PreBuilt
EB1.BackgroundColor3 = Color3.new(1, 1, 1)
EB1.BackgroundTransparency = 0.30000001192093
EB1.BorderSizePixel = 0
EB1.Position = UDim2.new(0, 0, 0.117886186, 0)
EB1.Size = UDim2.new(0, 186, 0, 25)
EB1.Font = Enum.Font.SourceSans
EB1.Text = ""
EB1.TextColor3 = Color3.new(0, 0, 0)
EB1.TextSize = 13
Toplabel.Name = "Toplabel"
Toplabel.Parent = PreBuilt
Toplabel.BackgroundColor3 = Color3.new(1, 1, 1)
Toplabel.BackgroundTransparency = 0.20000000298023
Toplabel.BorderSizePixel = 0
Toplabel.Position = UDim2.new(0, 0, -0.008130081, 0)
Toplabel.Size = UDim2.new(0, 186, 0, 25)
Toplabel.Font = Enum.Font.SourceSans
Toplabel.Text = "Built In Scripts"
Toplabel.TextColor3 = Color3.new(0, 0, 0)
Toplabel.TextSize = 14
Toplabel.TextWrapped = true
EB2.Name = "EB2"
EB2.Parent = PreBuilt
EB2.BackgroundColor3 = Color3.new(1, 1, 1)
EB2.BackgroundTransparency = 0.30000001192093
EB2.BorderSizePixel = 0
EB2.Position = UDim2.new(0, 0, 0.243902445, 0)
EB2.Size = UDim2.new(0, 186, 0, 25)
EB2.Font = Enum.Font.SourceSans
EB2.Text = ""
EB2.TextColor3 = Color3.new(0, 0, 0)
EB2.TextSize = 13
EB3.Name = "EB3"
EB3.Parent = PreBuilt
EB3.BackgroundColor3 = Color3.new(1, 1, 1)
EB3.BackgroundTransparency = 0.30000001192093
EB3.BorderSizePixel = 0
EB3.Position = UDim2.new(0, 0, 0, 91)
EB3.Size = UDim2.new(0, 186, 0, 25)
EB3.Font = Enum.Font.SourceSans
EB3.Text = ""
EB3.TextColor3 = Color3.new(0, 0, 0)
EB3.TextSize = 13
EB4.Name = "EB4"
EB4.Parent = PreBuilt
EB4.BackgroundColor3 = Color3.new(1, 1, 1)
EB4.BackgroundTransparency = 0.30000001192093
EB4.BorderSizePixel = 0
EB4.Position = UDim2.new(0, 0, 0.495934963, 0)
EB4.Size = UDim2.new(0, 186, 0, 25)
EB4.Font = Enum.Font.SourceSans
EB4.Text = ""
EB4.TextColor3 = Color3.new(0, 0, 0)
EB4.TextSize = 13
EB5.Name = "EB5"
EB5.Parent = PreBuilt
EB5.BackgroundColor3 = Color3.new(1, 1, 1)
EB5.BackgroundTransparency = 0.30000001192093
EB5.BorderSizePixel = 0
EB5.Position = UDim2.new(0, 0, 0, 153)
EB5.Size = UDim2.new(0, 186, 0, 25)
EB5.Font = Enum.Font.SourceSans
EB5.Text = ""
EB5.TextColor3 = Color3.new(0, 0, 0)
EB5.TextSize = 13
EB6.Name = "EB6"
EB6.Parent = PreBuilt
EB6.BackgroundColor3 = Color3.new(1, 1, 1)
EB6.BackgroundTransparency = 0.30000001192093
EB6.BorderSizePixel = 0
EB6.Position = UDim2.new(0, 0, 0.747967541, 0)
EB6.Size = UDim2.new(0, 186, 0, 25)
EB6.Font = Enum.Font.SourceSans
EB6.Text = ""
EB6.TextColor3 = Color3.new(0, 0, 0)
EB6.TextSize = 13
Bottomlabel.Name = "Bottomlabel"
Bottomlabel.Parent = PreBuilt
Bottomlabel.BackgroundColor3 = Color3.new(1, 1, 1)
Bottomlabel.BackgroundTransparency = 0.20000000298023
Bottomlabel.BorderSizePixel = 0
Bottomlabel.Position = UDim2.new(0, 0, 0.898373961, 0)
Bottomlabel.Size = UDim2.new(0, 186, 0, 25)
Bottomlabel.Font = Enum.Font.SourceSans
Bottomlabel.Text = "Good Scripts to have eh?"
Bottomlabel.TextColor3 = Color3.new(0, 0, 0)
Bottomlabel.TextSize = 13
Game.Name = "Game"
Game.Parent = MainFrame
Game.BackgroundColor3 = Color3.new(1, 1, 1)
Game.BackgroundTransparency = 0.20000000298023
Game.BorderColor3 = Color3.new(1, 1, 1)
Game.BorderSizePixel = 0
Game.Position = UDim2.new(0, 0,0, -2)
Game.Size = UDim2.new(0, 227, 0, 25)
Game.ZIndex = 2
Game.Font = Enum.Font.SourceSans
Game.Text = "Game Name Is Supposed to Be Here"
Game.TextColor3 = Color3.new(0, 0, 0)
Game.TextSize = 13
Game.TextWrapped = true
Minimize.Name = "Minimize"
Minimize.Parent = MainFrame
Minimize.BackgroundColor3 = Color3.new(1, 1, 1)
Minimize.BackgroundTransparency = 0.20000000298023
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0, 227,0, -2)
Minimize.Size = UDim2.new(0, 25, 0, 25)
Minimize.ZIndex = 2
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "-"
Minimize.TextColor3 = Color3.new(0, 0, 0)
Minimize.TextSize = 24
Close.Name = "Close"
Close.Parent = MainFrame
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 0.20000000298023
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0, 251, 0, -2)
Close.Size = UDim2.new(0, 28, 0, 25)
Close.ZIndex = 2
Close.Font = Enum.Font.SourceSans
Close.Text = "x"
Close.TextColor3 = Color3.new(0, 0, 0)
Close.TextSize = 16
Credits.Name = "Credits"
Credits.Parent = MainFrame
Credits.BackgroundColor3 = Color3.new(1, 1, 1)
Credits.BackgroundTransparency = 0.20000000298023
Credits.BorderColor3 = Color3.new(1, 1, 1)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(-0.00359712238, 0, 0.9048931, 0)
Credits.Size = UDim2.new(0, 278, 0, 28)
Credits.ZIndex = 2
Credits.Font = Enum.Font.SourceSans
Credits.Text = "Gui ~ brianops1 | Scripter(s) ~ "
Credits.TextColor3 = Color3.new(0, 0, 0)
Credits.TextSize = 13
Credits.TextWrapped = true
B1.Name = "B1"
B1.Parent = MainFrame
B1.BackgroundColor3 = Color3.new(1, 1, 1)
B1.BackgroundTransparency = 0.20000000298023
B1.BorderColor3 = Color3.new(1, 1, 1)
B1.Position = UDim2.new(0.0242086351, 0, 0.218306571, 0)
B1.Size = UDim2.new(0, 125, 0, 40)
B1.ZIndex = 2
B1.Font = Enum.Font.SourceSans
B1.Text = ""
B1.TextColor3 = Color3.new(0, 0, 0)
B1.TextSize = 13
B1.TextWrapped = true
B2.Name = "B2"
B2.Parent = MainFrame
B2.BackgroundColor3 = Color3.new(1, 1, 1)
B2.BackgroundTransparency = 0.20000000298023
B2.BorderColor3 = Color3.new(1, 1, 1)
B2.Position = UDim2.new(0, 144, 0, 60)
B2.Size = UDim2.new(0, 125, 0, 41)
B2.ZIndex = 2
B2.Font = Enum.Font.SourceSans
B2.Text = ""
B2.TextColor3 = Color3.new(0, 0, 0)
B2.TextSize = 13
B2.TextWrapped = true
B5.Name = "B5"
B5.Parent = MainFrame
B5.BackgroundColor3 = Color3.new(1, 1, 1)
B5.BackgroundTransparency = 0.20000000298023
B5.BorderColor3 = Color3.new(1, 1, 1)
B5.Position = UDim2.new(0.0251798555, 0, 0.559432089, 0)
B5.Size = UDim2.new(0, 125, 0, 40)
B5.ZIndex = 2
B5.Font = Enum.Font.SourceSans
B5.Text = ""
B5.TextColor3 = Color3.new(0, 0, 0)
B5.TextSize = 13
B5.TextWrapped = true
B8.Name = "B8"
B8.Parent = MainFrame
B8.BackgroundColor3 = Color3.new(1, 1, 1)
B8.BackgroundTransparency = 0.20000000298023
B8.BorderColor3 = Color3.new(1, 1, 1)
B8.Position = UDim2.new(0, 144, 0, 204)
B8.Size = UDim2.new(0, 125, 0, 40)
B8.ZIndex = 2
B8.Font = Enum.Font.SourceSans
B8.Text = ""
B8.TextColor3 = Color3.new(0, 0, 0)
B8.TextSize = 13
B8.TextWrapped = true
B6.Name = "B6"
B6.Parent = MainFrame
B6.BackgroundColor3 = Color3.new(1, 1, 1)
B6.BackgroundTransparency = 0.20000000298023
B6.BorderColor3 = Color3.new(1, 1, 1)
B6.Position = UDim2.new(0.517985642, 0, 0.557863712, 0)
B6.Size = UDim2.new(0, 125, 0, 40)
B6.ZIndex = 2
B6.Font = Enum.Font.SourceSans
B6.Text = ""
B6.TextColor3 = Color3.new(0, 0, 0)
B6.TextSize = 13
B6.TextWrapped = true
B4.Name = "B4"
B4.Parent = MainFrame
B4.BackgroundColor3 = Color3.new(1, 1, 1)
B4.BackgroundTransparency = 0.20000000298023
B4.BorderColor3 = Color3.new(1, 1, 1)
B4.Position = UDim2.new(0, 144, 0, 109)
B4.Size = UDim2.new(0, 125, 0, 40)
B4.ZIndex = 2
B4.Font = Enum.Font.SourceSans
B4.Text = ""
B4.TextColor3 = Color3.new(0, 0, 0)
B4.TextSize = 13
B4.TextWrapped = true
B7.Name = "B7"
B7.Parent = MainFrame
B7.BackgroundColor3 = Color3.new(1, 1, 1)
B7.BackgroundTransparency = 0.20000000298023
B7.BorderColor3 = Color3.new(1, 1, 1)
B7.Position = UDim2.new(0.0251798555, 0, 0.731607914, 0)
B7.Size = UDim2.new(0, 125, 0, 40)
B7.ZIndex = 2
B7.Font = Enum.Font.SourceSans
B7.Text = ""
B7.TextColor3 = Color3.new(0, 0, 0)
B7.TextSize = 13
B7.TextWrapped = true
B3.Name = "B3"
B3.Parent = MainFrame
B3.BackgroundColor3 = Color3.new(1, 1, 1)
B3.BackgroundTransparency = 0.20000000298023
B3.BorderColor3 = Color3.new(1, 1, 1)
B3.Position = UDim2.new(0.0251798555, 0, 0.392196536, 0)
B3.Size = UDim2.new(0, 125, 0, 40)
B3.ZIndex = 2
B3.Font = Enum.Font.SourceSans
B3.Text = ""
B3.TextColor3 = Color3.new(0, 0, 0)
B3.TextSize = 13
B3.TextWrapped = true
BuiltInButton.Name = "BuiltInButton"
BuiltInButton.Parent = MainFrame
BuiltInButton.BackgroundColor3 = Color3.new(1, 1, 1)
BuiltInButton.BackgroundTransparency = 0.20000000298023
BuiltInButton.BorderSizePixel = 0
BuiltInButton.Position = UDim2.new(0.0242086723, 0, 0.112921163, 0)
BuiltInButton.Size = UDim2.new(0, 262, 0, 22)
BuiltInButton.ZIndex = 2
BuiltInButton.Font = Enum.Font.SourceSans
BuiltInButton.Text = "Toggle Built-In Gui Scripts"
BuiltInButton.TextColor3 = Color3.new(0, 0, 0)
BuiltInButton.TextSize = 13
BuiltInButton.TextWrapped = true
Background.Name = "Background"
Background.Parent = MainFrame
Background.BackgroundColor3 = Color3.new(1, 1, 1)
Background.BorderSizePixel = 0
Background.LayoutOrder = 1
Background.Size = UDim2.new(0, 277, 0, 281)
Background.Image = "rbxassetid://325122566"
B1.BorderSizePixel = 0
B2.BorderSizePixel = 0
B3.BorderSizePixel = 0
B4.BorderSizePixel = 0
B5.BorderSizePixel = 0
B6.BorderSizePixel = 0
B7.BorderSizePixel = 0
B8.BorderSizePixel = 0
_G.noclip = false
------------------PreBuilt Scripts-----------------------
EB1.Text = "Dex"
EB2.Text = "R2S"
EB3.Text = "Noclip (Default H)"
EB4.Text = "Tp to mouse (Default LeftAlt)"
EB5.Text = "Print/Copy Vector3 position"
EB6.Text = "Baseplate (click again to tp back)"

EB1.MouseButton1Click:connect(function()
loadstring(game:GetObjects('rbxassetid://2180084478')[1].Source)()
end)
EB2.MouseButton1Click:connect(function()
loadstring(game:HttpGet(('https://pastebin.com/raw/PvBGZZdH'),true))()
end)
EB3.MouseButton1Click:connect(function()
UIS.InputBegan:connect(function(Input)
plr = game:GetService('Players').LocalPlayer
UIS = game:GetService("UserInputService")
mouse = plr:GetMouse()
local KeyCode = Input.KeyCode
if KeyCode == Enum.KeyCode[_G.KEY1] and _G.noclip == false then
_G.noclip = true
while _G.noclip do
plr.Character.Humanoid:ChangeState(11)
game:GetService('RunService').Stepped:wait()
end
elseif KeyCode == Enum.KeyCode[_G.KEY1] and _G.noclip then
_G.noclip = false
end
end)
end)
EB4.MouseButton1Click:connect(function()
UIS.InputBegan:connect(function(Input)
plr = game:GetService('Players').LocalPlayer
UIS = game:GetService("UserInputService")
mouse = plr:GetMouse()
local KeyCode = Input.KeyCode
if KeyCode == Enum.KeyCode[_G.KEY] then
local hum = plr.Character.HumanoidRootPart
if mouse.Target then
hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 4, mouse.Hit.z)
end
end
end)
end)
EB5.MouseButton1Click:connect(function()
x = loc(Root.CFrame.x)
y = loc(Root.CFrame.y)
z = loc(Root.CFrame.z)
print('-----------------')
print('Your x value is '.. x)
print('Your y value is '.. y) 
print('Your z value is '.. z) 
pcall(copy,x,y,z)
end)
EB6.MouseButton1Click:connect(function()
local check = game.Workspace:FindFirstChild("BRIAN'S PLATFORM")
if check then
Root.CFrame = _G.StartingPosition
check:Destroy()
else
_G.StartingPosition = Root.CFrame
local P = Instance.new("Part", workspace)
P.Anchored = true
P.CFrame = Root.CFrame * CFrame.new(0, 5500, 0)
P.Name = "BRIAN'S PLATFORM"
P.Size = Vector3.new(80, 1, 80)
Root.CFrame = P.CFrame * CFrame.new(0,5,0)
end
end)

---------------------Functions---------------------------
function VarOff()
_G.on1 = 0
_G.on2 = 0
_G.on3 = 0
_G.on4 = 0
_G.on5 = 0
_G.on6 = 0
_G.on7 = 0
_G.on8 = 0
end
function loc(cframe)
local location = string.find(cframe, ".", 1, true)
if location == nil then
return cframe
end
return string.sub(cframe, 1, location + 1)
end
function copy(x,y,z)
setclipboard(x .. ", " .. y .. ", " .. z)
end
VarOff()
m = 0
Minimize.MouseButton1Click:connect(function()
if m == 0 then
m = 1
opennn = PreBuilt.Visible
B1.Visible = false
B2.Visible = false
B3.Visible = false
B4.Visible = false
B5.Visible = false
B6.Visible = false
B7.Visible = false
B8.Visible = false
BuiltInButton.Visible = false
Credits.Visible = false
PreBuilt.Visible = false
Background.Size = UDim2.new(0,278,0,25)
MainFrame.Size = UDim2.new(0,278,0,25)
else
m = 0
B1.Visible = true
B2.Visible = true
B3.Visible = true
B4.Visible = true
B5.Visible = true
B6.Visible = true
B7.Visible = true
B8.Visible = true
BuiltInButton.Visible = true
Credits.Visible = true
PreBuilt.Visible = opennn
Background.Size = UDim2.new(0,278,0,281)
MainFrame.Size = UDim2.new(0,278,0,279)
end
end)
Close.MouseButton1Click:connect(function()
VarOff()
ScreenGui:Destroy()
end)
builtin = 0
BuiltInButton.MouseButton1Click:connect(function()
if builtin == 0 then
builtin = 1
PreBuilt.Visible = true
else
builtin = 0
PreBuilt.Visible = false
end
end)
function ON(button)
if button.Name == "B1" then
_G.on1 = 1
elseif button.Name == "B2" then
_G.on2 = 1
elseif button.Name == "B3" then
_G.on3 = 1
elseif button.Name == "B4" then
_G.on4 = 1
elseif button.Name == "B5" then
_G.on5 = 1
elseif button.Name == "B6" then
_G.on6 = 1
elseif button.Name == "B7" then
_G.on7 = 1
elseif button.Name == "B8" then
_G.on8 = 1
end
button.BorderSizePixel = 2
button.BorderColor3 = Color3.fromRGB(0, 0, 0)
end
function OFF(button)
if button.Name == "B1" then
_G.on1 = 0
elseif button.Name == "B2" then
_G.on2 = 0
elseif button.Name == "B3" then
_G.on3 = 0
elseif button.Name == "B4" then
_G.on4 = 0
elseif button.Name == "B5" then
_G.on5 = 0
elseif button.Name == "B6" then
_G.on6 = 0
elseif button.Name == "B7" then
_G.on7 = 0
elseif button.Name == "B8" then
_G.on8 = 0
end
button.BorderSizePixel = 0
button.BorderColor3 = Color3.fromRGB(255, 255, 255)
end
function attack(v)
    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
local killEvent = game:GetService("Workspace")["__THINGS"]["__REMOTES"].mobdodamage
killEvent:FireServer({ { { { v, v.Humanoid.Health } } }, { false } })
    end
end
function place(m,x,y,z)
local mod = Instance.new("Model",game:GetService("Workspace")["__DEBRIS"])
mod.Name = m
local part = Instance.new("Part",mod)
part.Name = "Part"
local A_1 = 
{
[1] = 
{
[1] = CFrame.new(x, y, z, 1, 0, 0, 0, 1, 0, 0, 0, 1), 
[2] = m, 
[3] = game:GetService("Workspace")["__DEBRIS"][m].Part
}, 
[2] = 
{
[1] = false, 
[2] = false, 
[3] = false
}
}
local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"].placeblock
Event:FireServer(A_1)
mod:Destroy()
end
---------------------Main Code---------------------------

Game.Text = "Build and Survive!" -- Game name here

Credits.Text = Credits.Text .. "brianops1 | SilverBeast" --Scripter(s) name(s) here


B1.Text = "Auto Collect Drops" --Script Names go here
B2.Text = "Kill Auara (40 studs radius)"
B3.Text = "Loop Kill All Monsters"
B4.Text = "Kill monsters past loot drop point"
B5.Text = "Autoheal yourself"
B6.Text = "Autoheal Everyone"
B7.Text = "Material: Wood"
B8.Text = "Place Wall Wood"


B1.MouseButton1Click:connect(function()
if _G.on1 == 1 then
OFF(B1)
else
ON(B1)
while _G.on1 == 1 do
wait()
for i,v in pairs(game.Workspace["__DEBRIS"].MonsterDrops:GetChildren()) do 
if v then 
wait(.05)
v.CFrame = Root.CFrame
end
end
end
OFF(B1)
end
end)

B2.MouseButton1Click:connect(function()
if _G.on2 == 1 then
OFF(B2)
else
ON(B2)
while _G.on2 == 1 do
wait()
for i,v in pairs(game.Workspace["__THINGS"].Monsters:GetChildren()) do 
if v and v:FindFirstChild("HumanoidRootPart") and (Root.Position - v.HumanoidRootPart.Position).Magnitude < 40 then 
attack(v)
end
end
end
OFF(B2)
end
end)

B3.MouseButton1Click:connect(function()
if _G.on3 == 1 then
OFF(B3)
else
ON(B3)
game:GetService('RunService').Stepped:wait()
while _G.on3 == 1 do
wait()
for i,v in pairs(game.Workspace["__THINGS"].Monsters:GetChildren()) do 
if v then 
attack(v)
end
end
end
OFF(B3)
end
end)



B4.MouseButton1Click:connect(function()
if _G.on4 == 1 then
OFF(B4)
else
ON(B4)
while _G.on4 == 1 do
wait()
for i,v in pairs(game.Workspace["__THINGS"].Monsters:GetChildren()) do 
    if v and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.CFrame.z > -130 then 
        attack(v)
    end
end
end
OFF(B4)
end
end)

B5.MouseButton1Click:connect(function()
if _G.on5 == 1 then
OFF(B5)
else
ON(B5)
while _G.on5 == 1 do
wait()
for i,v in pairs(game.Players:GetChildren()) do 
for a,b in pairs(game.Workspace:GetChildren()) do 
if b.Name == plr.Name then
local A_1 = 
{
[1] = 
{
[1] = "Heal", 
[2] = b
}, 
[2] = 
{
[1] = false, 
[2] = false
}
}
local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"].upgradefxserver
Event:FireServer(A_1)
        end
    end
end
end
OFF(B5)
end
end)

B6.MouseButton1Click:connect(function()
if _G.on6 == 1 then
OFF(B6)
else
ON(B6)
game:GetService('RunService').Stepped:wait()
while _G.on6 == 1 do
wait()
for i,v in pairs(game.Players:GetChildren()) do 
for a,b in pairs(game.Workspace:GetChildren()) do 
if v.Name == b.Name then
local A_1 = 
{
[1] = 
{
[1] = "Heal", 
[2] = b
}, 
[2] = 
{
[1] = false, 
[2] = false
}
}
local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"].upgradefxserver
Event:FireServer(A_1)
        end
    end
end
end
OFF(B6)
end
end)

_G.Material = "Wood"
_G.ITERS = 1
B7.MouseButton1Click:connect(function()
if _G.on7 == 1 then
OFF(B7)
else
ON(B7)
game:GetService('RunService').Stepped:wait()
if _G.ITERS == 1 then
_G.ITERS = 2
B7.Text = "Material: Brick"
B8.Text = "Place Wall Brick"
_G.Material = "Brick"
elseif _G.ITERS == 2 then
_G.ITERS = 3
B7.Text = "Material: Metal"
B8.Text = "Place Wall Metal"
_G.Material = "Metal"
elseif _G.ITERS == 3 then
_G.ITERS = 4
B7.Text = "Material: Obsidian"
B8.Text = "Place Wall Obsidian"
_G.Material = "Obsidian"
elseif _G.ITERS == 4 then
_G.ITERS = 5
B7.Text = "Material: Firebrick"
B8.Text = "Place Wall Firebrick"
_G.Material = "Firebrick"
elseif _G.ITERS == 5 then
_G.ITERS = 1
B7.Text = "Material: Wood"
B8.Text = "Place Wall Wood"
_G.Material = "Wood"
end
OFF(B7)
end
end)

B8.MouseButton1Click:connect(function()
if _G.on8 == 1 then
OFF(B8)
else
ON(B8)
game:GetService('RunService').Stepped:wait()
newz = z
for a = 1,amount do
if _G.on8 == 1 then
newx = x
newy = y
newz = newz + 4
for i = 1, 90 do
if _G.on8 == 1 then
wait(WT)
newx = newx + 4
place(_G.Material,newx,y,newz)
newy = y + 4
place(_G.Material,newx,newy,newz)
end
end
end
end
OFF(B8)
end
end)


print('loaded')
end)

Main:Button("MXS Hub",function()
loadstring(game:HttpGet("https://pastebin.com/raw/jYJsBA1A", true))()
end)

Main:Button("Giant Simulator | GUI",function()
local ScreenGui = Instance.new("ScreenGui")
local Topbar = Instance.new("ImageLabel")
local MainContainer = Instance.new("ImageLabel")
local Main = Instance.new("ScrollingFrame")
local AutoSwing = Instance.new("ImageLabel")
local AutoSwingText = Instance.new("TextLabel")
local AutoSwingSlidingButton = Instance.new("TextButton")
local AutoSwingSlidingButton_Roundify_12px = Instance.new("ImageLabel")
local AutoArena = Instance.new("ImageLabel")
local AutoArenaText = Instance.new("TextLabel")
local AutoArenaSlidingButton = Instance.new("TextButton")
local AutoArenaSlidingButton_Roundify_12px = Instance.new("ImageLabel")
local AutoBorock = Instance.new("ImageLabel")
local AutoBorockText = Instance.new("TextLabel")
local AutoBorockSlidingButton = Instance.new("TextButton")
local AutoBorockSlidingButton_Roundify_12px = Instance.new("ImageLabel")
local AutoDemonKing = Instance.new("ImageLabel")
local AutoDemonKingText = Instance.new("TextLabel")
local AutoDemonKingSlidingButton = Instance.new("TextButton")
local AutoDemonKingSlidingButton_Roundify_12px = Instance.new("ImageLabel")
local GoldenEgg = Instance.new("TextButton")
local GoldenEgg_Roundify_12px = Instance.new("ImageLabel")
local GoldenEggText = Instance.new("TextLabel")
local InstantQuest = Instance.new("TextButton")
local InstantQuest_Roundify_12px = Instance.new("ImageLabel")
local InstantQuest_2 = Instance.new("TextLabel")
local Crates = Instance.new("Frame")
local _100Kweapon = Instance.new("TextButton")
local _100Kweapon_Roundify_12px = Instance.new("ImageLabel")
local _100KweaponText = Instance.new("TextLabel")
local _100Kskin = Instance.new("TextButton")
local _100Kskin_Roundify_12px = Instance.new("ImageLabel")
local _100KskinText = Instance.new("TextLabel")
local _10Mskin = Instance.new("TextButton")
local _10Mskin_Roundify_12px = Instance.new("ImageLabel")
local _10MskinText = Instance.new("TextLabel")
local _20Mpet = Instance.new("TextButton")
local _20Mpet_Roundify_12px = Instance.new("ImageLabel")
local _20MpetText = Instance.new("TextLabel")
local TabContainerTweeningButton = Instance.new("ImageButton")
local TabContainer = Instance.new("Frame")
local Maintab = Instance.new("TextButton")
local Cratestab = Instance.new("TextButton")
local UIListLayout = Instance.new("UIListLayout")
local close = Instance.new("ImageButton")
local Visible = Instance.new("TextButton")
local Visible_Roundify_4px = Instance.new("ImageLabel")

ScreenGui.Parent = game.CoreGui

Topbar.Name = "Topbar"
Topbar.Parent = ScreenGui
Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topbar.BackgroundTransparency = 1.000
Topbar.Position = UDim2.new(0.369244128, 0, 0.322845399, 0)
Topbar.Size = UDim2.new(0, 300, 0, 30)
Topbar.Image = "rbxassetid://3570695787"
Topbar.ImageColor3 = Color3.fromRGB(35, 35, 35)
Topbar.ScaleType = Enum.ScaleType.Slice
Topbar.SliceCenter = Rect.new(100, 100, 100, 100)
Topbar.SliceScale = 0.040
Topbar.Active = true
Topbar.Draggable = true

MainContainer.Name = "MainContainer"
MainContainer.Parent = Topbar
MainContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainContainer.BackgroundTransparency = 1.000
MainContainer.Position = UDim2.new(0, 0, 0.980802894, 0)
MainContainer.Size = UDim2.new(0, 298, 0, 180)
MainContainer.Image = "rbxassetid://3570695787"
MainContainer.ImageColor3 = Color3.fromRGB(35, 35, 35)
MainContainer.ScaleType = Enum.ScaleType.Slice
MainContainer.SliceCenter = Rect.new(100, 100, 100, 100)
MainContainer.SliceScale = 0.040

Main.Name = "Main"
Main.Parent = MainContainer
Main.Active = true
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Main.BorderColor3 = Color3.fromRGB(45, 45, 45)
Main.Size = UDim2.new(0, 300, 0, 180)
Main.CanvasSize = UDim2.new(0, 0, 8, 0)
Main.ScrollBarThickness = 7

AutoSwing.Name = "AutoSwing"
AutoSwing.Parent = Main
AutoSwing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoSwing.BackgroundTransparency = 1.000
AutoSwing.Position = UDim2.new(0.110000007, 0, 0.0111111151, 0)
AutoSwing.Size = UDim2.new(0, 241, 0, 40)
AutoSwing.Image = "rbxassetid://3570695787"
AutoSwing.ImageColor3 = Color3.fromRGB(60, 60, 60)
AutoSwing.ScaleType = Enum.ScaleType.Slice
AutoSwing.SliceCenter = Rect.new(100, 100, 100, 100)
AutoSwing.SliceScale = 0.080

AutoSwingText.Name = "AutoSwingText"
AutoSwingText.Parent = AutoSwing
AutoSwingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoSwingText.BackgroundTransparency = 1.000
AutoSwingText.Size = UDim2.new(0, 100, 0, 40)
AutoSwingText.Font = Enum.Font.FredokaOne
AutoSwingText.Text = "Auto Swing"
AutoSwingText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoSwingText.TextSize = 14.000

AutoSwingSlidingButton.Name = "AutoSwingSlidingButton"
AutoSwingSlidingButton.Parent = AutoSwing
AutoSwingSlidingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoSwingSlidingButton.BackgroundTransparency = 1.000
AutoSwingSlidingButton.BorderSizePixel = 0
AutoSwingSlidingButton.Position = UDim2.new(0.639004171, 0, 0.224999994, 0)
AutoSwingSlidingButton.Size = UDim2.new(0, 22, 0, 22)
AutoSwingSlidingButton.Font = Enum.Font.SourceSans
AutoSwingSlidingButton.Text = ""
AutoSwingSlidingButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoSwingSlidingButton.TextSize = 14.000
local on = false

AutoSwingSlidingButton.MouseButton1Click:Connect(function()
	on = not on
	if on then
		AutoSwingSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(0,225,0)
		on = true
		_G.SwingLoop = true
		while _G.SwingLoop do
			wait()
			game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAttackStart:FireServer()
			game.ReplicatedStorage.Aero.AeroRemoteServices.GameService.WeaponAnimComplete:FireServer()
		end
	end
	if on == false then
		AutoSwingSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(225,0,0)
		on = false
		_G.SwingLoop = false
	end
end)

AutoSwingSlidingButton_Roundify_12px.Name = "AutoSwingSlidingButton_Roundify_12px"
AutoSwingSlidingButton_Roundify_12px.Parent = AutoSwingSlidingButton
AutoSwingSlidingButton_Roundify_12px.Active = true
AutoSwingSlidingButton_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
AutoSwingSlidingButton_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoSwingSlidingButton_Roundify_12px.BackgroundTransparency = 1.000
AutoSwingSlidingButton_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
AutoSwingSlidingButton_Roundify_12px.Selectable = true
AutoSwingSlidingButton_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
AutoSwingSlidingButton_Roundify_12px.Image = "rbxassetid://3570695787"
AutoSwingSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(225, 0, 0)
AutoSwingSlidingButton_Roundify_12px.ScaleType = Enum.ScaleType.Slice
AutoSwingSlidingButton_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
AutoSwingSlidingButton_Roundify_12px.SliceScale = 0.120

AutoArena.Name = "AutoArena"
AutoArena.Parent = Main
AutoArena.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoArena.BackgroundTransparency = 1.000
AutoArena.Position = UDim2.new(0.110000007, 0, 0.0486111231, 0)
AutoArena.Size = UDim2.new(0, 241, 0, 40)
AutoArena.Image = "rbxassetid://3570695787"
AutoArena.ImageColor3 = Color3.fromRGB(60, 60, 60)
AutoArena.ScaleType = Enum.ScaleType.Slice
AutoArena.SliceCenter = Rect.new(100, 100, 100, 100)
AutoArena.SliceScale = 0.080

AutoArenaText.Name = "AutoArenaText"
AutoArenaText.Parent = AutoArena
AutoArenaText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoArenaText.BackgroundTransparency = 1.000
AutoArenaText.Size = UDim2.new(0, 100, 0, 40)
AutoArenaText.Font = Enum.Font.FredokaOne
AutoArenaText.Text = "Auto Arena"
AutoArenaText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoArenaText.TextSize = 14.000

AutoArenaSlidingButton.Name = "AutoArenaSlidingButton"
AutoArenaSlidingButton.Parent = AutoArena
AutoArenaSlidingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoArenaSlidingButton.BackgroundTransparency = 1.000
AutoArenaSlidingButton.BorderSizePixel = 0
AutoArenaSlidingButton.Position = UDim2.new(0.639004171, 0, 0.224999994, 0)
AutoArenaSlidingButton.Size = UDim2.new(0, 22, 0, 22)
AutoArenaSlidingButton.Font = Enum.Font.SourceSans
AutoArenaSlidingButton.Text = ""
AutoArenaSlidingButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoArenaSlidingButton.TextSize = 14.000
local on = false

AutoArenaSlidingButton.MouseButton1Click:Connect(function()
	on = not on
	if on then
		AutoArenaSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(0,225,0)
		on = true
		_G.Arena = true

		while _G.Arena do
			wait()
			local A_1 = true
			game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.ArenaService.ArenaChoice:FireServer(A_1)
		end
	end
	if on == false then
		AutoArenaSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(225,0,0)
		on = false
		_G.Arena = false
	end
end)

AutoArenaSlidingButton_Roundify_12px.Name = "AutoArenaSlidingButton_Roundify_12px"
AutoArenaSlidingButton_Roundify_12px.Parent = AutoArenaSlidingButton
AutoArenaSlidingButton_Roundify_12px.Active = true
AutoArenaSlidingButton_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
AutoArenaSlidingButton_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoArenaSlidingButton_Roundify_12px.BackgroundTransparency = 1.000
AutoArenaSlidingButton_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
AutoArenaSlidingButton_Roundify_12px.Selectable = true
AutoArenaSlidingButton_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
AutoArenaSlidingButton_Roundify_12px.Image = "rbxassetid://3570695787"
AutoArenaSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(225, 0, 0)
AutoArenaSlidingButton_Roundify_12px.ScaleType = Enum.ScaleType.Slice
AutoArenaSlidingButton_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
AutoArenaSlidingButton_Roundify_12px.SliceScale = 0.120

AutoBorock.Name = "AutoBorock"
AutoBorock.Parent = Main
AutoBorock.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoBorock.BackgroundTransparency = 1.000
AutoBorock.Position = UDim2.new(0.110000007, 0, 0.0854166746, 0)
AutoBorock.Size = UDim2.new(0, 241, 0, 40)
AutoBorock.Image = "rbxassetid://3570695787"
AutoBorock.ImageColor3 = Color3.fromRGB(60, 60, 60)
AutoBorock.ScaleType = Enum.ScaleType.Slice
AutoBorock.SliceCenter = Rect.new(100, 100, 100, 100)
AutoBorock.SliceScale = 0.080

AutoBorockText.Name = "AutoBorockText"
AutoBorockText.Parent = AutoBorock
AutoBorockText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoBorockText.BackgroundTransparency = 1.000
AutoBorockText.Size = UDim2.new(0, 100, 0, 40)
AutoBorockText.Font = Enum.Font.FredokaOne
AutoBorockText.Text = "Auto Borock"
AutoBorockText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoBorockText.TextSize = 14.000

AutoBorockSlidingButton.Name = "AutoBorockSlidingButton"
AutoBorockSlidingButton.Parent = AutoBorock
AutoBorockSlidingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoBorockSlidingButton.BackgroundTransparency = 1.000
AutoBorockSlidingButton.BorderSizePixel = 0
AutoBorockSlidingButton.Position = UDim2.new(0.639004171, 0, 0.224999994, 0)
AutoBorockSlidingButton.Size = UDim2.new(0, 22, 0, 22)
AutoBorockSlidingButton.Font = Enum.Font.SourceSans
AutoBorockSlidingButton.Text = ""
AutoBorockSlidingButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoBorockSlidingButton.TextSize = 14.000
local on = false

AutoBorockSlidingButton.MouseButton1Click:Connect(function()
	on = not on
	if on then
		AutoBorockSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(0,225,0)
		on = true
		_G.AutoBorock = true

		while _G.AutoBorock do
			wait()
			for i,v in pairs(game:GetService("Workspace").NPC:GetDescendants()) do
				if v.ClassName == "Model" and v.Name == "Borock" then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
				end
			end
		end
	end
	if on == false then
		AutoBorockSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(225,0,0)
		on = false
		_G.AutoBorock = false
	end
end)

AutoBorockSlidingButton_Roundify_12px.Name = "AutoBorockSlidingButton_Roundify_12px"
AutoBorockSlidingButton_Roundify_12px.Parent = AutoBorockSlidingButton
AutoBorockSlidingButton_Roundify_12px.Active = true
AutoBorockSlidingButton_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
AutoBorockSlidingButton_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoBorockSlidingButton_Roundify_12px.BackgroundTransparency = 1.000
AutoBorockSlidingButton_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
AutoBorockSlidingButton_Roundify_12px.Selectable = true
AutoBorockSlidingButton_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
AutoBorockSlidingButton_Roundify_12px.Image = "rbxassetid://3570695787"
AutoBorockSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(225, 0, 0)
AutoBorockSlidingButton_Roundify_12px.ScaleType = Enum.ScaleType.Slice
AutoBorockSlidingButton_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
AutoBorockSlidingButton_Roundify_12px.SliceScale = 0.120

AutoDemonKing.Name = "AutoDemonKing"
AutoDemonKing.Parent = Main
AutoDemonKing.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoDemonKing.BackgroundTransparency = 1.000
AutoDemonKing.Position = UDim2.new(0.110000007, 0, 0.122916676, 0)
AutoDemonKing.Size = UDim2.new(0, 241, 0, 40)
AutoDemonKing.Image = "rbxassetid://3570695787"
AutoDemonKing.ImageColor3 = Color3.fromRGB(60, 60, 60)
AutoDemonKing.ScaleType = Enum.ScaleType.Slice
AutoDemonKing.SliceCenter = Rect.new(100, 100, 100, 100)
AutoDemonKing.SliceScale = 0.080

AutoDemonKingText.Name = "AutoDemonKingText"
AutoDemonKingText.Parent = AutoDemonKing
AutoDemonKingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoDemonKingText.BackgroundTransparency = 1.000
AutoDemonKingText.Size = UDim2.new(0, 110, 0, 40)
AutoDemonKingText.Font = Enum.Font.FredokaOne
AutoDemonKingText.Text = "  Auto Demon King"
AutoDemonKingText.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoDemonKingText.TextSize = 14.000

AutoDemonKingSlidingButton.Name = "AutoDemonKingSlidingButton"
AutoDemonKingSlidingButton.Parent = AutoDemonKing
AutoDemonKingSlidingButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoDemonKingSlidingButton.BackgroundTransparency = 1.000
AutoDemonKingSlidingButton.BorderSizePixel = 0
AutoDemonKingSlidingButton.Position = UDim2.new(0.639004171, 0, 0.224999994, 0)
AutoDemonKingSlidingButton.Size = UDim2.new(0, 22, 0, 22)
AutoDemonKingSlidingButton.Font = Enum.Font.SourceSans
AutoDemonKingSlidingButton.Text = ""
AutoDemonKingSlidingButton.TextColor3 = Color3.fromRGB(0, 0, 0)
AutoDemonKingSlidingButton.TextSize = 14.000
local on = false

AutoDemonKingSlidingButton.MouseButton1Click:Connect(function()
	on = not on
	if on then
		AutoDemonKingSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(0,225,0)
		on = true
		_G.AutoDemonKing = true

		while _G.AutoDemonKing do
			wait()
			for i,v in pairs(game:GetService("Workspace").NPC:GetDescendants()) do
				if v.ClassName == "Model" and v.Name == "DemonKing" then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
				end
			end
		end
	end
	if on == false then
		AutoDemonKingSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(225,0,0)
		on = false
		_G.AutoDemonKing = false
	end
end)

AutoDemonKingSlidingButton_Roundify_12px.Name = "AutoDemonKingSlidingButton_Roundify_12px"
AutoDemonKingSlidingButton_Roundify_12px.Parent = AutoDemonKingSlidingButton
AutoDemonKingSlidingButton_Roundify_12px.Active = true
AutoDemonKingSlidingButton_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
AutoDemonKingSlidingButton_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoDemonKingSlidingButton_Roundify_12px.BackgroundTransparency = 1.000
AutoDemonKingSlidingButton_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
AutoDemonKingSlidingButton_Roundify_12px.Selectable = true
AutoDemonKingSlidingButton_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
AutoDemonKingSlidingButton_Roundify_12px.Image = "rbxassetid://3570695787"
AutoDemonKingSlidingButton_Roundify_12px.ImageColor3 = Color3.fromRGB(225, 0, 0)
AutoDemonKingSlidingButton_Roundify_12px.ScaleType = Enum.ScaleType.Slice
AutoDemonKingSlidingButton_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
AutoDemonKingSlidingButton_Roundify_12px.SliceScale = 0.120

GoldenEgg.Name = "GoldenEgg"
GoldenEgg.Parent = Main
GoldenEgg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GoldenEgg.BackgroundTransparency = 1.000
GoldenEgg.BorderSizePixel = 0
GoldenEgg.Position = UDim2.new(0.210000008, 0, 0.165277779, 0)
GoldenEgg.Size = UDim2.new(0, 175, 0, 35)
GoldenEgg.Font = Enum.Font.SourceSans
GoldenEgg.TextColor3 = Color3.fromRGB(0, 0, 0)
GoldenEgg.TextSize = 14.000
GoldenEgg.MouseButton1Click:connect(function()
	for i,v in pairs(game.Workspace:GetChildren())do
		if v.Name == "Egg" then
			v.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
		end
	end
end)

GoldenEgg_Roundify_12px.Name = "GoldenEgg_Roundify_12px"
GoldenEgg_Roundify_12px.Parent = GoldenEgg
GoldenEgg_Roundify_12px.Active = true
GoldenEgg_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
GoldenEgg_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GoldenEgg_Roundify_12px.BackgroundTransparency = 1.000
GoldenEgg_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
GoldenEgg_Roundify_12px.Selectable = true
GoldenEgg_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
GoldenEgg_Roundify_12px.Image = "rbxassetid://3570695787"
GoldenEgg_Roundify_12px.ImageColor3 = Color3.fromRGB(60, 60, 60)
GoldenEgg_Roundify_12px.ScaleType = Enum.ScaleType.Slice
GoldenEgg_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
GoldenEgg_Roundify_12px.SliceScale = 0.120

GoldenEggText.Name = "GoldenEggText"
GoldenEggText.Parent = GoldenEgg
GoldenEggText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GoldenEggText.BackgroundTransparency = 1.000
GoldenEggText.Size = UDim2.new(0, 175, 0, 35)
GoldenEggText.Font = Enum.Font.FredokaOne
GoldenEggText.Text = "Golden Egg"
GoldenEggText.TextColor3 = Color3.fromRGB(255, 255, 255)
GoldenEggText.TextSize = 14.000

InstantQuest.Name = "Instant Quest"
InstantQuest.Parent = Main
InstantQuest.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InstantQuest.BackgroundTransparency = 1.000
InstantQuest.BorderSizePixel = 0
InstantQuest.Position = UDim2.new(0.210000008, 0, 0.200000003, 0)
InstantQuest.Size = UDim2.new(0, 175, 0, 35)
InstantQuest.Font = Enum.Font.SourceSans
InstantQuest.TextColor3 = Color3.fromRGB(0, 0, 0)
InstantQuest.TextSize = 14.000
InstantQuest.MouseButton1Click:Connect(function()
for i = 50, 250 do
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.StartQuestRequest
	Event:InvokeServer()
	wait()
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.EndQuestRequest
	Event:InvokeServer()
    end
end)

InstantQuest_Roundify_12px.Name = "Instant Quest_Roundify_12px"
InstantQuest_Roundify_12px.Parent = InstantQuest
InstantQuest_Roundify_12px.Active = true
InstantQuest_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
InstantQuest_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InstantQuest_Roundify_12px.BackgroundTransparency = 1.000
InstantQuest_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
InstantQuest_Roundify_12px.Selectable = true
InstantQuest_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
InstantQuest_Roundify_12px.Image = "rbxassetid://3570695787"
InstantQuest_Roundify_12px.ImageColor3 = Color3.fromRGB(60, 60, 60)
InstantQuest_Roundify_12px.ScaleType = Enum.ScaleType.Slice
InstantQuest_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
InstantQuest_Roundify_12px.SliceScale = 0.120

InstantQuest_2.Name = "Instant Quest"
InstantQuest_2.Parent = InstantQuest
InstantQuest_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InstantQuest_2.BackgroundTransparency = 1.000
InstantQuest_2.Size = UDim2.new(0, 175, 0, 35)
InstantQuest_2.Font = Enum.Font.FredokaOne
InstantQuest_2.Text = "Instant Quest"
InstantQuest_2.TextColor3 = Color3.fromRGB(255, 255, 255)
InstantQuest_2.TextSize = 14.000

Crates.Name = "Crates"
Crates.Parent = MainContainer
Crates.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Crates.BorderColor3 = Color3.fromRGB(45, 45, 45)
Crates.Size = UDim2.new(0, 298, 0, 180)
Crates.Visible = false

_100Kweapon.Name = "100Kweapon"
_100Kweapon.Parent = Crates
_100Kweapon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_100Kweapon.BackgroundTransparency = 1.000
_100Kweapon.BorderSizePixel = 0
_100Kweapon.Position = UDim2.new(0.167785242, 0, 0.088888891, 0)
_100Kweapon.Size = UDim2.new(0, 200, 0, 30)
_100Kweapon.Font = Enum.Font.SourceSans
_100Kweapon.TextColor3 = Color3.fromRGB(0, 0, 0)
_100Kweapon.TextSize = 14.000
_100Kweapon.MouseButton1Click:connect(function()
	local A_1 = "weapon"
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.OpenLegendaryCrate
	Event:InvokeServer(A_1)
end)

_100Kweapon_Roundify_12px.Name = "100Kweapon_Roundify_12px"
_100Kweapon_Roundify_12px.Parent = _100Kweapon
_100Kweapon_Roundify_12px.Active = true
_100Kweapon_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
_100Kweapon_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_100Kweapon_Roundify_12px.BackgroundTransparency = 1.000
_100Kweapon_Roundify_12px.Position = UDim2.new(0.495000005, 0, 0.5, 0)
_100Kweapon_Roundify_12px.Selectable = true
_100Kweapon_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
_100Kweapon_Roundify_12px.Image = "rbxassetid://3570695787"
_100Kweapon_Roundify_12px.ScaleType = Enum.ScaleType.Slice
_100Kweapon_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
_100Kweapon_Roundify_12px.SliceScale = 0.120

_100KweaponText.Name = "100KweaponText"
_100KweaponText.Parent = _100Kweapon
_100KweaponText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_100KweaponText.BackgroundTransparency = 1.000
_100KweaponText.Position = UDim2.new(-0.00499999989, 0, 0, 0)
_100KweaponText.Size = UDim2.new(0, 200, 0, 30)
_100KweaponText.Font = Enum.Font.FredokaOne
_100KweaponText.Text = "100K Legendary Weapon Crate"
_100KweaponText.TextColor3 = Color3.fromRGB(0, 0, 0)
_100KweaponText.TextSize = 14.000

_100Kskin.Name = "100Kskin"
_100Kskin.Parent = Crates
_100Kskin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_100Kskin.BackgroundTransparency = 1.000
_100Kskin.BorderSizePixel = 0
_100Kskin.Position = UDim2.new(0.167785242, 0, 0.377777785, 0)
_100Kskin.Size = UDim2.new(0, 200, 0, 30)
_100Kskin.Font = Enum.Font.SourceSans
_100Kskin.TextColor3 = Color3.fromRGB(0, 0, 0)
_100Kskin.TextSize = 14.000
_100Kskin.MouseButton1Click:connect(function()
	local A_1 = "skin"
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.OpenLegendaryCrate
	Event:InvokeServer(A_1)
end)

_100Kskin_Roundify_12px.Name = "100Kskin_Roundify_12px"
_100Kskin_Roundify_12px.Parent = _100Kskin
_100Kskin_Roundify_12px.Active = true
_100Kskin_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
_100Kskin_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_100Kskin_Roundify_12px.BackgroundTransparency = 1.000
_100Kskin_Roundify_12px.Position = UDim2.new(0.495000005, 0, 0.266666651, 0)
_100Kskin_Roundify_12px.Selectable = true
_100Kskin_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
_100Kskin_Roundify_12px.Image = "rbxassetid://3570695787"
_100Kskin_Roundify_12px.ScaleType = Enum.ScaleType.Slice
_100Kskin_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
_100Kskin_Roundify_12px.SliceScale = 0.120

_100KskinText.Name = "100KskinText"
_100KskinText.Parent = _100Kskin
_100KskinText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_100KskinText.BackgroundTransparency = 1.000
_100KskinText.Position = UDim2.new(-0.00499999523, 0, -0.233333111, 0)
_100KskinText.Size = UDim2.new(0, 200, 0, 30)
_100KskinText.Font = Enum.Font.FredokaOne
_100KskinText.Text = "100K Legendary Skin Crate"
_100KskinText.TextColor3 = Color3.fromRGB(0, 0, 0)
_100KskinText.TextSize = 14.000

_10Mskin.Name = "10Mskin"
_10Mskin.Parent = Crates
_10Mskin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_10Mskin.BackgroundTransparency = 1.000
_10Mskin.BorderSizePixel = 0
_10Mskin.Position = UDim2.new(0.174496651, 0, 0.583333313, 0)
_10Mskin.Size = UDim2.new(0, 200, 0, 30)
_10Mskin.Font = Enum.Font.SourceSans
_10Mskin.TextColor3 = Color3.fromRGB(0, 0, 0)
_10Mskin.TextSize = 14.000
_10Mskin.MouseButton1Click:connect(function()
	local A_1 = "skin"
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.OpenMythicCrate
	Event:InvokeServer(A_1)
end)

_10Mskin_Roundify_12px.Name = "10Mskin_Roundify_12px"
_10Mskin_Roundify_12px.Parent = _10Mskin
_10Mskin_Roundify_12px.Active = true
_10Mskin_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
_10Mskin_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_10Mskin_Roundify_12px.BackgroundTransparency = 1.000
_10Mskin_Roundify_12px.Position = UDim2.new(0.485000014, 0, 0.5, 0)
_10Mskin_Roundify_12px.Selectable = true
_10Mskin_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
_10Mskin_Roundify_12px.Image = "rbxassetid://3570695787"
_10Mskin_Roundify_12px.ScaleType = Enum.ScaleType.Slice
_10Mskin_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
_10Mskin_Roundify_12px.SliceScale = 0.120

_10MskinText.Name = "10MskinText"
_10MskinText.Parent = _10Mskin
_10MskinText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_10MskinText.BackgroundTransparency = 1.000
_10MskinText.Position = UDim2.new(-0.0149999857, 0, 0, 0)
_10MskinText.Size = UDim2.new(0, 200, 0, 30)
_10MskinText.Font = Enum.Font.FredokaOne
_10MskinText.Text = "10M Mythic Skin Crate"
_10MskinText.TextColor3 = Color3.fromRGB(0, 0, 0)
_10MskinText.TextSize = 14.000

_20Mpet.Name = "20Mpet"
_20Mpet.Parent = Crates
_20Mpet.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_20Mpet.BackgroundTransparency = 1.000
_20Mpet.BorderSizePixel = 0
_20Mpet.Position = UDim2.new(0.164429531, 0, 0.800000012, 0)
_20Mpet.Size = UDim2.new(0, 200, 0, 29)
_20Mpet.Font = Enum.Font.SourceSans
_20Mpet.TextColor3 = Color3.fromRGB(0, 0, 0)
_20Mpet.TextSize = 14.000
_20Mpet.MouseButton1Click:connect(function()
	local A_1 = 5
	local Event = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.GameService.OpenPetCrate
	Event:InvokeServer(A_1)
end)

_20Mpet_Roundify_12px.Name = "20Mpet_Roundify_12px"
_20Mpet_Roundify_12px.Parent = _20Mpet
_20Mpet_Roundify_12px.Active = true
_20Mpet_Roundify_12px.AnchorPoint = Vector2.new(0.5, 0.5)
_20Mpet_Roundify_12px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_20Mpet_Roundify_12px.BackgroundTransparency = 1.000
_20Mpet_Roundify_12px.Position = UDim2.new(0.5, 0, 0.5, 0)
_20Mpet_Roundify_12px.Selectable = true
_20Mpet_Roundify_12px.Size = UDim2.new(1, 0, 1, 0)
_20Mpet_Roundify_12px.Image = "rbxassetid://3570695787"
_20Mpet_Roundify_12px.ScaleType = Enum.ScaleType.Slice
_20Mpet_Roundify_12px.SliceCenter = Rect.new(100, 100, 100, 100)
_20Mpet_Roundify_12px.SliceScale = 0.120

_20MpetText.Name = "20MpetText"
_20MpetText.Parent = _20Mpet
_20MpetText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_20MpetText.BackgroundTransparency = 1.000
_20MpetText.Size = UDim2.new(0, 200, 0, 29)
_20MpetText.Font = Enum.Font.FredokaOne
_20MpetText.Text = "20M Mythic Pet Crate"
_20MpetText.TextColor3 = Color3.fromRGB(0, 0, 0)
_20MpetText.TextSize = 14.000

TabContainerTweeningButton.Name = "TabContainerTweeningButton"
TabContainerTweeningButton.Parent = Topbar
TabContainerTweeningButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainerTweeningButton.BorderColor3 = Color3.fromRGB(35, 35, 35)
TabContainerTweeningButton.Position = UDim2.new(0.0233333334, 0, 0.0666671768, 0)
TabContainerTweeningButton.Size = UDim2.new(0, 26, 0, 26)
TabContainerTweeningButton.Image = "rbxassetid://2738273138"
local on = false

TabContainerTweeningButton.MouseButton1Down:Connect(function()
	on = not on
	if on then
		on = true
		TabContainer:TweenSize(UDim2.new(0, 110,0, 194), "Out", "Quint", 0.5)
		TabContainer.Visible = true
		wait()
		Maintab.Visible = true
		Maintab:TweenSize(UDim2.new(0, 110,0, 35), "Out", "Quint", 0.5)
		wait()
		Cratestab.Visible = true
		Cratestab:TweenSize(UDim2.new(0, 110,0, 35), "Out", "Quint", 0.5)
	end
	if on == false then
		on = false
		TabContainer:TweenSize(UDim2.new(0, 0,0, 194), "Out", "Quint", 0.5)
		wait()
		Cratestab:TweenSize(UDim2.new(0, 0,0, 35), "Out", "Quint", 0.5)
		wait(0.1)
		Cratestab.Visible = false
		wait(0.01)
		Maintab:TweenSize(UDim2.new(0, 0,0, 35), "Out", "Quint", 0.5)
		Maintab.Visible = false
	end
end)

TabContainer.Name = "TabContainer"
TabContainer.Parent = Topbar
TabContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.BorderColor3 = Color3.fromRGB(35, 35, 35)
TabContainer.Position = UDim2.new(0.99666667, 0, 0.300000519, 0)
TabContainer.Size = UDim2.new(0, 0, 0, 194)

Maintab.Name = "Maintab"
Maintab.Parent = TabContainer
Maintab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Maintab.BorderColor3 = Color3.fromRGB(35, 35, 35)
Maintab.Position = UDim2.new(NAN, 0, 0, 0)
Maintab.Size = UDim2.new(0, 0, 0, 30)
Maintab.Visible = false
Maintab.Font = Enum.Font.FredokaOne
Maintab.Text = "MAIN"
Maintab.TextColor3 = Color3.fromRGB(255, 255, 255)
Maintab.TextSize = 14.000
Maintab.TextWrapped = true
local on = false

Maintab.MouseButton1Click:Connect(function()
	Crates:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quint", 0.5)
	wait(0.5)
	Crates.Visible = false
	Main:TweenSize(UDim2.new(0, 300, 0, 180), "Out", "Quint", 0.5)
end)


Cratestab.Name = "Cratestab"
Cratestab.Parent = TabContainer
Cratestab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Cratestab.BorderColor3 = Color3.fromRGB(35, 35, 35)
Cratestab.Position = UDim2.new(0, 0, 0.15463917, 0)
Cratestab.Size = UDim2.new(0, 0, 0, 30)
Cratestab.Visible = false
Cratestab.Font = Enum.Font.FredokaOne
Cratestab.Text = "CRATES"
Cratestab.TextColor3 = Color3.fromRGB(255, 255, 255)
Cratestab.TextSize = 14.000
local on = false

Cratestab.MouseButton1Click:Connect(function()
	Main:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quint", 0.5)
	wait(0.5)
	Crates:TweenSize(UDim2.new(0, 300, 0, 180), "Out", "Quint", 0.5)
	Crates.Visible = true
end)

UIListLayout.Parent = TabContainer
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

close.Name = "close"
close.Parent = Topbar
close.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
close.BorderColor3 = Color3.fromRGB(35, 35, 35)
close.Position = UDim2.new(0.913333297, 0, 0.0666671842, 0)
close.Size = UDim2.new(0, 25, 0, 25)
close.Image = "rbxassetid://4988112250"

close.MouseButton1Down:Connect(function()
	for i , v in pairs (ScreenGui:GetDescendants()) do
		if string.find(v.Name, "Topbar") then
			v:Destroy()
		end
	end
end)

Visible.Name = "Visible"
Visible.Parent = Topbar
Visible.BackgroundColor3 = Color3.fromRGB(225, 0, 0)
Visible.BackgroundTransparency = 1.000
Visible.BorderSizePixel = 0
Visible.Position = UDim2.new(0.839999974, 0, 0.133333847, 0)
Visible.Size = UDim2.new(0, 22, 0, 22)
Visible.Font = Enum.Font.SourceSans
Visible.Text = ""
Visible.TextColor3 = Color3.fromRGB(0, 0, 0)
Visible.TextSize = 14.000
local on = false

Visible.MouseButton1Click:Connect(function()
	on = not on
	if on then
		Visible_Roundify_4px.ImageColor3 = Color3.fromRGB(0,225,0)
		on = true
		MainContainer:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quint", 0.5)
		Main:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quint", 0.5)
		Crates:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quint", 0.5)
		Crates.Visible = false
		TabContainer.Visible = false
	end
	if on == false then
		Visible_Roundify_4px.ImageColor3 = Color3.fromRGB(225,0,0)
		on = false
		MainContainer:TweenSize(UDim2.new(0, 300,0, 180), "Out", "Quint", 0.5)
		wait(0.3)
		Main:TweenSize(UDim2.new(0, 300, 0, 180), "Out", "Quint", 0.5)
		TabContainer.Visible = true
	end
end)

Visible_Roundify_4px.Name = "Visible_Roundify_4px"
Visible_Roundify_4px.Parent = Visible
Visible_Roundify_4px.Active = true
Visible_Roundify_4px.AnchorPoint = Vector2.new(0.5, 0.5)
Visible_Roundify_4px.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Visible_Roundify_4px.BackgroundTransparency = 1.000
Visible_Roundify_4px.Position = UDim2.new(0.5, 0, 0.5, 0)
Visible_Roundify_4px.Selectable = true
Visible_Roundify_4px.Size = UDim2.new(1, 0, 1, 0)
Visible_Roundify_4px.Image = "rbxassetid://3570695787"
Visible_Roundify_4px.ImageColor3 = Color3.fromRGB(225, 0, 0)
Visible_Roundify_4px.ScaleType = Enum.ScaleType.Slice
Visible_Roundify_4px.SliceCenter = Rect.new(100, 100, 100, 100)
Visible_Roundify_4px.SliceScale = 0.040
end)

Main:Button("NEW FE fling GUI",function()
--[[Fling GUI]]--
--[[Made by topit]]--
loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()
--This link auto updates, so there's no need to update this file.
end)

Main:Button("K.A.T. | Auto Farm",function()
-- put in autoexec
if game.PlaceId == 621129760 then
repeat wait() until game.Players.LocalPlayer

local run = game:GetService("RunService")
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local teleport = game:GetService("TeleportService")

-- rejoin if kicked
game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
 if child.Name == "ErrorPrompt" then 
  teleport:TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)    
 end
end)

-- autofarm
run.RenderStepped:Connect(function()
 for i,v in pairs(game.Players:GetChildren()) do
  local character = lp.Character
   local backpack = lp.Backpack
    local target = lp.PlayerGui.GameUI.HUD.TargetUI.TargetHolder.TargetName    
     local root = character.HumanoidRootPart
      if target.Text == v.Name then 
       root.CFrame = v.Character.HumanoidRootPart.CFrame  * CFrame.new(0,0,2)
       mouse1click()
      for _,v2 in pairs(backpack:GetChildren()) do 
     if v2.Name == "Knife" then 
    v2.Parent = character
   end
  end
 end
end
end)
end
end)

Main:Button("Da Hood | AutoFarm",function()

  
-- credits to charwar for the server hop https://v3rmillion.net/member.php?action=profile&uid=114844
getgenv().Settings = {
time_until_start = 20,
speed = 4
}

loadstring(game:HttpGet('https://raw.githubusercontent.com/slimethefemboy/scripts/main/da%20hood%20autofarm%20dont%20use'))()
end)

Main:Button("FE Fly Script",function()
--ARCEUS X FLY V2 SCRIPT BY me_ozoneYT
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()

end)

Main:Button("Work At A Pizza Place | /Manager",function()
spawn(loadstring(game:HttpGet("https://pastebin.com/raw/q817HYb9",true)))

--Use \ to execute commands
end)

Main:Button("Psy Hub",function()
loadstring(game:GetObjects("rbxassetid://3014051754")[1].Source)()
end)

Main:Button("Infinite Yield | FE",function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)
