repository analysis
listInstances: anArrayOfClasses withMaxSessions: maxSessions maxCpuUsage: aPercentage
  "list instances of the given classes and return results in an instance of the receiver"

  | results set |
  results := SystemRepository
    listInstances: anArrayOfClasses
    limit: 0
    toDirectory: nil
    withMaxThreads: maxSessions
    maxCpuUsage: aPercentage
    memoryOnly: false.
  set := IdentitySet new.
  1 to: results size by: 2 do: [ :index | set addAll: (results at: index + 1) ].
  ^ self from: set