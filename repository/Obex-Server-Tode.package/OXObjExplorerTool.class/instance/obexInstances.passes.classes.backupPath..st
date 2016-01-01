obex
obexInstances: initialLeaves passes: passes classes: classes backupPath: backupPath
  | passCnt dataStore classInstanceCountsAndInstances leaves |
  leaves := initialLeaves.
  passCnt := 1.
  [ passCnt < passes ]
    whileTrue: [ 
      | newLeaves nodeType |
      newLeaves := {}.
      passCnt := passCnt + 1.
      nodeType := passCnt = passes
        ifTrue: [ #'root' ]
        ifFalse: [ #'internal' ].
      Transcript
        cr;
        show:
            'pass ' , passCnt printString , ' leaves: ' , leaves size printString.
      leaves
        do: [ :dpNode | 
          | dataPoint parents |
          dataPoint := dpNode dataPoint.
          parents := dataPoint calculateParents: nodeType.
          dpNode parents: parents asArray.
          newLeaves addAll: parents.
          System commit ].
      leaves := newLeaves ]