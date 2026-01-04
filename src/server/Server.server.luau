local ProcessInstancePhysicsService = game:GetService("ProcessInstancePhysicsService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RobloxPackages = ReplicatedStorage.RobloxPackages
local Shared = ReplicatedStorage.Shared

local Logger = require(RobloxPackages.logging)
local Ion = require(Shared.Ion)

print(Logger.Level)

Ion:Start()
