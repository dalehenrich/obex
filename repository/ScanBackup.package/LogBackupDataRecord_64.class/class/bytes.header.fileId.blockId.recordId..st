other
bytes: aByteArray header: aLogRecordHdr fileId: fileInteger blockId: blockInteger recordId: recordInteger

	^self bytes: aLogRecordHdr bytes , aByteArray.
