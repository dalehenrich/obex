initialization
on: initialNodes
	self colorConditions.
	self setLabels.
	initialNodes do: [ :each | builder node: (self nodeFor: each) ].
	builder build.
	RTHorizontalTreeLayout on: builder view elements.
	builder view