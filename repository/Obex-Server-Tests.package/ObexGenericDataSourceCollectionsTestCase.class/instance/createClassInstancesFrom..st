private
createClassInstancesFrom: baseCollection
  ^ self classesAndCollectionClasses
    collect: [ :ar | 
      | class |
      class := ar at: 1.
      class from: baseCollection ]