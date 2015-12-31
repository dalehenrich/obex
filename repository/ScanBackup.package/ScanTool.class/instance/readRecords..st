other
readRecords: anInteger

	1 to: anInteger do: [:i | 
		self readRecord: i.
		System commitTransaction ifFalse: [self error: 'commit failed'].
	].
