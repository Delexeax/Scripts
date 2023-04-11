local Selection = Instance.new("SelectionBox")
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local ts = game.TweenService
local SelecTwee = ts:Create(Selection, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Transparency = 0.5, LineThickness = 0.06})
local SelecTwee1 = ts:Create(Selection, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Transparency = 0, LineThickness = 0.15})
mouse.Move:Connect(function()
	if mouse.Target then
		Selection.Parent = mouse.Target
		Selection.Adornee = mouse.Target
		task.spawn(function()
			while task.wait() do
				SelecTwee:Play()
				SelecTwee.Completed:Wait()
				SelecTwee1:Play()
				SelecTwee1.Completed:Wait()
			end
		end)
	else
		Selection.Parent = game.ReplicatedStorage
		Selection.Adornee = nil
	end
end)
