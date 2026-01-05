--!strict

local CoreComponents = {}

CoreComponents.Service = require(script.Service)
CoreComponents.ServiceManager = require(script.Service.Manager)

return table.freeze(CoreComponents)
