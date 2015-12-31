Accessing
swizzleShortTransform

	| offset |
	offset := 16.	"for backups; 0 for tranlog"
	^bytes copyFrom: offset + 9 to: offset + 10.
