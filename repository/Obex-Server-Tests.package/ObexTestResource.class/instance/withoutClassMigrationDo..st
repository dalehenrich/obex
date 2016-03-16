private
withoutClassMigrationDo: aBlock
  | oldAutoCommit oldAutoMigrate |
  oldAutoCommit := MCPlatformSupport autoCommit.
  oldAutoMigrate := MCPlatformSupport autoMigrate.
  MCPlatformSupport autoCommit: true.
  MCPlatformSupport autoMigrate: false.
  [ MCPlatformSupport commitOnAlmostOutOfMemoryDuring: aBlock ]
    ensure: [ 
      MCPlatformSupport autoCommit: oldAutoCommit.
      MCPlatformSupport autoMigrate: oldAutoMigrate ]