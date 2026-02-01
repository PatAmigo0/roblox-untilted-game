local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared

local Loom = require(Shared.Loom)

local ServicesFolder = script.Parent.Services

for _, module in ipairs(ServicesFolder:GetChildren()) do
	if module:IsA("ModuleScript") then
		require(module)
	end
end

Loom.Start():andThen(function()
	print("Loom started successfully!")
end)
