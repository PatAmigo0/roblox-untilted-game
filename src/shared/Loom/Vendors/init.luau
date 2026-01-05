--!strict

local ByteNet = require(script.ByteNet)
local Promise = require(script.Promise)

local Vendors = {
	ByteNet = ByteNet,
	Promise = Promise,
}

return table.freeze(Vendors)
