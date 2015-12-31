other
_struct
"
typedef struct {
	LogRecordHdrSType		hdr;
	RepLogRecordIdSType		beginLogRecord;		/* rec. contains or preceeds BEGIN_DATA */
	RepPageIdType				crPageId;					/* of the orginal commit, for debugging only */
	OopType							userProfile;				/* to allow security audits of tranlog */
	RepTransBeginIdSType	commitSequence;
	int									commitSeqType;		/* TranCommitSeqType */   /* fix 29749 */
	unsigned int					timeWritten; 
}  LogCommitRecordSType;   /* the last record of a successful transaction*/
"