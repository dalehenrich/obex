hooks
on: canvas
	| encompassingRectangle |
	encompassingRectangle := self encompassingRectangleOf: canvas shapes.
	canvas camera translateTo: encompassingRectangle topLeft