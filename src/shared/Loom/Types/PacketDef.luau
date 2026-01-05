--!strict

local LoomRoot = script.Parent.Parent
local _ReliabilityEnum = require(LoomRoot.Enums.ReliabilityTypeEnum)

local ByteNetLib = require(script.Parent.ByteNetLib)

export type ReliabilityEnumModule = typeof(_ReliabilityEnum)
export type ReliabilityType = "reliable" | "unreliable"

export type PacketDef = {
	ReliabilityType: ReliabilityType,
	Schema: ByteNetLib.Schema,
}

return nil
