Printing
printOn: aStream

	| x |
	aStream
		nextPutAll: 'LogRecordHdr (';
		nextPutAll: 'beginId: ';
		nextPutAll: ((x := self beginId printString) copyFrom: 8 to: x size);
		nextPutAll: '; sessionId: ';
		nextPutAll: self sessionId printString;
		nextPutAll: '; recordKind: ';
		nextPutAll: self recordKind printString;
		nextPutAll: '; recordSize: ';
		nextPutAll: self recordSize printString;
		nextPutAll: ')';
		yourself.
