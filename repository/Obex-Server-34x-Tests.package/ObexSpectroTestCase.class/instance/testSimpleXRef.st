tests
testSimpleXRef
  "
  obex inventory --st=`ObexTestResource current simpleObjects`
  obex view --limit=100 --inventory=instances
  obex spectro --src=inventory --bytes --classes=10 --exclude=`ObexTestResource current excludedParentsArray`
  obex view --spectro=instances
"

  "in the above tODE commands, the spectro view starts with the inventory leaves ... the sole instance of ObexTestObject shows up at different points in the repference patch for each of the leaves, but the spectro view ends up with what appear to be separate instances of ObexTestObject in the graph, when the graphics should show that the samples for instances of ObexTextObject are actually the same ...."

  "we need a central list of class sample instances ...  and perhaps the lists should be combined in some way ... of show as a compound node ???"

