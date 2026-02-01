--!strict

local LoomRoot = script.Parent.Parent.Parent.Parent -- Loom/Types/Public/Controller/<script>

-- selene: allow(unused_variable)
local Enums = require(LoomRoot.Enums)
local LoomMemberModule = require(LoomRoot.Types.Private.LoomCoreTypes.LoomMember)

export type Controller = LoomMemberModule.LoomMember & {
	_loom_type: typeof(Enums.LoomTypeEnum.Controller),
	[any]: any,
}

return nil
