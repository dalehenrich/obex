accessing
sortedClassByteCountList
  sortedClassByteCountList
    ifNil: [ sortedClassByteCountList := self sortClassByteCount: self classInstanceMap ].
  ^ sortedClassByteCountList