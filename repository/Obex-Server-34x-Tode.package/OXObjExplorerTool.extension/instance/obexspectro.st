*obex-server-34x-tode
obexspectro
  "
  obex spectro  [--oops=<oop-limit>]  [--max=<max-sessions>] [--pct=<pct-cpu-limit>] 
                [--src=(inventory|spectro|scan)] (--bytes|--instances) --classes=<class-limit> 
"

  | maxSessions percentCpu classLimit classArray srcMap dataStoreKey srcDataStore sortedClassList |
  self
    getSubcommandOptsMixedLongShort:
      {#('classes' nil #'required').
      #('src' nil #'required').
      #('classes' nil #'required').
      #('bytes' nil #'none').
      #('instances' nil #'none').
      #('max' nil #'required').
      #('pct' nil #'required')}.
  subOptions
    at: 'classes'
    ifPresent: [ :arg | classLimit := arg asInteger ]
    ifAbsent: [ self error: 'Required option `classes` missing. See man page for details' ].
  subOptions
    at: 'max'
    ifPresent: [ :arg | maxSessions := arg asInteger ]
    ifAbsent: [ maxSessions := 1 ].
  subOptions
    at: 'pct'
    ifPresent: [ :arg | percentCpu := arg asInteger ]
    ifAbsent: [ percentCpu := 90 ].
  srcMap := Dictionary new
    at: 'inventory' put: 'objectInventory';
    at: 'scan' put: 'scanBackups';
    at: 'spector' put: 'spectroph';
    yourself.
  subOptions
    at: 'src'
    ifPresent: [ :arg | 
      dataStoreKey := srcMap
        at: arg
        ifAbsent: [ self error: 'Unknown `src`: ' , arg printString , '. See man page for details' ] ]
    ifAbsent: [ self error: 'Required option `src` missing. See man page for details' ].
  srcDataStore := (self obexDataStoreRoot dataStores at: dataStoreKey) top.
  srcDataStore parentLimit: classLimit.
  sortedClassList := subOptions
    at: 'bytes'
    ifPresent: [ :ignored | srcDataStore sortedClassByteCountList ]
    ifAbsent: [ 
      subOptions
        at: 'instances'
        ifPresent: [ :ignored | srcDataStore sortedClassInstanceCountList ]
        ifAbsent: [ 
          self
            error:
              'Required option `bytes | instances` missing. See man page for details' ] ].
  classArray := ((sortedClassList copyFrom: 1 to: classLimit)
    collect: [ :dp | dp theClass ]) asArray.
  self
    obexSpectroRepo: classArray
    srcDataStore: srcDataStore
    maxSession: maxSessions
    percentCpu: percentCpu