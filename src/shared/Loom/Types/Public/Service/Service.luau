--!strict
local LoomRoot = script.Parent.Parent.Parent.Parent -- Loom/Types/Public/Service/<script>

-- selene: allow(unused_variable)
local Enums = require(LoomRoot.Enums)
local LoomMemberModule = require(LoomRoot.Types.Private.LoomCoreTypes.LoomMember)
local PacketDefModule = require(LoomRoot.Types.Public.Packet.PacketDef)

export type ServiceDef = LoomMemberModule.LoomMember & {
	Client: { [string]: PacketDefModule.PacketDef }?,
}

export type Service = ServiceDef & {
	_loom_type: typeof(Enums.LoomTypeEnum.Service),
	[any]: any,
}

return nil
