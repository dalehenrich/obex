other
classOop

	^(self classSegWord bitAnd: 16rFFFFFFFFFF0000) / 16r100 + 1.
