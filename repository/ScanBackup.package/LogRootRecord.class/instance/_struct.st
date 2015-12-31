Structures
_struct

"Definition of LogRootRecordSType from logdisk.ht:

typedef struct {
	LogRecordHdrSType hdr;	/* 16 bytes already read by the time we get here */

	/* following fields are written in canonical byte ordering */
	int				compatibilityLevel;                     					/* 4/01 */
	ByteType		swizzleLongTransform[SIZEOF(int)];			/* 4/05 */
	ByteType		swizzleShortTransform[SIZEOF(short)];		/* 2/09 */
	ByteType		spare[SIZEOF(short)];								/* 2/11 */

	/* Following longs are in native byte ordering, and only swizzled if needed */

	 /* following fields are for correlation with the repository */
	unsigned int			reposBirthTime;							/* 4/13 - correlate log files to repository */
	int							birthMachineKind;						/* 4/17 - for future use */
	HostIdSType			oldBirthHostId;							/* 4/21 - for future use */
	RepUniqueIdSType	reposId;										/* 8/25 - Unique identifier for the repository */

	 /* correlate log file to the original log file for the repository */
	unsigned int			originalLogBirthTime;					/* 4/33 - backup files: first backup file birth time */
	int							originalLogBirthMachineKind;			/* 4/37 - for future use */
	HostIdSType			oldOriginalLogbirthHostId;				/* 4/41 - for future use */

	 /* identification of this log file */
	unsigned int			currentLogBirthTime;					/* 4/45 - backup files: this backup file birth time */
	int							currentLogBirthMachineKind;			/* 4/49 - future use */
	HostIdSType			oldCurrentLogbirthHostId;				/* 4/53 - future use */
	int							currentLogFileId;							/* 4/57 - backup files: this backup file fileId */
	unsigned int			logOriginTime;								/* 4/61 - to correlate log files to repository */

	/* following are unused; initialized to zero */
	int							numberOfExtents;						/* 4/65 - number in the source repository at the time this file was written */
	int							spare2;										/* 4/69 */
	int							spare3;										/* 4/73 */
	int							spare4;										/* 4/77 */

	RepVersionStrType	stnVersion;                    /* 256 (in 64-bit) or 128 (in 32-bit) /81 - string used to identify the external release of the product. */
} LogRootRecordSType;"
