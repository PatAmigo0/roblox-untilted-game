local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Loom = require(Shared.Loom)
local BenchmarkDef = require(Shared.Definitions.BenchmarkService)

local BenchmarkController = Loom.CreateController({
	Name = BenchmarkDef.Name,
	Client = BenchmarkDef.Client,
})

local RemoteEvent = ReplicatedStorage:WaitForChild("BenchmarkRemote")

function BenchmarkController:LoomInit()
	local TARGET_COUNT = 10000

	local remoteStartTime = 0
	local remotePacketsReceived = 0

	RemoteEvent.OnClientEvent:Connect(function(data)
		if data == 0 then
			-- Start Signal
			remoteStartTime = os.clock()
			remotePacketsReceived = 0
			print("[Client] RemoteEvent Benchmark Started...")
		else
			-- Counting Packets
			remotePacketsReceived += 1
			if remotePacketsReceived == TARGET_COUNT then
				local duration = os.clock() - remoteStartTime
				print(`[RESULTS] RemoteEvents finished in: ${string.format("%.4f", duration)} seconds`)
			end
		end
	end)

	local loomStartTime = 0
	local loomPacketsReceived = 0

	self.Client.BenchmarkPacket.listen(function(data)
		if data == 0 then
			loomStartTime = os.clock()
			loomPacketsReceived = 0
			print("[Client] Loom Benchmark Started...")
		else
			loomPacketsReceived += 1
			if loomPacketsReceived == TARGET_COUNT then
				local duration = os.clock() - loomStartTime
				print(`[RESULTS] Loom finished in:         ${string.format("%.4f", duration)} seconds`)
			end
		end
	end)
end

return BenchmarkController
