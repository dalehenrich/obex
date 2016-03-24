analysis
rawListInMemoryReferences: objectsArray
  System commit.	"so that persistent bits don't count as in memory refs"
  System _vmMarkSweep.
  ^ SystemRepository listReferencesInMemory: objectsArray