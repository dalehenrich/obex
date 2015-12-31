other
processRecordWithHeader: aLogRecordHdr

	| i |
	stream := ReadStream on: bytes.
	stream skip: 8.
	LogRecordHdr byteSize < aLogRecordHdr recordSize ifFalse: [self halt. ^self].
	i := 0.
	self numStoreRecs timesRepeat: [
		| kind |
		i := i + 1.
		kind := stream peek.
		kind = 1 ifTrue: [self processObject 				] ifFalse: [	"LOG_STORE_KIND_OBJ"
		kind = 2 ifTrue: [self processOopRegion		] ifFalse: [	"LOG_STORE_OOP_REGION"
		kind = 3 ifTrue: [self processByteRegion 		] ifFalse: [	"LOG_STORE_BYTE_REGION"
		kind = 4 ifTrue: [self processSelectiveAbort 	] ifFalse: [	"LOG_STORE_SELECTIVE_ABORT"
		kind = 5 ifTrue: [self processDepMap 			] ifFalse: [	"LOG_STORE_DEP_MAP"
		kind halt]]]]].
	].
