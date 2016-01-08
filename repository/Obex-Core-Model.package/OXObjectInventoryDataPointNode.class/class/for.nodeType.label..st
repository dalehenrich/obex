instance creation
for: aClassInstanceDataPoint nodeType: nodeType label: label
  ^ self new
    oop: aClassInstanceDataPoint asOop;
    dataPoint: aClassInstanceDataPoint;
    nodeType: nodeType;
    label: label;
    yourself