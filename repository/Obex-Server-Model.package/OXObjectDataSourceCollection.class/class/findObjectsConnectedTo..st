repository analysis
findObjectsConnectedTo: anArray
  "Find all objects reachable from the objects in the given array and return results in an instance of the receiver"

  | array |
  array := SystemRepository findObjectsConnectedTo: anArray.
  ^ self from: array