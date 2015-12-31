objects
processObject

	| objStoreType classOop |
	objStoreType := LogObjStoreType_64 from: stream.
	objectHeader := ObjHdr_64 from: stream.
	object := stream next: objectHeader physSize - ObjHdr_64 byteSize.
	classOop := objectHeader classOop.
	classOop = String 			asOop ifTrue: [self processString. 			^self].
	classOop = Symbol 		asOop ifTrue: [self processSymbol. 		^self].
	classOop = GsMethod 	asOop ifTrue: [self processGsMethod. 	^self].
	classOop = Metaclass 	asOop ifTrue: [self processMetaclass. 	^self].
	classOop = Class 			asOop ifTrue: [self processClass. 			^self].
	objectHeader isOops ifTrue: [
		| oops |
		oops := Array new: objectHeader gcSize.
		1 to: oops size do: [:i | 
			oops at: i put: (self int64At: i - 1 * 8 + 1 in: object).
		].
	] ifFalse: [
		"self halt."
	].
