Printing
printOn: aStream
"
	ByteType			_kind;			//	01/01	// same in both LogObjStoreType and LogObjStoreRegionType      
	ByteType			_extentId;	//	02/01
	ushort				clusterId;		//	03/02	// from data page header of the object
	uint					_recordId;	//	05/04	// recordId for debugging only
"
	aStream
		nextPutAll: 'LogObjectStoreType -- kind: ';
		nextPutAll: self kind printString;
		nextPutAll: '; extentId: ';
		nextPutAll: self extentId printString;
		nextPutAll: '; clusterId: ';
		nextPutAll: self clusterId printString;
		nextPutAll: '; recordId: ';
		nextPutAll: self recordId printString;
		yourself.
