--!strict

local LoomRoot = script.Parent.Parent

local LoomTypes = require(LoomRoot.Types)
local LoomEnums = require(LoomRoot.Enums)

local Controller = {}
Controller.__index = Controller

function Controller.new(def: LoomTypes.ServiceDef): LoomTypes.Service
	local self = setmetatable(def, Controller) :: LoomTypes.Service
	self._loomType = LoomEnums.LoomTypeEnum.Service
	return self
end

return Controller
