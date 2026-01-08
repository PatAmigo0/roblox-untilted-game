--!strict
local ServiceModule = require(script.Service.Service)
local ControllerModule = require(script.Controller.Controller)
local PacketDefModule = require(script.Packet.PacketDef)

export type Service = ServiceModule.Service
export type ServiceDef = ServiceModule.ServiceDef
export type Controller = ControllerModule.Controller
export type PacketDef = PacketDefModule.PacketDef

return nil
