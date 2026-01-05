--!strict

export type ReliabilityTypeEnum = {
	Reliable: "reliable",
	Unreliable: "unreliable",
}

local ReliabilityType: ReliabilityTypeEnum = {
	Reliable = "reliable",
	Unreliable = "unreliable",
}

return table.freeze(ReliabilityType)
