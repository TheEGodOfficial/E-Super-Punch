local hiddenfling = false

game:GetService("UserInputService").InputBegan:Connect(function(Input, GPE)
	if GPE then return end
		
	if Input.KeyCode == getgenv().PunchKeyCode then
		local p = game:GetService("Players").LocalPlayer
		local c = p.Character
		local h = c:FindFirstChildOfClass("Humanoid")
		if h.RigType == Enum.HumanoidRigType.R6 then
			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://204062532"
			local track = h:LoadAnimation(anim)
			track:Play(.1)
			task.spawn(function()
				hiddenfling = true
				task.wait(2)
				hiddenfling = false
			end)
		elseif h.RigType == Enum.HumanoidRigType.R15 then
			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://567480369"
			local track = h:LoadAnimation(anim)
			track:Play(.1)
			task.spawn(function()
				hiddenfling = true
				task.wait(2)
				hiddenfling = false
			end)
		end
	end
end)

local hrp, c, vel, movel = nil, nil, nil, 0.1

while true do
	game:GetService("RunService").Heartbeat:Wait()
	if hiddenfling then
		local lp = game.Players.LocalPlayer
		while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
			game:GetService("RunService").Heartbeat:Wait()
			c = lp.Character
			hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
			if hiddenfling then
				vel = hrp.Velocity
				hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
				game:GetService("RunService").RenderStepped:Wait()
				if c and c.Parent and hrp and hrp.Parent then
					hrp.Velocity = vel
				end
				game:GetService("RunService").Stepped:Wait()
				if c and c.Parent and hrp and hrp.Parent then
					hrp.Velocity = vel + Vector3.new(0, movel, 0)
					movel = movel * -1
				end
			end
		end
	end
end
