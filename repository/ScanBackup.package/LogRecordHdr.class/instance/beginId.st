Accessing
beginId

	^Array
		with: (self int32At: 1)
		with: (self int32At: 5).		"RepTransBeginIdSType -  incremented for each trans. begin"
