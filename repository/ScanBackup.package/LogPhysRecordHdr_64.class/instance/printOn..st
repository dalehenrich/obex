Printing
printOn: aStream

	aStream
		nextPutAll: 'LogPhysRecordHdr_64 ';
		nextPutAll: self blockId printString; space;
		nextPutAll: 'hdr.pageId ';
		nextPutAll: self pageId printString;
		nextPutAll: ', ';
		nextPutAll: 'Kind=(';
		nextPutAll: self pageKind printString;
		nextPutAll: ')';
		nextPutAll: (self pageKind = 16 ifTrue: ['Tran Log Record'] ifFalse: ['']); cr;
		nextPutAll: ' thisRecordId:(file:';
		nextPutAll: self fileId printString;
		nextPutAll: ' rec:';
		nextPutAll: self blockId printString;
		nextPutAll: ') previousRecordId:(file:';
		nextPutAll: self prevRecordId first printString;
		nextPutAll: ' rec:';
		nextPutAll: self prevRecordId last printString;
		nextPut: $); cr;
		nextPutAll: ' recordSize: ';
		nextPutAll: self recordSize printString;
		nextPutAll: ' numLogicalRecs: ';
		nextPutAll: self numLogicalRecords printString;
		nextPutAll: ' fileCreationTime: ';
		nextPutAll: self fileCreationTime printString;
		yourself.
