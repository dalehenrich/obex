other
readObjects

	self
		setObject: [superClass						:= self objectAt: 1];
		setObject: [format								:= self objectAt: 2];
		setObject: [instVars							:= self objectAt: 3];
		setObject: [instVarNames					:= self objectAt: 4];
		setObject: [constraints						:= self objectAt: 5];
		setObject: [classVars							:= self objectAt: 6];
		setObject: [methodDict						:= self objectAt: 7];
		setObject: [poolDictionaries				:= self objectAt: 8];
		setObject: [categories						:= self objectAt: 9];
		setObject: [secondarySuperclasses 	:= self objectAt: 10];
		setObject: [thisClass 							:= self objectAt: 11];
		yourself.
