baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Obex-Core-Model';
        package: 'Obex-Core-Tode' with: [ spec requires: #('Obex-Core-Model') ];
        yourself.
      spec
        group: 'Core' with: #('Obex-Core-Model' 'Obex-Core-Tode');
        group: 'default' with: #('Core');
        yourself ].
  spec
    for: #(#'pharo3.x' #'pharo4.x')
    do: [ 
      spec
        package: 'Obex-Client-Model'
          with: [ spec requires: #('Roassal2' 'RPointerDetective') ];
        package: 'Obex-Client-Tode'
          with: [ spec requires: #('Obex-Client-Model') ];
        package: 'RPointerDetective' with: [ spec requires: #('Roassal2') ];
        package: 'Roassal2' with: [ spec requires: #('Trachel') ];
        package: 'Trachel';
        package: 'Obex-Core-Model' with: [ spec requires: #('Roassal2') ];
        yourself.
      spec
        group: 'Core' with: #('Obex-Client-Model' 'Obex-Client-Tode');
        yourself ].
  spec
    for: #(#'gs3.x')
    do: [ 
      spec
        package: 'Obex-Server-Tode'
          with: [ spec requires: #('Obex-Core-Tode') ];
        yourself.
      spec
        group: 'Core' with: #('Obex-Server-Tode');
        yourself ]