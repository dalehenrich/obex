persistence
persist
  "OXBitmap compat ... GsBitmap instances cannot be persisted, so an array of oops is committed by OXBitmap to share GsBitmaps between sessions --- the important bit about GsGitmap is that it can keep a very large collection of objects in memory without consuming temporary object space"

  System commit