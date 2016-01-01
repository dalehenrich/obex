obex
obexinstances
  "
  obex instances [--dir=<backup-directory>] [--backup] [--oops=<oop-limit>]
                 --classes=<class-limit> --passes=<pass-limit> <backup-file-name>
"

  | backupPath classes passes dataStore classInstanceCounts baselineClasses oopLimit classInstanceCountsAndInstances passCnt |
  self
    getSubcommandOptsMixedLongShort:
      {#('dir' nil #'required').
      #('backup' nil #'none').
      #('classes' nil #'required').
      #('oops' nil #'required').
      #('passes' nil #'required')}.
  backupPath := self obexscanHandleBackup.
  subOptions
    at: 'oops'
    ifPresent: [ :arg | oopLimit := arg asNumber ]
    ifAbsent: [ oopLimit := nil ].
  subOptions
    at: 'classes'
    ifPresent: [ :arg | classes := arg asNumber ]
    ifAbsent: [ self error: 'Missing required option `classes`. See man page for details' ].
  subOptions
    at: 'passes'
    ifPresent: [ :arg | passes := arg asNumber ]
    ifAbsent: [ self error: 'Missing required option `passes`. See man page for details' ].
  passCnt := 0.
  System commit.
  dataStore := OXScanBackupClassDataStore new scanBackup: backupPath.	"initial pass to collect baseline data"
  self obexDataStore scanBackups push: dataStore.
  classInstanceCounts := dataStore sortedClassInstanceCountList.
  classInstanceCounts := classInstanceCounts
    copyFrom: 1
    to: (classes min: classInstanceCounts size).
  baselineClasses := classInstanceCounts
    collect: [ :dp | Smalltalk at: dp className ].
  passCnt := passCnt + 1.
  dataStore := OXScanBackupClassSamplesDataStore new
    scanBackup: backupPath
    sampleClasses: baselineClasses
    limit: oopLimit.	"create initial sample with instance counts and sample instances"
  classInstanceCountsAndInstances := dataStore classInstanceCountAndInstances.
  baselineClasses := classInstanceCountsAndInstances keys
    collect: [ :classOop | Object _objectForOop: classOop ].
  passCnt := passCnt + 1.
  self halt