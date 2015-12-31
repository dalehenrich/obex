Printing
printOn: aStream

	aStream
		nextPutAll: 'LogPhysRecordHdr_32 (pageKind=';
		nextPutAll: ([self pageKind printString] on: Error do: [:ex | ^ex description]);
		nextPutAll: '; recordSize=';
		nextPutAll: ([self recordSize printString] on: Error do: [:ex | ^ex description]);
		nextPutAll: '; numLogicalRecords=';
		nextPutAll: ([self numLogicalRecords printString] on: Error do: [:ex | ^ex description]);
		nextPutAll: '; fileCreationTime=';
		nextPutAll: ([self fileCreationTime printString] on: Error do: [:ex | ^ex description]);
		nextPutAll: ')';
		yourself.
