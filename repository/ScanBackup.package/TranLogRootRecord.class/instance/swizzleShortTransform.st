Accessing
swizzleShortTransform

	| offset |
	offset := 0.	"16 for backups; 0 for tranlog"
	^bytes copyFrom: offset + 9 to: offset + 10.
