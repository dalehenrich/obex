Printing
printOn: aStream

	| x |
	super printOn: aStream.
	aStream cr; 
		nextPutAll: '  compatibilityLevel: ';
		nextPutAll: self compatibilityLevel printString; cr;

		nextPutAll: '  currentLogFileId: ';
		nextPutAll: self fileId printString; cr;

		nextPutAll: '  swizzleLongTransform: ';
		nextPutAll: ((x := self swizzleLongTransform printString) copyFrom: 21 to: x size);
		nextPutAll: '; swizzleShortTransform: ';
		nextPutAll: ((x := self swizzleShortTransform printString) copyFrom: 21 to: x size); cr;

		nextPutAll: '  stnVersion: ';
		nextPutAll: self stnVersion printString; cr;
		nextPutAll: '  reposBirth: time=';
		nextPutAll: self reposBirthTime printString;
		nextPutAll: '; machine=';
		nextPutAll: self birthMachineKind printString;
		nextPutAll: '; hostId=';
		nextPutAll: ((x := self oldBirthHostId printString) copyFrom: 21 to: x size); cr;

		nextPutAll: '  reposId: ';
		nextPutAll: ((x := self reposId printString) copyFrom: 8 to: x size); cr;

		nextPutAll: '  originalLogBirth: time=';
		nextPutAll: self originalLogBirthTime printString;
		nextPutAll: '; machine=';
		nextPutAll: self originalLogBirthMachineKind printString;
		nextPutAll: '; hostId=';
		nextPutAll: ((x := self oldOriginalLogbirthHostId printString) copyFrom: 21 to: x size); cr;

		nextPutAll: '  currentLogBirth: time=';
		nextPutAll: self currentLogBirthTime printString;
		nextPutAll: '; machine=';
		nextPutAll: self currentLogBirthMachineKind printString;
		nextPutAll: '; hostId=';
		nextPutAll: ((x := self oldCurrentLogbirthHostId printString) copyFrom: 21 to: x size); cr;

		nextPutAll: '  logOriginTime: ';
		nextPutAll: self logOriginTime printString; cr;

		nextPutAll: '  numberOfExtents: ';
		nextPutAll: self numberOfExtents printString;
		yourself.
