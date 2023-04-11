-- Decompiled with the Synapse X Luau decompiler.

wait(1);
local l__LocalPlayer__1 = game:GetService("Players").LocalPlayer;
local l__mouse__2 = l__LocalPlayer__1:GetMouse();
function lerp(p1, p2, p3)
	return p1 + (p2 - p1) * p3;
end;
local l__Humanoid__1 = (l__LocalPlayer__1.Character or l__LocalPlayer__1.CharacterAdded:Wait()):WaitForChild("Humanoid");
local u2 = nil;
local u3 = 0;
local u4 = 0;
local l__CurrentCamera__5 = workspace.CurrentCamera;
local u6 = 0;
local u7 = 0;
local u8 = 0;
local u9 = 0;
local l__UserInputService__10 = game:GetService("UserInputService");
local u11 = 10;
local u12 = 10;
local l__CharacterWalkSpeed__13 = game:GetService("StarterPlayer").CharacterWalkSpeed;
local u14 = Vector3.new();
u2 = game:GetService("RunService").RenderStepped:Connect(function(p4)
	p4 = p4 * 60;
	if l__Humanoid__1.Health <= 0 then
		u2:Disconnect();
		return;
	end;
	local v3 = l__Humanoid__1.RootPart and Vector3.new(l__Humanoid__1.RootPart.Velocity.x, 0, l__Humanoid__1.RootPart.Velocity.z).magnitude or 0;
	if p4 > 3 then
		u3 = 0;
		u4 = 0;
	else
		u3 = lerp(u3, math.cos(tick() * 0.5 * math.random(10, 15)) * (math.random(5, 20) / 200) * p4, 0.05 * p4);
		u4 = lerp(u4, math.cos(tick() * 0.5 * math.random(5, 10)) * (math.random(2, 10) / 200) * p4, 0.05 * p4);
	end;
	l__CurrentCamera__5.CFrame = l__CurrentCamera__5.CFrame * (CFrame.fromEulerAnglesXYZ(0, 0, math.rad(u6)) * CFrame.fromEulerAnglesXYZ(math.rad(u7 * p4), math.rad(u8 * p4), u9) * CFrame.Angles(0, 0, math.rad(u7 * p4 * (math.min(v3, 50) / 5))) * CFrame.fromEulerAnglesXYZ(math.rad(u3), math.rad(u4), math.rad(u4 * 10)));
	u9 = math.clamp(lerp(u9, -l__CurrentCamera__5.CFrame:vectorToObjectSpace((l__Humanoid__1.RootPart and l__Humanoid__1.RootPart.Velocity or Vector3.new()) / math.max(l__Humanoid__1.WalkSpeed, 0.01)).x * 0.08, 0.1 * p4), -0.35, 0.2);
	u6 = lerp(u6, math.clamp(l__UserInputService__10:GetMouseDelta().x, -5, 5), 0.25 * p4);
	u7 = lerp(u7, math.sin(tick() * u11) / 5 * math.min(1, u12 / 10), 0.25 * p4);
	if v3 > 1 then
		u8 = lerp(u8, math.cos(tick() * 0.5 * math.floor(u11)) * (u11 / 200), 0.25 * p4);
	else
		u8 = lerp(u8, 0, 0.05 * p4);
	end;
	if l__CharacterWalkSpeed__13 < v3 then
		u11 = 20;
		u12 = 18;
	elseif v3 > 0.1 then
		u11 = 12;
		u12 = 14;
	else
		u12 = 0;
	end;
	u14 = lerp(u14, l__CurrentCamera__5.CFrame.LookVector, 0.125 * p4 / 4);
end);
