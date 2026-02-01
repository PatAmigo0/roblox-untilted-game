local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Loom = require(Shared.Loom)
local BenchmarkDef = require(Shared.Definitions.BenchmarkService)

local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "BenchmarkRemote"
RemoteEvent.Parent = ReplicatedStorage

local BenchmarkService = Loom.CreateService(BenchmarkDef)

function BenchmarkService:LoomStart()
	print("Benchmark Service Ready.")
	print("Type 'startBenchmark()' in the Server Command Bar to run the test.")

	-- selene: allow(global_usage)
	_G.startBenchmark = function()
		local PACKET_COUNT = 10000 -- Number of packets to send
		print(`\n--- Starting Benchmark: ${PACKET_COUNT} Packets ---`)

		task.wait(1)
		print("1. Testing Standard RemoteEvents...")

		RemoteEvent:FireAllClients(0)

		for i = 1, PACKET_COUNT do
			RemoteEvent:FireAllClients(i)
		end

		task.wait(2) -- Cooldown to let network settle
		print("2. Testing Loom (ByteNet)...")

		self.Client.BenchmarkPacket.sendToAll(0)
		for i = 1, PACKET_COUNT do
			self.Client.BenchmarkPacket.sendToAll(i)
		end
	end
end

return BenchmarkService
