other
verifyTypeOfRootRecord: aLogRootRecord

	aLogRootRecord header isLogRootRecord ifFalse: [self error: 'Expected transaction log root record'].
