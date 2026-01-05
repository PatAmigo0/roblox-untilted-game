--!strict

local LoomRoot = script.Parent.Parent.Parent
local TypesFolder = LoomRoot.Types

local Promise = require(script.Parent.Parent.Parent.Vendors.Promise)
local ServiceType = require(TypesFolder.Service)

local ServiceManager = {}
local services = {} :: { [string]: ServiceType.Service }

local function runLifecycle(service: ServiceType.Service, methodName): boolean
	local method = service[methodName]

	if type(method) ~= "function" then
		return true
	end

	local success, err = xpcall(function()
		method(service)
	end, debug.traceback)

	if not success then
		warn(`[Loom] Failed to run {methodName} for {service.Name}: {err}`)
		return false
	end

	return true
end

function ServiceManager.Register(serviceDef: ServiceType.Service)
	if services[serviceDef.Name] then
		error(`Service {serviceDef.Name} already exists!`, 2)
	end

	services[serviceDef.Name] = serviceDef
end

function ServiceManager.Get(serviceName: string)
	local service = services[serviceName]
	if not service then
		error(`Couldn't find Service: {serviceName}`)
	end
end

function ServiceManager.Start()
	local successfullyInitialized = {}
	local promises = {} :: { [number]: Promise.TypedPromise<any> }

	for _, service in pairs(services) do
		table.insert(
			promises,
			Promise.new(function(resolve, reject)
				local success = runLifecycle(service, "LoomInit")

				if success then
					table.insert(successfullyInitialized, service)
					resolve()
				else
					reject()
				end
			end)
		)
	end

	local success, err = Promise.all(promises):await()
	if not success then
		warn(`[Loom] Some services failed to initialize. Error: {err}`)
	end

	for _, service in pairs(successfullyInitialized) do
		task.spawn(function()
			runLifecycle(service, "LoomStart")
		end)
	end
end

return table.freeze(ServiceManager)
