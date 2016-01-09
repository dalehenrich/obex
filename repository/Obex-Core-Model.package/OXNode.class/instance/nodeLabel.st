accessing
nodeLabel
  nodeLabel ifNil: [ nodeLabel := self className , ', ' , self oop asString ].
  ^ nodeLabel