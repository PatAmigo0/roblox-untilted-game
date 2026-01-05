--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Loom = require(Shared.Loom)

Loom.CreateService({
	Name = "TestService",
	Client = {
		TestMethod = {
			ReliabilityType = Loom.Enums.Reliability.Reliable,

			Schema = Loom.ByteNet.uint16,
		},
	},
})
