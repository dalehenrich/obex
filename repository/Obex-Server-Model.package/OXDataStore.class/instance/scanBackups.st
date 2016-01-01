accessing
scanBackups
  scanBackups ifNil: [ scanBackups := Stack new ].
  ^ scanBackups