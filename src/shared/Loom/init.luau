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
local ServiceManager = Core.ServiceManager
local Service = Core.Service

local Loom = {}
Loom.ByteNet = Vendors.ByteNet
Loom.Enums = {
	Reliability = Enums.ReliabilityTypeEnum,
	LoomType = Enums.LoomTypeEnum,
}

function Loom.CreateService(def: Types.ServiceDef): Types.Service
	local newService = Service.new(def)
	ServiceManager.Register(newService)
	return newService :: any
end

function Loom.Start()
	return Promise.new(function(resolve)
		resolve()
	end)
end

return table.freeze(Loom)
