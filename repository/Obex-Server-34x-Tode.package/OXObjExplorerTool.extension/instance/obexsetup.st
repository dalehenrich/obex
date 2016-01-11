*obex-server-34x-tode
obexsetup
  "
  obex setup [--max=<max-sessions>] [--pct=<pct-cpu-limit>]  [--lockWait=<lock-wait-time>]
             [--bufSize=<page-buffer-size>] 
"

  | maxSessions percentCpu lockWait bufSize |
  self
    getSubcommandOptsMixedLongShort:
      {#('lockWait' nil #'required').
      #('bufSize' nil #'required').
      #('max' nil #'required').
      #('pct' nil #'required')}.
  subOptions
    at: 'max'
    ifPresent: [ :arg | maxSessions := arg asInteger ]
    ifAbsent: [ maxSessions := 1 ].
  subOptions
    at: 'pct'
    ifPresent: [ :arg | percentCpu := arg asInteger ]
    ifAbsent: [ percentCpu := 90 ].
  subOptions
    at: 'lockWait'
    ifPresent: [ :arg | lockWait := arg asInteger ]
    ifAbsent: [ lockWait := 3 ].
  subOptions
    at: 'bufSize'
    ifPresent: [ :arg | bufSize := arg asInteger ]
    ifAbsent: [ bufSize := 8 ].
  SystemRepository
    _refPathSetupScanWithMaxThreads: maxSessions
    waitForLock: lockWait
    pageBufSize: bufSize
    percentCpuLimit: percentCpu