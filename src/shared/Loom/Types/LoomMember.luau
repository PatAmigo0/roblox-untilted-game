--!strict

export type LoomMember = {
	Name: string,
	LoomInit: ((self: LoomMember) -> ())?,
	LoomStart: ((self: LoomMember) -> ())?,
}

return nil
