sticking
testStickAbove

	TRConstraint stick: shape2 above: shape1.
	self assert: shape1 center = (0 @ 0).
	self assert: shape2 center = (0 @ -30).
	
	shape1 translateBy: 10 @ 10.
	self assert: shape1 center = (10 @ 10).
	self assert: shape2 center = (10 @ -20).
