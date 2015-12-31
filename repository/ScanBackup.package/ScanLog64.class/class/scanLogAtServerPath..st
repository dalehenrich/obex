other
scanLogAtServerPath: aString
"
	ScanLog64 resetObjectTable.
	ScanLog64 scanLogAtServerPath: '/export/toronto3/users/jfoster/run/logs/jfoster0_log26.dbf'.
"
	^self new 
		path: aString;
		report.
