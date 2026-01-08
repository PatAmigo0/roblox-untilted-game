--!strict

export type LoomMember = {
	Name: string,
	Priority: number?,
	LoomInit: ((self: LoomMember) -> ())?,
	LoomStart: ((self: LoomMember) -> ())?,
}

return nil
