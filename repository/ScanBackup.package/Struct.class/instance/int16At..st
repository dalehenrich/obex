Accessing
int16At: anInteger

	^(bytes at: anInteger + Int16a)
		* 256 + (bytes at: anInteger + Int16b).
