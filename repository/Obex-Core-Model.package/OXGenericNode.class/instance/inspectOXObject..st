actions
inspectOXObject: topez
  self object
    editUsing:
      ((TDEditorSpec topez: topez editorAspect: #'navigateOX')
        builderAspect: #'inspect';
        yourself).
  ^ nil