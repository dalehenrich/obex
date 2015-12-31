other
processOopRegion

	| regionHeader physSize region list |
	regionHeader := LogObjStoreRegionType_64 from: stream.
	physSize := regionHeader physSize.
	region := stream next: physSize - regionHeader class byteSize.
	list := Array new: regionHeader numIvs.
	1 to: list size do: [:i | 
		list at: i put: (self int64At: i - 1 * 8 + 1 in: region).
	].
