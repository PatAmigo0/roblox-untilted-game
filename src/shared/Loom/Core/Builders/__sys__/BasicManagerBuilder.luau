--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LoomRoot = script.Parent.Parent.Parent.Parent -- script.__sys__.Builders.Core.Loom
local typed_logger = require(ReplicatedStorage.RobloxPackages.typed_logger)
local LoomTypes = require(LoomRoot.Types)
local Promise = require(LoomRoot.Vendors.Promise)

local logger = typed_logger.new()

local function runLifecycle(item: any, methodName: string): boolean
	local method = item[methodName]

	if type(method) ~= "function" then
		return true
	end

	local success, err = xpcall(function()
		method(item)
	end, debug.traceback)

	if not success then
		warn(`[Loom] Failed to run {methodName} for {item.Name}: {err}`)
		return false
	end

	return true
end

local function normalizeItem(item: LoomTypes.LoomMember)
	if not item.Priority then
		item.Priority = -math.huge
	end
end

local ManagerBuilder = {}
ManagerBuilder.__index = ManagerBuilder

function ManagerBuilder.new<T>(options: LoomTypes.BuilderOptions): LoomTypes.LoomManager<T>
	return ManagerBuilder._buildManager(options)
end

function ManagerBuilder._buildManager<T>(options: LoomTypes.BuilderOptions): LoomTypes.LoomManager<T>
	local ModuleName = options.Name
	local InitMethod = options.InitMethod or "LoomInit"
	local StartMethod = options.StartMethod or "LoomStart"

	local Manager = {}
	local items: { [string]: T? } = {}

	function Manager.Register(item: T): T
		local member = item :: any

		if items[member.Name] then
			error(`{ModuleName} {member.Name} already exists!`, 2)
		end

		normalizeItem(member)
		items[member.Name] = item
		return item
	end

	function Manager.Get(name: string): T?
		local item = items[name]
		if not item then
			error(`Couldn't find {ModuleName}: {name}`)
		end

		return item
	end

	function Manager.Start()
		local successfullyInitialized = {}
		local promises = {} :: { [number]: Promise.TypedPromise<any> }

		for _, item in pairs(items) do
			table.insert(
				promises,
				Promise.new(function(resolve, reject)
					local success = runLifecycle(item, InitMethod)

					if success then
						table.insert(successfullyInitialized, item)
						resolve()
					else
						reject()
					end
				end)
			)
		end

		local success, err = Promise.all(promises):await()
		if not success then
			logger:AtWarning():Log(`[Loom] Some {ModuleName}s failed to initialize. Error: {err}`)
		end

		for _, service in pairs(successfullyInitialized) do
			task.spawn(function()
				runLifecycle(service, StartMethod)
			end)
		end
	end

	Manager._items = items

	return table.freeze((Manager :: any) :: LoomTypes.LoomManager<T>)
end

return ManagerBuilder
