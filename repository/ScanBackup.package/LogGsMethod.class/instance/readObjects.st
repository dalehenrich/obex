other
readObjects

	self 
		setObject: [invocationCount 	:= self objectAt: 1];
		setObject: [numBreakpoints 	:= self objectAt: 2];
		setObject: [selector 				:= self objectAt: 3];
		setObject: [literalsOffset 		:= self objectAt: 4];
		setObject: [numArgs 				:= self objectAt: 5];
		setObject: [inClass 				:= self objectAt: 6];
		setObject: [numSends 			:= self objectAt: 7];
		setObject: [sourceString 		:= self objectAt: 8];
		setObject: [debugInfo 			:= self objectAt: 9];
		yourself.
