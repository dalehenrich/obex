Utility
initializeSwizzle

	(self swizzleLongTransform asArray = #(0 1 2 3) and: [self swizzleShortTransform asArray = #(0 1)]) ifTrue: [
		Int64a := 7. Int64b := 6. Int64c := 5. Int64d := 4. Int64e := 3. Int64f := 2. Int64g := 1. Int64h := 0.
		Int32a := 3. Int32b := 2. Int32c := 1. Int32d := 0.
		Int16a := 1. Int16b := 0.
		^self.
	].
	(self swizzleLongTransform asArray = #(3 2 1 0) and: [self swizzleShortTransform asArray = #(1 0)]) ifTrue: [
		Int64a := 0. Int64b := 1. Int64c := 2. Int64d := 3. Int64e := 4. Int64f := 5. Int64g := 6. Int64h := 7.
		Int32a := 0. Int32b := 1. Int32c := 2. Int32d := 3.
		Int16a := 0. Int16b := 1.
		^self.
	].
	self error: 'Unrecognized swizzle transformer'.

