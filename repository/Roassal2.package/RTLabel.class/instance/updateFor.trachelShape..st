rendering
updateFor: anElement trachelShape: trachelShape	
	| c s txt   |
	trachelShape isNil ifTrue: [ ^ self ].
	s := nil.
	c := self colorFor: anElement.
	 trachelShape 
				color: c;
				position: anElement position.

	txt := self textFor: anElement.
	trachelShape text: txt on: anElement position