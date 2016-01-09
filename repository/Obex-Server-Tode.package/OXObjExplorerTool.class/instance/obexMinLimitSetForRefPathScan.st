obex findAllRefs
obexMinLimitSetForRefPathScan
  "Add all objectSecurityPolicies"

  | set symUser |
  set := IdentitySet new.
  set addAll: SystemRepository.
  symUser := AllUsers userWithId: 'SymbolUser'.
  set add: (symUser resolveSymbol: #'AllSymbols') value.
  ^ set asArray