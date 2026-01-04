local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Ion = require(ReplicatedStorage.Shared.Ion)

local ByteNet = Ion:GetByteNet()

return {
	Test = ByteNet.definePacket({
		reliabilityType = "reliable",
		value = ByteNet.uint32,
	}),
}
