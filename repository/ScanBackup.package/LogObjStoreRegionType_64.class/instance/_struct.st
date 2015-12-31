other
_struct
"
class LogObjStoreRegionType {  // used in LOG_DATA_RECORD and LOG_BEGIN_DATA_RECORD
	ByteType		_kind;				// 01/01	// same in both LogObjStoreType and LogObjStoreRegionType 
	ByteType		extentId;			// 02/01
	ushort			startIv;			// 03/02
	ushort			numIvs;			// 05/02
	ushort			physSize;			// 07/02
	uint64			_objIdWord;	// 09/08
	// variable size body of bytes or oop instance variables per numIvs.
}
"