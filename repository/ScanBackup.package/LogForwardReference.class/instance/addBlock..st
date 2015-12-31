other
addBlock: aBlock

	blocks isNil ifTrue: [blocks := OrderedCollection new].
	blocks add: aBlock.
