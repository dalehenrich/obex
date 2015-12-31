Accessing
int64At: anInteger in: aByteArray

	^(aByteArray at: anInteger + Int64a)
		* 256 + (aByteArray at: anInteger + Int64b)
		* 256 + (aByteArray at: anInteger + Int64c)
		* 256 + (aByteArray at: anInteger + Int64d)
		* 256 + (aByteArray at: anInteger + Int64e)
		* 256 + (aByteArray at: anInteger + Int64f)
		* 256 + (aByteArray at: anInteger + Int64g)
		* 256 + (aByteArray at: anInteger + Int64h).
