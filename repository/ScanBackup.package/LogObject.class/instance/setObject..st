other
setObject: aBlock
 
	| result |
	(result := aBlock value) class == LogForwardReference ifFalse: [^self].
	result addBlock: aBlock.
