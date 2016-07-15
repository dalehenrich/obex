actions
inspectOXNode: topez
  self
    editUsing:
      ((TDEditorSpec topez: topez editorAspect: #'navigate')
        builderAspect: #'inspect';
        yourself).
  ^ nil