other
_struct
"
/* header for LOG_DATA_RECORD */
typedef struct {
	LogRecordHdrSType		hdr;				/* 16 bytes already read so not included here */
/* following fields only present if > 0 objects in body, i.e. if hdr.recordSize > sizeof(LogRecordHdrSType) */
	short							extentId;		/* 2/1 */
	short							numObjs;		/* 2/3 */
	long							clusterId;		/* 4/5 */
}  LogDataRecordSType; 						/* 16 + 8 = 24 bytes */
"
