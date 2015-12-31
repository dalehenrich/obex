Structures
_struct

"Definition of LogPhysRecordHdrSType from logdisk.ht for 32-bit 6.5.5:

typedef struct {
	ByteType						pageKind;					/* 1/01 either REP_LOG_RECORD or REP_BACKUP_RECORD */
	ByteType						pageDirty;					/* 1/02 not used */
	ByteType						netStatus;					/* 1/03 transient, for dbfio, pgsvr */
	ByteType						inSharedCache;			/* 1/04 not used */

	short								recordSize;					/* 2/05 Backup files:  total physical size in K bytes */
	short								numLogicalRecords;		/* 2/07 number of logical records in physical*/
	RepLogRecordIdSType		prevRecordId;				/* 8/09 id of physical log record that logically preceeds this record in the logical log. */

	RepLogRecordIdSType		recordId;						/* 8/17 id of this record */
	unsigned long					fileCreationTime;			/* 4/25 time(NULL) of log file creation */
  } LogPhysRecordHdrSType;  /* 28 bytes */

From reposdisk.ht:
  REP_LOG_RECORD,   		/* 16, record in transaction log file, header is instance of LogPhysRecordHdrSType*/
  REP_BACKUP_RECORD, 	/* 18, record in backup file, header is instance of instance of LogPhysRecordHdrSType*/
"
