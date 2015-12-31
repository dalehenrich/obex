Structures
_struct

"Definition of LogRecordHdrSType from logdisk.ht:

typedef struct {
	RepTransBeginIdSType		beginId;			/* 8/01 - incremented for each trans. begin */
	short								sessionId;		/* 2/09 - easy hash value of sessionId */
	short								recordKind;		/* 2/11 - LogRecordKindEType */
	unsigned short				recordSize;		/* 2/13 - in bytes */
	short								spare;			/* 2/15 - was  crBacklog in 2G */
} LogRecordHdrSType;     /* 16 bytes */
"
