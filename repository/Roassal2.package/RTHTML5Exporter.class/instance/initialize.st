initialize-release
initialize
	super initialize.
	self exportFixedShapes: true.
	self jsreference: 'roassal.js'.
	self defaultMarginScale.