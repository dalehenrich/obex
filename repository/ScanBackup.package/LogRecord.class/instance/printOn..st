Printing
printOn: aStream
[
	aStream 
		nextPutAll: self class name; space; 
		nextPutAll: self fileId printString; nextPut: $.;
		nextPutAll: self blockId printString; nextPut: $.;
		nextPutAll: self recordId printString;
		nextPutAll: '  ';
		nextPutAll: self name;
		nextPutAll: ' session: ';
		nextPutAll: self sessionId printString;
		nextPutAll: ' beginId: (';
		nextPutAll: self beginId last printString; space;
		nextPutAll: self beginId first printString;
		nextPutAll: ')';
		yourself.
] on: Error do: [:ex | aStream nextPutAll: ex description]
