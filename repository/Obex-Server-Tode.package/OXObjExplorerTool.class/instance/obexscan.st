obex
obexscan
  "
  obex scan [--dir=<backup-directory>] [--backup] [--samples=<sample-limit>] <backup-file-name>
"

  | dir buTool backupPath scan dataStore |
  self
    getSubcommandOptsMixedLongShort:
      {#('dir' nil #'required').
      #('backup' nil #'none').
      #('samples' nil #'required')}.
  buTool := self topez toolInstanceFor: 'bu'.
  subOptions
    at: 'dir'
    ifPresent: [ :arg | dir := arg ]
    ifAbsent: [ dir := buTool buBackupDirectory ].
  subArguments isEmpty
    ifTrue: [ self error: 'Missing required argument <backup-file>. See man page for details.' ].
  backupPath := dir , '/' , (subArguments at: 1).
  subOptions at: 'backup' ifPresent: [ :ignored | buTool buBackup: dir ].
  dataStore := self obexDataStore.
  subOptions
    at: 'samples'
    ifPresent: [ :arg | 
      dataStore
        scanBackupForClassInstanceCountAndInstanceSamples: backupPath
        sampleLimit: arg asNumber ]
    ifAbsent: [ dataStore scanBackupForClassInstanceCount: backupPath ].
  ^ true