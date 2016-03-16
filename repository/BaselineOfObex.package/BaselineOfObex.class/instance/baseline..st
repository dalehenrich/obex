baseline
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Tode'
          with: [ 
              spec
                repository: 'github://dalehenrich/tode:dev/repository';
                loads: 'GemStone Dev';
                yourself ];
        yourself.
      spec
        package: 'Obex-Core-Model';
        package: 'Obex-Core-Tode' with: [ spec requires: #('Obex-Core-Model') ];
        yourself.
      spec
        group: 'Core' with: #('Obex-Core-Model' 'Obex-Core-Tode' 'Tode');
        group: 'default' with: #('Core');
        group: 'Tests' with: #();
        group: 'CI' with: #('Core' 'Tests');
        yourself ].
  spec
    for: #(#'pharo3.x' #'pharo4.x')
    do: [ 
      spec
        package: 'Obex-Client-Model'
          with: [ spec requires: #('Roassal2' 'Obex-Core-Model') ];
        package: 'Obex-Client-Tode'
          with: [ spec requires: #('Obex-Client-Model' 'Obex-Core-Tode') ];
        package: 'Roassal2' with: [ spec requires: #('Trachel') ];
        package: 'Trachel';
        package: 'Obex-Core-Model' with: [ spec requires: #('Roassal2') ];
        yourself.
      spec
        group: 'Core' with: #('Obex-Client-Model' 'Obex-Client-Tode');
        yourself ].
  spec
    for: #(#'gs3.4.x')
    do: [ 
      spec
        package: 'Obex-Server-Tode'
          with: [ 
              spec
                postLoadDoIt: #'initializeTools';
                requires: #('Obex-Server-Model') ];
        package: 'Obex-Server-Model'
          with: [ spec requires: #('Obex-Core-Tode') ];
        package: 'Obex-Server-Tests'
          with: [ spec requires: #('Obex-Server-Tode') ];
        yourself.
      spec
        group: 'Core' with: #('Obex-Server-Tode');
        group: 'Tests' with: #('Obex-Server-Tests');
        yourself ]