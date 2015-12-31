other
bytes: aByteArray header: aLogRecordHdr fileId: fileInteger blockId: blockInteger recordId: recordInteger

	^(self bytes: aByteArray)
		header: aLogRecordHdr;
		fileId: fileInteger;
		blockId: blockInteger;
		recordId: recordInteger;
		yourself.
