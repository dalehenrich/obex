Accessing
compatibilityLevel
"
	830 ==> 64-bit 2.3.x, 2.4.x
"
	| offset x |
	offset := 16.	"for backup; 0 for tranlog"
	x := (bytes at: offset + 4)
		* 256 + (bytes at: offset + 3)
		* 256 + (bytes at: offset + 2)
		* 256 + (bytes at: offset + 1).
	^x.
