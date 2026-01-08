--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RobloxPackages = ReplicatedStorage.RobloxPackages
local Promise = require(RobloxPackages["typed-promise"])

-- re-exporting the types
export type Status = Promise.Status
export type Promise = Promise.Promise
export type TypedPromise<T...> = Promise.TypedPromise<T...>

return Promise
