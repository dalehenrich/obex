inspecting
reifySamples
  reifiedSamples := TransientValue
    value: (samples collect: [ :each | Object _objectForOop: each ])