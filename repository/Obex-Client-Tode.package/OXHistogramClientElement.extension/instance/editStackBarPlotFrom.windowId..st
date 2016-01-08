*obex-client-tode
editStackBarPlotFrom: aGemStoneClient windowId: aWindowId
	| b sels first second labels max label g colors |
	max := 0.
	sels := #(#instanceCount #byteCount).
	labels := #('Instances Count' 'Bytes Count').
	colors := {(Color red).
	(Color blue)}.
	first := 1.
	second := 2.
	self dataPointSelector == (sels at: 2)
		ifTrue: [ 
			first := 2.
			second := 1 ].
	b := RTStackBarPlot new.
	b colorPalette colors: (Array with: (colors at: first)).
	self dataPoints
		collect: [ :dp | 
			| pt |
			pt := dp perform: (sels at: first).
			max := max max: pt asString size ].
	self dataPoints
		do: [ :dp | 
			| pt pad |
			pt := dp perform: (sels at: first).
			pad := WriteStream on: String new.
			max - pt asString size timesRepeat: [ pad space ].
			b add: {pt} title: dp className , ' ' , pad contents , pt asString ].
	b barWidth: 500 height: 10.
	b build.
	g := RTGroup withAll: b view elements.
	label := (RTLabel new text: (labels at: first)) element.
	TRConstraint move: label below: g.
	b view add: label.
	b view open.
	^ nil