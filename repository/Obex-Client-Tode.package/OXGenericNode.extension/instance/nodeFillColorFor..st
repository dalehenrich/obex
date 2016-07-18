*obex-client-tode
nodeFillColorFor: builder
	self isRoot
		ifTrue: [ ^ Color red alpha: 0.5 ].
	self isLeaf
		ifTrue: [ 
			self isDone ifTrue: [^ Color green  alpha: 0.4].
			^ Color green ].
	self isDone not
		ifTrue: [ ^ Color brown alpha: 0.5 ].
	self isMetaclassReference
		ifTrue: [ ^ Color gray alpha: 0.5 ].
	self hasAdditionalParents
		ifTrue: [ ^ Color orange alpha: 0.5 ].
	^ Color blue alpha: 0.5