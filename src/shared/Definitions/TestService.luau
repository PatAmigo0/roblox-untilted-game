--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Loom = require(Shared.Loom)

return Loom.Definition({
	Name = "TestService",
	Client = {
		TestMethod = Loom.RegisterPacket({
			ReliabilityType = Loom.Enums.Reliability.Reliable,
			Schema = Loom.ByteNet.uint16,
			CallbackBehavior = {
				spawnThread = false,
				allowMultiple = true,
			},
		}),
	},
})
