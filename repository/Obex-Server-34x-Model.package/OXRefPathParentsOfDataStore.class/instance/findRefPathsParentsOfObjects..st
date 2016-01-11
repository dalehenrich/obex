analysis
findRefPathsParentsOfObjects: objects
  | result |
  result := self rawFindRefPathsParentsOfObjects: objects.
  self searchResult: result.
  self analyze