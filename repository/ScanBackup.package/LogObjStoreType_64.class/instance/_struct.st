other
_struct
"
class LogObjStoreType {			// used in LOG_DATA_RECORD and LOG_BEGIN_DATA_RECORD
	ByteType			_kind;			//	01/01	// same in both LogObjStoreType and LogObjStoreRegionType      
	ByteType			_extentId;	//	02/01
	ushort				clusterId;		//	03/02	// from data page header of the object
	uint					_recordId;	//	05/04	// recordId for debugging only
	ObjHdrSType	objHdr;		//	09/??	// actually variable sized ObjSType
}
"