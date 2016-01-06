obex
obexscanHandleBackup
  | dir buTool backupPath |
  buTool := self topez toolInstanceFor: 'bu'.
  subOptions
    at: 'dir'
    ifPresent: [ :arg | dir := arg ]
    ifAbsent: [ dir := buTool buBackupDirectory ].
  subArguments isEmpty
    ifTrue: [ self error: 'Missing required argument <backup-file>. See man page for details.' ].
  backupPath := dir , '/' , (subArguments at: 1).
  subOptions at: 'backup' ifPresent: [ :ignored | buTool buBackup: backupPath ].
  ^ backupPath