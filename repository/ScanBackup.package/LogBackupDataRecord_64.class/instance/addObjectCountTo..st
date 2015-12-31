other
addObjectCountTo: aDictionary

	| offset objects |
	offset := 33. "(28 / 8) ceiling * 8 + 1."
	objects := OrderedCollection new.
	self numObjs timesRepeat: [
		| header classOop count |
		header := ObjHdr_64 bytes: (bytes copyFrom: offset to: ObjHdr_64 byteSize + offset - 1).
		classOop := header classOop.
"classOop =  98817 ifTrue: [self halt]."
		count := aDictionary
			at: classOop
			ifAbsentPut: [0].
		aDictionary
			at: classOop
			put: count + 1.
		offset := offset + header physSize.
	].
