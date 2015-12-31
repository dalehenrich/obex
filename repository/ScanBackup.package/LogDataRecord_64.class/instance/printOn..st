Printing
printOn: aStream

	super printOn: aStream.
	aStream 
		nextPutAll: '  numStoreRecs: ';
		nextPutAll: self numStoreRecs printString;
		nextPutAll: '; user: ???';
		yourself.
