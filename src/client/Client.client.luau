local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Loom = require(Shared.Loom)

local Controllers = script.Parent.Controllers
for _, module in ipairs(Controllers:GetChildren()) do
	if module:IsA("ModuleScript") then
		require(module)
	end
end

Loom.Start()
	:andThen(function()
		print("Client Loom started successfully!")
	end)
	:catch(warn)
