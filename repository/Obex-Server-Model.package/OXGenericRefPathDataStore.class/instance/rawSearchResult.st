accessing
rawSearchResult
  searchResult ifNil: [ searchResult := TransientValue value: nil ].
  ^ searchResult