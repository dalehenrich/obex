Accessing
int32At: anInteger

	^(bytes at: anInteger + Int32a)
		* 256 + (bytes at: anInteger + Int32b)
		* 256 + (bytes at: anInteger + Int32c)
		* 256 + (bytes at: anInteger + Int32d).
