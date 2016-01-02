obex
obexinstances
  "
  obex instances [--dir=<backup-directory>] [--backup] [--oops=<oop-limit>]
                 --classes=<class-limit> --passes=<pass-limit> <backup-file-name>
"

  | backupPath classes passes dataStore classInstanceCounts baselineClasses oopLimit classInstanceCountsAndInstances leaves passCnt |
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
  System commit.
  dataStore := OXScanBackupClassDataStore new scanBackup: backupPath.	"initial pass to collect baseline data"
  self obexDataStore scanBackups push: dataStore.
  classInstanceCounts := dataStore sortedClassInstanceCountList.
  classInstanceCounts := classInstanceCounts
    copyFrom: 1
    to: (classes min: classInstanceCounts size).
  baselineClasses := classInstanceCounts
    collect: [ :dp | Smalltalk at: dp className ].
  dataStore := OXScanBackupClassSamplesDataStore new
    scanBackup: backupPath
    sampleClasses: baselineClasses
    limit: oopLimit.	"create initial sample with instance counts and sample instances"
  self obexDataStore scanBackups push: dataStore.
  classInstanceCountsAndInstances := dataStore sortedClassInstanceCountList.
  classInstanceCountsAndInstances := classInstanceCountsAndInstances
    copyFrom: 1
    to: (classes min: classInstanceCountsAndInstances size).
  leaves := classInstanceCountsAndInstances
    collect: [ :dp | 
      (OXDynamicClassInstanceDataPointNode
        for: dp
        nodeType: #'leaf'
        label: dp printString)
        backupPath: backupPath;
        parentLimit: classes;
        dataSource: dataStore;
        yourself ].
  self obexViewDective: dataStore initalNodes: leaves.
  passes > 0
    ifTrue: [ 
      self
        obexInstances: leaves
        passes: passes
        classes: classes
        backupPath: backupPath ]