other
open: aString

	| isCompressed |
	isCompressed := (aString copyFrom: aString size - 2 to: aString size) = '.gz'.
"isCompressed ifTrue: [self error: 'Compressed files take a long time to evalute #atEnd (#41850)']."
	file := GsFile
		open: aString
		mode: 'rb'
		onClient: false
		withCompression: isCompressed.
