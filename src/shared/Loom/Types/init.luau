--!strict

local PublicTypes = require(script.Public)
local PrivateTypes = require(script.Private)

-- Public
export type Service = PublicTypes.Service
export type ServiceDef = PublicTypes.ServiceDef
export type Controller = PublicTypes.Controller
export type PacketDef<T> = PublicTypes.PacketDef<T>

-- Private
export type LoomMember = PrivateTypes.LoomMember
export type LoomManager<T> = PrivateTypes.LoomManager<T>
export type BuilderOptions = PrivateTypes.BuilderOptions

-- Lib Types
export type ByteNetSchema = PrivateTypes.ByteNetSchema
export type ByteNetPacket<T> = PrivateTypes.ByteNetPacket<T>
export type ByteNet = PrivateTypes.ByteNet
export type Packet<T> = PrivateTypes.Packet<T>

return nil
