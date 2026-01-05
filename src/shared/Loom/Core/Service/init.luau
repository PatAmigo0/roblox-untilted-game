--!strict

local LoomRoot = script.Parent.Parent
local TypesFolder = LoomRoot.Types
local EnumsFolder = LoomRoot.Enums

local ServiceType = require(TypesFolder.Service)
local LoomTypeEnum = require(EnumsFolder.LoomTypeEnum)

local Service = {}
Service.__index = Service

function Service.new(def: ServiceType.ServiceDef): ServiceType.Service
	local self = setmetatable(def, Service) :: ServiceType.Service
	self._loomType = LoomTypeEnum.Service
	return self
end

return Service
