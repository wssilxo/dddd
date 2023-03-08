-- // Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- // VARs
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Viewport = game:GetService("Workspace").CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

-- // Library
local Library = {}
Library.Tree = {}

function Library:validate(defaults, options)
	for i, v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:New(options)
	
	options = Library:validate({
		Icon = 12691949726,
		Draggable = true
	}, options or {})
	
	-- // Main
	do
		-- StarterGui.Library
		Library.Tree["1"] = Instance.new("ScreenGui", RunService:IsClient() and Players.LocalPlayer:WaitForChild("PlayerGui") or CoreGui);
		Library.Tree["1"]["Name"] = [[Library]];
		Library.Tree["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
		Library.Tree["1"]["IgnoreGuiInset"] = true;

		-- StarterGui.Library.Window
		Library.Tree["2"] = Instance.new("Frame", Library.Tree["1"]);
		Library.Tree["2"]["BorderSizePixel"] = 2;
		Library.Tree["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Library.Tree["2"]["Size"] = UDim2.new(0, 638, 0, 500);
		Library.Tree["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Library.Tree["2"]["Position"] = UDim2.new(0.2767857015132904, 0, 0.1913580298423767, 0);
		Library.Tree["2"]["Name"] = [[Window]];
		Library.Tree["2"]["Active"] = true;
		Library.Tree["2"]["Draggable"] = options.Draggable;

		-- StarterGui.Library.Window.UIGradient
		Library.Tree["3"] = Instance.new("UIGradient", Library.Tree["2"]);
		Library.Tree["3"]["Rotation"] = -90;
		Library.Tree["3"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(13, 13, 13)),ColorSequenceKeypoint.new(0.943, Color3.fromRGB(28, 28, 28)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(62, 62, 62))};

	--	-- StarterGui.Library.Window.SECRET
	--	Library.Tree["6b"] = Instance.new("TextLabel", Library.Tree["2"]);
	--	Library.Tree["6b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	--	Library.Tree["6b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	--	Library.Tree["6b"]["TextTransparency"] = 0.8500000238418579;
	--	Library.Tree["6b"]["TextSize"] = 14;
	--	Library.Tree["6b"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
	--	Library.Tree["6b"]["Size"] = UDim2.new(0, 200, 0, 27);
	--	Library.Tree["6b"]["Text"] = [[literally millionware]];
	--	Library.Tree["6b"]["Name"] = [[SECRET]];
	--	Library.Tree["6b"]["BackgroundTransparency"] = 1;
	--	Library.Tree["6b"]["Position"] = UDim2.new(0, 0, 0.02800000086426735, 0);
		
		-- StarterGui.Library.Window.Menu
		Library.Tree["4"] = Instance.new("Frame", Library.Tree["2"]);
		Library.Tree["4"]["BorderSizePixel"] = 2;
		Library.Tree["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Library.Tree["4"]["Size"] = UDim2.new(0, 612, 0, 445);
		Library.Tree["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Library.Tree["4"]["Position"] = UDim2.new(0.020180359482765198, 0, 0.08320990204811096, 0);
		Library.Tree["4"]["Name"] = [[Menu]];

		-- StarterGui.Library.Window.Menu.UIGradient
		Library.Tree["5"] = Instance.new("UIGradient", Library.Tree["4"]);
		Library.Tree["5"]["Rotation"] = -90;
		Library.Tree["5"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(18, 18, 18)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(35, 35, 35))};

		-- StarterGui.Library.Window.Menu.ImageLabel
		Library.Tree["6"] = Instance.new("ImageLabel", Library.Tree["4"]);
		Library.Tree["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Library.Tree["6"]["Image"] = "rbxassetid://"..options.Icon;
		Library.Tree["6"]["Size"] = UDim2.new(0, 170, 0, 160);
		Library.Tree["6"]["BackgroundTransparency"] = 1;
		Library.Tree["6"]["Position"] = UDim2.new(0.00003301084507256746, 0, 0, 0);

		-- StarterGui.Library.Window.Menu.ImageLabel.UIGradient
		Library.Tree["7"] = Instance.new("UIGradient", Library.Tree["6"]);
		Library.Tree["7"]["Rotation"] = -90;
		Library.Tree["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(122, 122, 122)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
	end
	
	local GUI = {
		CurrentTab = nil
	}
	
	-- // Navigation
	do
		-- StarterGui.Library.Window.Menu.ButtonHolder
		GUI["8"] = Instance.new("Frame", Library.Tree["4"]);
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["8"]["BackgroundTransparency"] = 1;
		GUI["8"]["Size"] = UDim2.new(0, 169, 0, 285);
		GUI["8"]["Position"] = UDim2.new(0.00003301084507256746, 0, 0.3595505654811859, 0);
		GUI["8"]["Name"] = [[ButtonHolder]];

		-- StarterGui.Library.Window.Menu.ButtonHolder.UIPadding
		GUI["9"] = Instance.new("UIPadding", GUI["8"]);
		GUI["9"]["PaddingTop"] = UDim.new(0, 5);
		GUI["9"]["PaddingBottom"] = UDim.new(0, 5);
		GUI["9"]["PaddingLeft"] = UDim.new(0, 9);

		-- StarterGui.Library.Window.Menu.ButtonHolder.UIListLayout
		GUI["a"] = Instance.new("UIListLayout", GUI["8"]);
		GUI["a"]["Padding"] = UDim.new(0, 8);
		GUI["a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	end
	
	function GUI:CreateTab(options)
		
		options = Library:validate({
			Name = "Tab"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		-- // Render
		do
			-- StarterGui.Library.Window.Menu.ButtonHolder.Inactive
			Tab["c"] = Instance.new("TextButton", GUI["8"]);
			Tab["c"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
			Tab["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Tab["c"]["TextSize"] = 20;
			Tab["c"]["TextColor3"] = Color3.fromRGB(200, 200, 200);
			Tab["c"]["Size"] = UDim2.new(0, 150, 0, 50);
			Tab["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["c"]["Text"] = options.Name;
			Tab["c"]["Name"] = options.Name;
			Tab["c"]["Position"] = UDim2.new(0.1370932012796402, 0, 0.04727272689342499, 0);
			
			-- StarterGui.Library.Window.Menu.Tabs
			Tab["d"] = Instance.new("Frame", Library.Tree["4"]);
			Tab["d"]["BorderSizePixel"] = 2;
			Tab["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["d"]["Size"] = UDim2.new(0, 435, 0, 432);
			Tab["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["d"]["Position"] = UDim2.new(0.2774617373943329, 0, 0.01431102305650711, 0);
			Tab["d"]["Name"] = [[Tabs]];
			Tab["d"]["Visible"] = false;

			-- StarterGui.Library.Window.Menu.Tabs.UIGradient
			Tab["e"] = Instance.new("UIGradient", Tab["d"]);
			Tab["e"]["Rotation"] = -90;
			Tab["e"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(18, 18, 18)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(30, 30, 30))};
			
			-- StarterGui.Library.Window.Menu.Tabs.UIPadding
			Tab["69"] = Instance.new("UIPadding", Tab["d"]);
			Tab["69"]["PaddingTop"] = UDim.new(0, 6);
			Tab["69"]["PaddingRight"] = UDim.new(0, 1);
			Tab["69"]["PaddingLeft"] = UDim.new(0, 8);

			-- StarterGui.Library.Window.Menu.Tabs.UIListLayout
			Tab["6a"] = Instance.new("UIListLayout", Tab["d"]);
			Tab["6a"]["FillDirection"] = Enum.FillDirection.Horizontal;
			Tab["6a"]["Padding"] = UDim.new(0, 9);
			Tab["6a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end
		
		-- // Methods
		function Tab:Activate()
			if not Tab.Active then
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["c"], {BackgroundColor3 = Color3.fromRGB(36, 36, 36)})
				Library:tween(Tab["c"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				Tab["d"].Visible = true
				
				GUI.CurrentTab = Tab
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Library:tween(Tab["c"], {BackgroundColor3 = Color3.fromRGB(26, 26, 26)})
				Library:tween(Tab["c"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
				Tab["d"].Visible = false
			end
		end
		
		-- // Logic
		do
			Tab["c"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["c"], {BackgroundColor3 = Color3.fromRGB(36, 36, 36)})
					Library:tween(Tab["c"], {TextColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["c"].MouseLeave:Connect(function()
				Tab.Hover = false

				if not Tab.Active then
					Library:tween(Tab["c"], {BackgroundColor3 = Color3.fromRGB(26, 26, 26)})
					Library:tween(Tab["c"], {TextColor3 = Color3.fromRGB(200, 200, 200)})
				end
			end)

			Tab["c"].MouseButton1Click:Connect(function()	
				if Tab.Hover then
					Tab:Activate()
				end
			end)

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:LeftGroupbox(options)
			
			options = Library:validate({
				Name = "Rage",
			}, options or {})
			
			local LGroupbox = {}
			-- Render
			do
				-- StarterGui.Library.Window.Menu.Tabs.GroupBox
				LGroupbox["f"] = Instance.new("Frame", Tab["d"]);
				LGroupbox["f"]["BorderSizePixel"] = 2;
				LGroupbox["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				LGroupbox["f"]["Size"] = UDim2.new(0, 205, 0, 420);
				LGroupbox["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				LGroupbox["f"]["Position"] = UDim2.new(0.01692427694797516, 0, 0.014191379770636559, 0);
				LGroupbox["f"]["Name"] = [[GroupBox]];

				-- StarterGui.Library.Window.Menu.Tabs.GroupBox.UIGradient
				LGroupbox["10"] = Instance.new("UIGradient", LGroupbox["f"]);
				LGroupbox["10"]["Rotation"] = -90;
				LGroupbox["10"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(18, 18, 18)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(25, 25, 25))};

				-- StarterGui.Library.Window.Menu.Tabs.GroupBox.UIListLayout
				LGroupbox["11"] = Instance.new("UIListLayout", LGroupbox["f"]);
				LGroupbox["11"]["Padding"] = UDim.new(0, 7);
				LGroupbox["11"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

				-- StarterGui.Library.Window.Menu.Tabs.GroupBox.UIPadding
				LGroupbox["12"] = Instance.new("UIPadding", LGroupbox["f"]);
				LGroupbox["12"]["PaddingTop"] = UDim.new(0, 7);
				LGroupbox["12"]["PaddingLeft"] = UDim.new(0, 7);
			end
			
			function LGroupbox:Button(options)

				options = Library:validate({
					Name = "Button",
					Callback = function() end
				}, options or {})

				local Button = {
					Hover = false,
					MouseDown = false
				}

				-- Render
				do
					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Button
					Button["13"] = Instance.new("Frame", LGroupbox["f"]);
					Button["13"]["BackgroundColor3"] = Color3.fromRGB(24, 24, 24);
					Button["13"]["Size"] = UDim2.new(0, 190, 0, 35);
					Button["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["13"]["Name"] = [[Button]];
					Button["13"]["BackgroundTransparency"] = 0

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Button.TextLabel
					Button["14"] = Instance.new("TextButton", Button["13"]);
					Button["14"]["TextWrapped"] = true;
					Button["14"]["BackgroundColor3"] = Color3.fromRGB(24, 24, 24);
					Button["14"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Button["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Button["14"]["TextSize"] = 14;
					Button["14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Button["14"]["Size"] = UDim2.new(0, 181, 0, 35);
					Button["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Button["14"]["BorderSizePixel"] = 0
					Button["14"]["Text"] = options.Name;
					Button["14"]["BackgroundTransparency"] = 1;
					Button["14"]["Position"] = UDim2.new(0.04736842215061188, 0, 0, 0);

				end
				
				-- Method
				function Button:SetText(text)
					Button["14"].Text = text
				end
				
				function Button:SetCallback(fn)
					options.Callback = fn
				end
				
				-- Logic
				do
					Button["13"].MouseEnter:Connect(function()
						Button.Hover = true
						
						Library:tween(Button["13"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
					end)
					
					Button["13"].MouseLeave:Connect(function()
						Button.Hover = false
						
							Library:tween(Button["13"], {BackgroundColor3 = Color3.fromRGB(24, 24, 24)})

					end)
					
					Button["14"].MouseButton1Click:Connect(function()
							Button.MouseDown = true
							Library:tween(Button["13"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							options.Callback()
	
					end)
					
					Button["14"].MouseButton1Down:Connect(function()
						Button.MouseDown = false
						Library:tween(Button["13"], {BackgroundColor3 = Color3.fromRGB(24, 24, 24)})
					end)
				end
				
				return Button
			end
			
			function LGroupbox:Label(options)
				
				options = Library:validate({
					Text = "Moves player to 50 studs up.",
				}, options or {})
				
				local Label = {}
				
				-- Render
				do
					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Label
					Label["16"] = Instance.new("Frame", LGroupbox["f"]);
					Label["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Label["16"]["BackgroundTransparency"] = 1;
					Label["16"]["Size"] = UDim2.new(0, 190, 0, 35);
					Label["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["16"]["Name"] = [[Label]];

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Label.TextLabel
					Label["17"] = Instance.new("TextLabel", Label["16"]);
					Label["17"]["TextWrapped"] = true;
					Label["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Label["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Label["17"]["TextSize"] = 14;
					Label["17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Label["17"]["Size"] = UDim2.new(0, 190, 0, 35);
					Label["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Label["17"]["Text"] = options.Text;
					Label["17"]["BackgroundTransparency"] = 1;

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Label.UIGradient
					Label["18"] = Instance.new("UIGradient", Label["16"]);
					Label["18"]["Rotation"] = -90;
					Label["18"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(24, 24, 24)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(27, 27, 27))};

				end
			end
			
			function LGroupbox:Slider(options)
				
				options = Library:validate({
					Name = "slider",
					Minimum = 0,
					Maximum = 100,
					Default = 50,
					Callback = function(v) print(v) end
				}, options or {})
				
				local Slider = {
					Hover = false,
					MouseDown = false,
					Connection = nil,
					Options = options
				}
				
				-- Render
				do
					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Slider
					Slider["1f"] = Instance.new("Frame", LGroupbox["f"]);
					Slider["1f"]["BackgroundColor3"] = Color3.fromRGB(24, 24, 24);
					Slider["1f"]["Size"] = UDim2.new(0, 190, 0, 60);
					Slider["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["1f"]["Position"] = UDim2.new(0, 0, 0.3050847351551056, 0);
					Slider["1f"]["Name"] = [[Slider]];

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Slider.TextLabel
					Slider["20"] = Instance.new("TextLabel", Slider["1f"]);
					Slider["20"]["TextWrapped"] = true;
					Slider["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["20"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Slider["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Slider["20"]["TextSize"] = 14;
					Slider["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["20"]["Size"] = UDim2.new(0, 138, 0, 35);
					Slider["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["20"]["Text"] = options.Name;
					Slider["20"]["BackgroundTransparency"] = 1;
					Slider["20"]["Position"] = UDim2.new(0.04736842215061188, 0, 0, 0);

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Slider.TextLabel
					Slider["22"] = Instance.new("TextLabel", Slider["1f"]);
					Slider["22"]["TextWrapped"] = true;
					Slider["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["22"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Slider["22"]["TextSize"] = 14;
					Slider["22"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["22"]["Size"] = UDim2.new(0, 35, 0, 35);
					Slider["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["22"]["Text"] = tostring(options.Default);
					Slider["22"]["BackgroundTransparency"] = 1;
					Slider["22"]["Position"] = UDim2.new(0.7736842036247253, 0, 0, 0);

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Slider.SliderBack
					Slider["23"] = Instance.new("Frame", Slider["1f"]);
					Slider["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["23"]["Size"] = UDim2.new(0, 173, 0, 18);
					Slider["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Slider["23"]["Position"] = UDim2.new(0.04736842215061188, 0, 0.5833333134651184, 0);
					Slider["23"]["Name"] = [[SliderBack]];

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Slider.SliderBack.UIGradient
					Slider["24"] = Instance.new("UIGradient", Slider["23"]);
					Slider["24"]["Rotation"] = -90;
					Slider["24"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(24, 24, 24)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(27, 27, 27))};

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Slider.SliderBack.Draggable
					Slider["25"] = Instance.new("Frame", Slider["23"]);
					Slider["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Slider["25"]["BorderMode"] = Enum.BorderMode.Middle;
					Slider["25"]["Size"] = UDim2.new(0, 96, 0, 17);
					Slider["25"]["Name"] = [[Draggable]];

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.Slider.SliderBack.Draggable.UIGradient
					Slider["26"] = Instance.new("UIGradient", Slider["25"]);
					Slider["26"]["Rotation"] = -90;
					Slider["26"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(24, 24, 24)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(48, 48, 48))};
				end
				
				-- Methods
				function Slider:SetValue(v)
					if v == nil then
						local Percentage 	= math.clamp((Mouse.X - Slider["1f"].AbsolutePosition.X) / (Slider["1f"].AbsoluteSize.X), 0, 1)
						local Value = math.floor(((options.Maximum - options.Minimum) * Percentage) + options.Minimum)
					
						Slider["22"].Text = tostring(Value)
						Slider["25"].Size = UDim2.fromScale(Percentage, 1)
					else
						Slider["22"].Text = tostring(v)
						Slider["25"].Size = UDim2.fromScale(((v - options.Minimum) / (options.Maximum - options.Minimum)), 1)
					end
					options.Callback(Slider.GetValue())
				end
				
				function Slider:GetValue()
					return tonumber(Slider["22"].Text)
				end
				
				-- Logic
				do
					Slider["1f"].MouseEnter:Connect(function()
						Slider.Hover = true
						Library.Tree["2"].Draggable = false
						Library.Tree["2"].Active = false

						Library:tween(Slider["1f"], {BackgroundColor3 = Color3.fromRGB(34, 34, 34)})
					end)

					Slider["1f"].MouseLeave:Connect(function()
						Slider.Hover = false
						Library.Tree["2"].Draggable = true
						Library.Tree["2"].Active = true
						if not Slider.MouseDown then
							Library:tween(Slider["1f"], {BackgroundColor3 = Color3.fromRGB(24, 24, 24)})
						end
					end)

					UserInputService.InputBegan:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
							Slider.MouseDown = true
							Library:tween(Slider["1f"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
							
							if not Slider.Connection then
								Slider.Connection = RunService.RenderStepped:Connect(function()
									Slider:SetValue()
								end)
							end
						end
					end)

					UserInputService.InputEnded:Connect(function(input, gpe)
						if gpe then return end

						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							Slider.MouseDown = false

							if Slider.Hover then
								Library:tween(Slider["1f"], {BackgroundColor3 = Color3.fromRGB(34, 34, 34)})
							else
								Library:tween(Slider["1f"], {BackgroundColor3 = Color3.fromRGB(24, 24, 24)})
							end
							
							if Slider.Connection then Slider.Connection:Disconnect() end
							Slider.Connection = nil
						end
					end)
				end
				
				return Slider
			end
			
			function LGroupbox:Toggle(options)
				
				options = Library:validate({
					Name = "toggle",
					Callback = function() end
				}, options or {})
				
				local Toggle = {
					Hover = false,
					MouseDown = false,
					State = false
				}
				
				local toggled = Toggle.State
				
				-- Render
				do
					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.ToggleInactive
					Toggle["37"] = Instance.new("Frame", LGroupbox["f"]);
					Toggle["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["37"]["BackgroundTransparency"] = 1;
					Toggle["37"]["Size"] = UDim2.new(0, 190, 0, 35);
					Toggle["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["37"]["Name"] = [[ToggleInactive]];

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.ToggleInactive.TextLabel
					Toggle["38"] = Instance.new("TextButton", Toggle["37"]);
					Toggle["38"]["TextWrapped"] = true;
					Toggle["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["38"]["TextXAlignment"] = Enum.TextXAlignment.Left;
					Toggle["38"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					Toggle["38"]["TextSize"] = 14;
					Toggle["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Toggle["38"]["Size"] = UDim2.new(0, 155, 0, 35);
					Toggle["38"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["38"]["Text"] = options.Name;
					Toggle["38"]["BackgroundTransparency"] = 1;
					Toggle["38"]["Position"] = UDim2.new(0.18421052396297455, 0, 0, 0);

					-- StarterGui.Library.Window.Menu.Tabs.GroupBox.ToggleInactive.CheckmarkHolder
					Toggle["3a"] = Instance.new("TextLabel", Toggle["37"]);
					Toggle["3a"]["BackgroundColor3"] = Color3.fromRGB(30, 30, 30);
					Toggle["3a"]["Size"] = UDim2.new(0, 20, 0, 20);
					Toggle["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Toggle["3a"]["Position"] = UDim2.new(0.010526314377784729, 0, 0.20000000298023224, 0);
					Toggle["3a"]["Text"] = "";
					Toggle["3a"]["Name"] = [[CheckmarkHolder]];

				end
				
				local function toggle()
					toggled = not toggled
					if toggled then
						Toggle.MouseDown = true
						Library:tween(Toggle["3a"], {BackgroundColor3 = Color3.fromRGB(50, 50, 50)})
					else
						Toggle.MouseDown = false
						Library:tween(Toggle["3a"], {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
					end
					options.Callback(toggled)
				end
				
				do
					
					Toggle["38"].MouseEnter:Connect(function()
						Toggle.Hover = true
						
						if not Toggle.MouseDown then
							Library:tween(Toggle["3a"], {BackgroundColor3 = Color3.fromRGB(40, 40, 40)})
						end
					end)

					Toggle["38"].MouseLeave:Connect(function()
						Toggle.Hover = false

						if not Toggle.MouseDown then
							Library:tween(Toggle["3a"], {BackgroundColor3 = Color3.fromRGB(30, 30, 30)})
						end
					end)
					
					Toggle["38"].MouseButton1Click:connect(function()
						toggle()
					end)
				end
				
				return Toggle
			end
			
			return LGroupbox
		end
		
		return Tab
	end
	
	return GUI
end

function Library:Unload()
	Library.Tree["1"]:Destroy()
end
