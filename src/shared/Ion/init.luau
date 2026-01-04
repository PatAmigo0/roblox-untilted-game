local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RobloxPackages = ReplicatedStorage.RobloxPackages

local Promise = require(RobloxPackages["typed-promise"])
local ByteNet = require(RobloxPackages["bytenet"])

local Ion = {}
Ion.Services = {}
Ion.Controllers = {}

function Ion:Start()
	return Promise.new(function(resolve, reject: (...any) -> (), onCancel: (abortHandler: (() -> ())?) -> boolean)
		resolve()
	end):andThen(function(): ...any
		print("SA")
	end)
end

function Ion:GetByteNet()
	return ByteNet
end

return Ion
