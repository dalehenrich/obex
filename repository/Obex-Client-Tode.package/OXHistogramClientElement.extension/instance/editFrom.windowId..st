*obex-client-tode
editFrom: aGemStoneClient windowId: aWindowId
	| b maxCount scale |
	maxCount := 0.
	self dataPoints do: [:dp | maxCount := maxCount max: (dp perform: self dataPointSelector)].
	scale := 50 / maxCount.
	b := RTSpectrograph new.
	b objects: self dataPoints.
	b popupText: [ :dataPoint :ignored | dataPoint className, ', ', (dataPoint perform: self dataPointSelector) printString  ].
	b lineBlock: [ :dataPoint | 1 to: ((dataPoint perform: self dataPointSelector) * scale) asInteger ].
	b title: self graphicLabel.
	b build.
	b view open.
	^ nil