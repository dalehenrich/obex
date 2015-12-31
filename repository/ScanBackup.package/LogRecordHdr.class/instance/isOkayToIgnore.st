Querying
isOkayToIgnore

	^
		self isBackupDbgIds or: [
		self isBackupDepmapRecord or: [
		self isBackupEndCheckpoint or: [
		self isBackupEOF or: [
		self isBackupNotDead or: [
		self isBackupOReclDuringGc or: [
		self isBackupPdWsunion or: [
		self isBackupPossDeadObjs or: [
		self isBackupSharedCounters or: [
		self isBackupStartCheckpoint or: [
		self isLogAtomicPromoteRecord or: [
		self isLogCheckpointRecord or: [
		self isLogDeadobjsIdRecord or: [
		self isLogDebugInfo or: [
		self isLogFlushRecord or: [
		self isLogGcLock or: [
		self isLogGcReleaseLock or: [
		self isLogKeepPdWsUnion or: [
		self isLogLoginRecord or: [
		self isLogPreCheckpointRecord or: [
		self isLogResourceIdRecord or: [
		false]]]]]]]]]]]]]]]]]]]]].
