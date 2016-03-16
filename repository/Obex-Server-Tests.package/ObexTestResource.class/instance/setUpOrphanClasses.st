running
setUpOrphanClasses
  "self reset"

  false
    ifTrue: [ 
      "creates potentially uncollectable garbage, until Bug46116 is fixed"
      self setUpBug46116 ].
  self
    setupOrphanClass1;
    yourself