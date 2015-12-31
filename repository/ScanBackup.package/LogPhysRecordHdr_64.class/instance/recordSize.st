Accessing
recordSize
	"Backup files:  total physical size in K bytes"

	^(self int16At: 3) * (self isBackupRecord ifTrue: [1024] ifFalse: [1]).
