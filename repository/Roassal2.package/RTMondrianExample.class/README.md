RTMondrianExample new installTitle: 'ClusterLayout' 
		code:
		'
| b |
b := RTMondrian new.

b shape circle.
b nodes: RTObject withAllSubclasses.

b shape line color: (Color blue alpha: 0.4).
b edges connectFrom: #superclass.

b normalizer
	objects: RTObject withAllSubclasses;
	normalizeSize: #numberOfMethods min: 5 max: 30 using: [:value | (value + 1) ln ];
	normalizeColor: #numberOfMethods using: {Color gray . Color blue. Color red } using: [ :value | (value + 1) ln ].
	
b layout cluster.
b build.
^ b'
	