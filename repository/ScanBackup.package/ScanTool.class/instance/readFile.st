other
readFile

	| counter |
	counter := 0.
	Struct reset.
	self determineFileTypeAndVersion.
	[
		file atEnd not.
	] whileTrue: [
		self readPhysicalRecord.
		System commitTransaction ifFalse: [self error: 'commit failed'].	"Avoid holding a commit record"
		counter := counter + 1.
	].
