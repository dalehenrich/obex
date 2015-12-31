*scanbackup
printOn: aStream

	aStream nextPutAll: 'ByteArray withAll: #('.
	1 to: (400 min: self size) do: [:each | 
		(self at: each) printOn: aStream.
		aStream space.
	].
	400 < self size ifTrue: [aStream nextPutAll: '...'].
	aStream nextPut: $).
