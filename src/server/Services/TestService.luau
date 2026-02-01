--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Loom = require(Shared.Loom)

local TestServiceDef = require(Shared.Definitions.TestService)

type TestService = {
	Money: number,

	Client: typeof(TestServiceDef.Client),

	LoomInit: (self: TestService) -> (),
	LoomStart: (self: TestService) -> (),
	AddMoney: (self: TestService, amount: number) -> (),
}

local TestService = Loom.CreateService(TestServiceDef) :: TestService
TestService.Money = 0

function TestService:LoomInit()
	self:AddMoney(10)
	task.spawn(function()
		self.Client.TestMethod.listen(function(data: number, player: Player?)
			if not player then
				return
			end

			print(`Recieved data [{data}] from {player.PartyId}`)
		end)

		while task.wait(3) do
			print("Sending data to clients...")
			for _ = 0, 10 do
				self.Client.TestMethod.sendToAll(2)
			end
		end
	end)
end

function TestService:LoomStart()
	print("Service Started")
end

function TestService:AddMoney(amount: number)
	self.Money += amount
	print("New Money:", self.Money)
end

return TestService
