other
report

	| stream list |
	stream := WriteStream on: String new.
	list := OrderedCollection new.
	classes keysAndValuesDo: [:key :value | list add: key -> value].
	list := list asSortedCollection: [:a :b | a value > b value].
	1 to: (200 min: list size) do: [:i |
		| classOop count theClass |
		classOop := (list at: i) key.
		count := (list at: i) value.
		theClass := self class classes at: classOop ifAbsent: [nil].
		i printOn: stream.
		stream tab.
		count printOn: stream.
		stream tab.
		theClass notNil ifTrue: [
			stream nextPutAll: theClass name.
		] ifFalse: [
			classOop printOn: stream.
		].
		stream cr.
	].
	^stream contents.
