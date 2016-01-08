accessing
sortedClassByteCountList
  sortedClassByteCountList
    ifNil: [ sortedClassByteCountList := self sortClassByteCount: self objectInventory ].
  ^ sortedClassByteCountList