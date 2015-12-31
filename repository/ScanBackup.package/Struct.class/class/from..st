other
from: aStream

	^self  bytes: (aStream next: self byteSize) asByteArray.
