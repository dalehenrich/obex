accessing
objectInventory
  objectInventory ifNil: [ objectInventory := Stack new ].
  ^ objectInventory