other
addObjectCountTo: aDictionary

	| offset numObjs |
	offset := 9.	"LogDataRecordSType size (24) - LogRecordHdrSType size (16) + 1"
	numObjs := self numObjs.
	numObjs timesRepeat: [
		| header classOop count physSize |
		header := ObjHdr_32 bytes: (bytes copyFrom: offset to: ObjHdr_32 byteSize + offset - 1).
		classOop := header classOop.
		count := aDictionary
			at: classOop
			ifAbsentPut: [0].
		aDictionary
			at: classOop
			put: count + 1.
		physSize := header physSize.
		offset := offset + physSize.
	].
