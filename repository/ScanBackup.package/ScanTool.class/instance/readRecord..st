other
readRecord: anInteger

	| blockId header remainingSize newClass record pos1 pos2 |
	blockId := file position // 512.
	pos1 := file position.
	header := LogRecordHdr from: file.
	pos2 := file position.
	remainingSize := (header recordSize - header class byteSize) max: 0.
	header isOkayToIgnore ifTrue: [
		file skip: remainingSize. 
		^self.
	].
	newClass := 
		header isBackupDataRecord_64 ifTrue: [LogBackupDataRecord_64] ifFalse: [
		header isDataRecord ifTrue: [LogDataRecord_32] ifFalse: [
		header isLogAbortLogoutRecord ifTrue: [self halt. nil] ifFalse: [
		header isLogBeginDataRecord ifTrue: [LogBeginDataRecord_64] ifFalse: [
		header isLogCommitRecord ifTrue: [LogCommitRecord] ifFalse: [
		header isLogDataRecord_32 ifTrue: [LogDataRecord_32] ifFalse: [
		header isLogDataRecord_64 ifTrue: [LogDataRecord_64] ifFalse: [
		nil]]]]]]].
	newClass isNil ifTrue: [header recordKind error: 'Unknown record type!'].
	record := newClass 
		bytes: (file next: remainingSize) asByteArray
		header: header
		fileId: self fileId
		blockId: blockId
		recordId: anInteger - 1.
	self processHeader: header record: record.
