*obex-client-tode
editFrom: aGemStoneClient windowId: aWindowId
	| b maxCount scale |
	maxCount := 0.
	self dataPoints do: [:dp | maxCount := maxCount max: dp instanceCount].
	scale := 50 / maxCount.
	b := RTSpectrograph new.
	b objects: self dataPoints.
	b popupText: [ :dataPoint :ignored | dataPoint className, ', ', dataPoint instanceCount printString  ].
	b lineBlock: [ :dataPoint | 1 to: (dataPoint instanceCount * scale) asInteger ].
	b title: 'Class instance count'.
	b build.
	b view open.
	^ nil