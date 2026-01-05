--!strict

local ServiceModule = require(script.Service)
local LoomMemberModule = require(script.LoomMember)
local _LoomTypeModule = require(script.Parent.Enums.LoomTypeEnum)

export type LoomType = typeof(_LoomTypeModule)

export type Service = ServiceModule.Service
export type ServiceDef = ServiceModule.ServiceDef

export type LoomMember = LoomMemberModule.LoomMember

return nil
