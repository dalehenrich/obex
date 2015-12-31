Accessing
pageKind
	"either REP_LOG_RECORD (16) or REP_BACKUP_RECORD (18)"

	^self byteAt: 1.
