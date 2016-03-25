analysis
findRefPathsParentsOfObjects: objects
  ^ self findRefPathsParentsOfObjects: objects withMaxThreads: 1 maxCpuUsage: 90