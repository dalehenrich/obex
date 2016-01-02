actions
inspectOXObject: topez
  (Object _objectForOop: self oop)
    editUsing:
      ((TDEditorSpec topez: topez editorAspect: #'navigateOX')
        builderAspect: #'inspect';
        yourself).
  ^ nil