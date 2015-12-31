other
_struct
"
/* header of logical record of kinds LOG_DATA_RECORD, LOG_BEGIN_DATA_RECORD */
typedef struct {
	LogRecordHdrSType	hdr;
	//		following fields only present if > 0 objects in body, i.e. if hdr.recordSize > sizeof(LogRecordHdrSType)
	short							numStoreRecs;	//	2/01
	short							pad1;					//	2/03
	int								pad2;					//	4/05
}  LogDataRecordSType; 							// 8 bytes
// 	body of LogDataRecordSType contains	//	starting at byte 9
//  	one or more LogObjStoreType or LogObjStoreRegionType not sorted by objId .
"