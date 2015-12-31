Printing
printOn: aStream

[
	super printOn: aStream.
	aStream cr;
		nextPutAll: '  extentId=';
		nextPutAll: self extentId printString;
		nextPutAll: '; numObjs=';
		nextPutAll: self numObjs printString;
		nextPutAll: '; clusterId=';
		nextPutAll: self clusterId printString;
		yourself.
] on: Error do: [:ex | aStream nextPutAll: ex description].
