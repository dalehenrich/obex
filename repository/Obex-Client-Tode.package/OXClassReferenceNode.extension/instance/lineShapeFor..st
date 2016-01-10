*obex-client-tode
lineShapeFor: builder
| lineShape |
	lineShape := RTArrowedLine new
		color: (Color red alpha: 0.5);
		width: 3.
	lineShape withShorterDistanceAttachPoint.
	lineShape inverted.
	^  lineShape