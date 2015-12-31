Printing
printOn: aStream

	aStream
		nextPutAll: 'ObjHdr_64 -- objId: ';
		nextPutAll: self objId printString;
		nextPutAll: '; classOop: ';
		nextPutAll: self classOop printString;
		nextPutAll: '; segment: ';
		nextPutAll: self segment printString;
		nextPutAll: '; length: ';
		nextPutAll: self length printString;
		nextPutAll: '; gcSize: ';
		nextPutAll: self gcSize printString;
		nextPutAll: '; physSize: ';
		nextPutAll: self physSize printString;
		nextPutAll: '; flags: ';
		nextPutAll: (self rawFlags printStringRadix: 2);
		yourself.
