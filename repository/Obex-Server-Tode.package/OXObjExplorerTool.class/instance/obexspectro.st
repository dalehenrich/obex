obex
obexspectro
  "
  obex spectro  [--oops=<oop-limit>]  [--max=<max-sessions>] [--pct=<pct-cpu-limit>] --classes=<class-limit> 
"

  | maxSessions percentCpu objInventory dataStore |
  self
    getSubcommandOptsMixedLongShort:
      {#('classes' nil #'required').
      #('oops' nil #'required').
      #('max' nil #'required').
      #('pct' nil #'required')} , subOptions
    at: 'max'
    ifPresent: [ :arg | maxSessions := arg asInteger ]
    ifAbsent: [ maxSessions := 1 ].
  subOptions
    at: 'pct'
    ifPresent: [ :arg | percentCpu := arg asInteger ]
    ifAbsent: [ percentCpu := 90 ].
  objInventory := GsObjectInventory
    _objInventory: maxSessions
    waitForLock: 3
    pageBufSize: 8
    percentCpuActiveLimit: percentCpu
    showHiddenClasses: true
    aHiddenSet: 0
    listInstances: #()
    toFile: 'xxx'