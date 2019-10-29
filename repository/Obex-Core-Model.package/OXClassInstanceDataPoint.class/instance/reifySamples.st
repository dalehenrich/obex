inspecting
reifySamples
  reifiedSamples := TransientValue
    value: (samples value collect: [ :each | Object _objectForOop: each ])