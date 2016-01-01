*obex-client-tode
editFrom: aGemStoneClient windowId: aWindowId
	| b |
	b := RTSpectrograph new.
	b objects: self dataPoints.
	b lineBlock: [ :dataPoint | 1 to: dataPoint instanceCount ].
	b title: 'Class instance count'.
	b build.
	b view open.
	^ nil