other
classes

  Classes notNil ifTrue: [^Classes].
  Classes := IntegerKeyValueDictionary new.
  AllUsers do: [:eachUser |
    (System canRead: eachUser) ifTrue: [
      (System canRead: eachUser symbolList) ifTrue: [
        eachUser symbolList do: [:eachSymbolDictionary |
          (System canRead: eachSymbolDictionary) ifTrue: [
            eachSymbolDictionary do: [:eachGlobal |
              (System canRead: eachGlobal) ifTrue: [
                eachGlobal isBehavior ifTrue: [
                  (System canRead: eachGlobal classHistory) ifTrue: [
                    eachGlobal classHistory do: [:eachClass |
                      (System canRead: eachClass) ifTrue: [
                        Classes at: eachClass asOop put: eachClass.
                      ].
                    ].
                  ].
                ].
              ].
            ].
          ].
        ].
      ].
    ].
  ].
  ^Classes.
