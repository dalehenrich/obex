obex
obexscan
  "
  obex scan [--dir=<backup-directory>] [--backup] <backup-file-name>
  obex scan [--limit=<sample-limit>] --sample=<class-name> <backup-file-name>
  obex scan [--limit=<sample-limit>] --ref=<class-name> <backup-file-name>
"

  | backupPath analysis limit |
  self
    getSubcommandOptsMixedLongShort:
      {#('dir' nil #'required').
      #('backup' nil #'none').
      #('limit' nil #'required').
      #('ref' nil #'required').
      #('sample' nil #'required')}.
  backupPath := self obexscanHandleBackup.
  subOptions
    at: 'limit'
    ifPresent: [ :arg | limit := arg asNumber ]
    ifAbsent: [ limit := nil ].
  analysis := subOptions
    at: 'sample'
    ifPresent: [ :className | 
      OXScanBackupClassSamplesDataStore new
        scanBackup: backupPath
        sampleClass: (Smalltalk at: className)
        limit: limit ]
    ifAbsent: [ 
      subOptions
        at: 'ref'
        ifPresent: [ :className | 
          | sampleInstanceOops |
          sampleInstanceOops := self obexDataStore scanBackups top
            classInstanceCountAndInstances
            at: (Smalltalk at: className) asOop
            ifAbsent: [ #() ].
          OXScanBackupClassInstanceReferenceSamplesDataStore new
            scanBackup: backupPath
            sampleInstanceOops: sampleInstanceOops
            limit: limit ]
        ifAbsent: [ OXScanBackupClassDataStore new scanBackup: backupPath ] ].
  self obexDataStore scanBackups push: analysis.
  ^ true