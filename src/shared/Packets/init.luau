local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ByteNet = require(ReplicatedStorage.RobloxPackages.bytenet)
local Packets = script:GetChildren()

local packetsTable = {}
for _, module in ipairs(Packets) do
	local packetTable = require(module)
	for packetName, packet in pairs(packetTable) do
		packetsTable[packetName] = packet
	end
end

print(packetsTable)

ByteNet.defineNamespace("IonPackets", function()
	return packetsTable
end)
