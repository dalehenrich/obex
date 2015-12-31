Structures
_struct

"Definition of LogPhysRecordHdrSType from logdisk.ht for 64-bit 2.4.1:

typedef struct {
	ByteType					pageKind;   				/* 1/01 - either REP_LOG_RECORD or REP_BACKUP_RECORD */
	ByteType					numLogicalRecords;  	/* 1/02 - number of logical records in physical		*/
	unsigned short			recordSize;  				/* 2/03 - Log files: size in bytes;  Backup files: total physical size in K bytes 	*/
	RepLogRecordIdSType 	prevRecordId; 			/* 8/05 - id of physical log record that logically preceeds this record in the logical log.  */
	RepLogRecordIdSType 	recordId;  					/* 8/13 - id of this record */
	unsigned int				fileCreationTime;			/* 4/21 - a time_t */
} LogPhysRecordHdrSType;  /* 24 bytes */

From reposdisk.ht:
  REP_LOG_RECORD,   		/* 16, record in transaction log file, header is instance of LogPhysRecordHdrSType*/
  REP_BACKUP_RECORD, 	/* 18, record in backup file, header is instance of instance of LogPhysRecordHdrSType*/
"
