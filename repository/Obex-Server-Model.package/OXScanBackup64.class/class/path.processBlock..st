instance creation
path: backupPath processBlock: aBlock
  ^ self new
    processBlock: aBlock;
    path: backupPath;
    yourself