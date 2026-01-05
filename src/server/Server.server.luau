local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RobloxPackages = ReplicatedStorage.RobloxPackages
local Shared = ReplicatedStorage.Shared

local Loom = require(Shared.Loom)

Loom.Start():andThen(function()
	print("Ion started successfully!")
end)
