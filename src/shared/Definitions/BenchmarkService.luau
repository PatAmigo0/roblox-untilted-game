local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Loom = require(Shared.Loom)

return Loom.Definition({
	Name = "BenchmarkService",
	Client = {
		BenchmarkPacket = Loom.RegisterPacket({
			ReliabilityType = Loom.Enums.Reliability.Reliable,
			Schema = Loom.ByteNet.uint32,
		}),
	},
})
