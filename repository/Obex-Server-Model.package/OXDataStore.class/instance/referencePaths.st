accessing
referencePaths
  referencePaths ifNil: [ referencePaths := OXReferencePathDataStore new ].
  ^ referencePaths