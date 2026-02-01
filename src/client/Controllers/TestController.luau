--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Loom = require(Shared.Loom)

local TestServiceDef = require(Shared.Definitions.TestService)

type TestController = {
	Client: typeof(TestServiceDef.Client),
	LoomInit: (self: TestController) -> (),
	LoomStart: (self: TestController) -> (),
	A: (self: TestController) -> (),
}

local TestController = Loom.CreateController({
	Name = TestServiceDef.Name,
	Client = TestServiceDef.Client,
}) :: TestController

function TestController:LoomInit()
	print("Test controller is initializing")
	self.Client.TestMethod.listen(function(data)
		print("[Client] Received packet from server:", data)
	end)
end

function TestController:LoomStart()
	print("TestController Started")
end

function TestController:A() end

return TestController
