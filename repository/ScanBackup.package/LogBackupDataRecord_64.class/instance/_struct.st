other
_struct
"
/* header for LOG_BACKUP_DATA_RECORD */
typedef struct {
	LogRecordHdrSType	hdr;				/* 16/01 */
	/* following fields only present if > 0 objects in body, i.e. if hdr.recordSize > sizeof(LogRecordHdrSType) */
	short							extentId;		/* 2/17 */
	short							numObjs;		/* 2/19 */
	int								clusterId;		/* 4/21 */
	int								recordId;		/* 4/25 for debugging */
	}  LogBackupDataRecordSType;		/* 28 bytes */
	// body of LogBackupDataRecordSType contains instances of ObjSType, sorted (I think) by objId
"