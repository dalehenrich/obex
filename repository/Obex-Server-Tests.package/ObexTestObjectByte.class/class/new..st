Instance Creation
new: aSize

"Returns a new instance of the receiver, of sufficient size to hold aSize
 Characters of two bytes each."

^ self _basicNew:  aSize + aSize 
