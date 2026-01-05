--!strict

local LoomMember = require(script.Parent.LoomMember)
local PacketDef = require(script.Parent.PacketDef)
local _LoomTypeEnum = require(script.Parent.Parent.Enums.LoomTypeEnum)

export type ServiceDef = LoomMember.LoomMember & {
	Client: { [string]: PacketDef.PacketDef }?,
}

export type Service = ServiceDef & {
	_loom_type: typeof(_LoomTypeEnum.Service),
	[any]: any,
}

return nil
