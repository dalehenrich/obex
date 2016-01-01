instance creation
for: anObject in: aReferencePathDataStore
  ^ self new
    oop: anObject asOop;
    className: anObject class name;
    referencePathDataStore: aReferencePathDataStore;
    yourself