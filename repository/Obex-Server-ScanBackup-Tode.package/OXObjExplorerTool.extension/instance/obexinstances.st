*obex-server-scanbackup-tode
obexinstances
  "
  obex instances [--dir=<backup-directory>] [--backup] [--oops=<oop-limit>]
                 --classes=<class-limit>  <backup-file-name>
"

  | backupPath classes dataStore classInstanceCounts baselineClasses oopLimit |
  self
    getSubcommandOptsMixedLongShort:
      {#('dir' nil #'required').
      #('backup' nil #'none').
      #('classes' nil #'required').
      #('oops' nil #'required')}.
  backupPath := self obexscanHandleBackup.
  subOptions
    at: 'oops'
    ifPresent: [ :arg | oopLimit := arg asNumber ]
    ifAbsent: [ oopLimit := nil ].
  subOptions
    at: 'classes'
    ifPresent: [ :arg | classes := arg asNumber ]
    ifAbsent: [ self error: 'Missing required option `classes`. See man page for details' ].
  System commit.
  dataStore := OXScanBackupClassDataStore new scanBackup: backupPath.	"initial pass to collect baseline data"
  self obexDataStoreRoot scanBackups push: dataStore.
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
  dataStore
    backupPath: backupPath;
    parentLimit: classes;
    yourself.
  self obexDataStoreRoot scanBackups push: dataStore