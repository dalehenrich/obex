obex
obexscan
  "
  obex scan [--dir=<backup-directory>] [--backup] <backup-file-name>
  obex scan [--limit=<sample-limit>] --sample=<class-name> <backup-file-name>
  obex scan [--limit=<sample-limit>] --ref=<class-name> <backup-file-name>
"

  | dir buTool backupPath scan dataStore limit |
  self
    getSubcommandOptsMixedLongShort:
      {#('dir' nil #'required').
      #('backup' nil #'none').
      #('limit' nil #'required').
      #('ref' nil #'required').
      #('sample' nil #'required')}.
  buTool := self topez toolInstanceFor: 'bu'.
  subOptions
    at: 'dir'
    ifPresent: [ :arg | dir := arg ]
    ifAbsent: [ dir := buTool buBackupDirectory ].
  subArguments isEmpty
    ifTrue: [ self error: 'Missing required argument <backup-file>. See man page for details.' ].
  backupPath := dir , '/' , (subArguments at: 1).
  subOptions at: 'backup' ifPresent: [ :ignored | buTool buBackup: dir ].
  subOptions
    at: 'limit'
    ifPresent: [ :arg | limit := arg asNumber ]
    ifAbsent: [ limit := nil ].
  dataStore := self obexDataStore.
  subOptions
    at: 'sample'
    ifPresent: [ :className | 
      dataStore
        scanBackupForClassInstanceCountAndInstanceSamples: backupPath
        sampleClass: (Smalltalk at: className)
        limit: limit ]
    ifAbsent: [ 
      subOptions
        at: 'ref'
        ifPresent: [ :className | 
          dataStore
            scanBackupForClassInstanceReferenceCountAndInstanceSamples:
              backupPath
            instanceClass: (Smalltalk at: className)
            limit: limit ]
        ifAbsent: [ dataStore scanBackupForClassInstanceCount: backupPath ] ].
  ^ true