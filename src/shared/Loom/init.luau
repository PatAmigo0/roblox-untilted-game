--!strict

--[=[
	Basic
]=]
local Types = require(script.Types)
local Enums = require(script.Enums)
local Vendors = require(script.Vendors)

local Promise = Vendors.Promise

--[=[
	Core
]=]
local Core = require(script.Core)
local ByteNet = require(script.Vendors.ByteNet)

local ControllerManager = Core.ControllerManager
local ServiceManager = Core.ServiceManager

local Service = Core.Service
local Controller = Core.Controller

local Loom = {}
Loom.ByteNet = Vendors.ByteNet
Loom.Enums = {
	Reliability = Enums.ReliabilityTypeEnum,
	LoomType = Enums.LoomTypeEnum,
}

local IS_SERVER = not game:GetService("RunService"):IsClient()

local function initializeByteNet(def: any)
	if def.Client then
		local clientMap = def.Client :: any

		local registeredPackets = ByteNet.defineNamespace(def.Name, function()
			local packets = {}
			for methodName, packetDef in pairs(clientMap) do
				local newPacket = Loom.ByteNet.definePacket({
					value = packetDef.Schema,
					reliabilityType = packetDef.ReliabilityType,
				})
				packets[methodName] = newPacket
			end
			return packets
		end)

		for methodName, packet in pairs(registeredPackets) do
			if type(packet) == "function" then
				clientMap[methodName] = packet()
			else
				clientMap[methodName] = packet
			end
		end
	end
end

--- Use with "!strict" enabled.
--- Helps to make sure that your schema definition is correct
function Loom.Definition<T>(def: T & Types.ServiceDef): Types.ServiceDef & T
	return def
end

function Loom.RegisterPacket<T>(packetDef: Types.PacketDef<T>): Types.Packet<T>
	return packetDef :: any
end

function Loom.CreateService<T>(def: T & Types.ServiceDef): any
	initializeByteNet(def)

	local newService = Service.new(def)
	return ServiceManager.Register(newService) :: any
end

function Loom.CreateController<T>(def: T & Types.ControllerDef): any
	initializeByteNet(def)

	local newController = Controller.new(def)
	return ControllerManager.Register(newController) :: any
end

function Loom.GetService(name: string)
	return ControllerManager.Get(name)
end

function Loom.Start()
	return Promise.new(function(resolve)
		if IS_SERVER then
			ServiceManager.Start()
		else
			ControllerManager.Start()
		end

		resolve()
	end)
end

return table.freeze(Loom)
