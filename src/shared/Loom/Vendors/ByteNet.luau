--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RobloxPackages = ReplicatedStorage.RobloxPackages

local LoomRoot = script.Parent.Parent
local ByteNetLib = require(LoomRoot.Types.ByteNetLib)

local ByteNet = require(RobloxPackages.bytenet) :: any

return ByteNet :: ByteNetLib.ByteNet
