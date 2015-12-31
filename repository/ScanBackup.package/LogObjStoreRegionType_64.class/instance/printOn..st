other
printOn: aStream

	aStream
		nextPutAll: self class name;
		nextPutAll: ' - kind: ';
		nextPutAll: self kind printString;
		nextPutAll: '; extentId: ';
		nextPutAll: self extentId printString;
		nextPutAll: '; startIv: ';
		nextPutAll: self startIv printString;
		nextPutAll: '; numIvs: ';
		nextPutAll: self numIvs printString;
		nextPutAll: '; physSize: ';
		nextPutAll: self physSize printString;
		nextPutAll: '; objIdWord: ';
		nextPutAll: self objIdWord printString;
		yourself.
