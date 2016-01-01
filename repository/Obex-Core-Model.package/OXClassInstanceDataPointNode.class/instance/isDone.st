testing
isDone
  ^ nodeType == #'root' or: [ nodeType == #'leaf' or: [ parents notNil ] ]