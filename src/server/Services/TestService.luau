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
end

function TestService:LoomStart()
	print("Service Started")
end

function TestService:AddMoney(amount: number)
	self.Money += amount
	print("New Money:", self.Money)
end

return TestService
