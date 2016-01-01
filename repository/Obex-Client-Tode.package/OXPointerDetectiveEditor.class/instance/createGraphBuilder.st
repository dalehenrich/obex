private
createGraphBuilder
	| b anim |
	self roassalView clean.
	b := OXPointerDetective new
		topez: self clientElement topez;
		view: roassalView;
		yourself.
	b builder
		addListenerBlock: [ :n | 
			anim := RTNopAnimation new.
			anim
				waitFor: 0.3
				after: [ 
					b2 notifyWith: n element.
					b1 notifyWith: n element ].
			b builder view addAnimation: anim ].
	b on: self initialNodes.
	roassalView signalUpdate.
	roassalView open