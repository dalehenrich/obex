private
initBuilder
	| lineShape |
	builder view: self view.
	lineShape := RTArrowedLine new
		color: (Color lightGray alpha: 0.5);
		width: 3.0.
	lineShape withShorterDistanceAttachPoint.
	lineShape inverted.
	builder shape circle
		borderWidth: 0.02;
		size: 40;
		color: (Color blue alpha: 0.5).
	builder lineShape: lineShape.
	builder
		layout:
			(RTHorizontalTreeLayout new
				horizontalGap: 80;
				verticalGap: 20).
	builder
		onLeftClickServerDo: [ :exploraNode | 
					| nde |
					nde := exploraNode element.
					exploraNode expandDirection: #LeftClick -> #From with: (self showPointersTo: nde model).
					exploraNode element color: (nde model wrapper nodeFillColorFor: self) ]
			with: [ :nde | self showPointersTo: nde ];
		withPopup: [ :nde | self labelForNode: nde ];
		onRightClickMenu:
				{('inspect' -> [ :exploraNode | self topez inspectOXObject: exploraNode element model wrapper ]).
					('inspect (reified)' -> [ :exploraNode | self topez inspectReifiedOXObject: exploraNode element model wrapper ]).
					('inspect node' -> [ :exploraNode | self topez inspectOXNode: exploraNode element model wrapper ]).
					('copy all oops'
						-> [ :exploraNode | 
							| stream |
							stream := WriteStream on: String new.
							builder nodes do: [ :each | stream nextPutAll: ' ' , each element model wrapper oop asString ].
							Clipboard clipboardText: stream contents asText ]).
					('copy all additional oops'
						-> [ :exploraNode | 
							| stream |
							stream := WriteStream on: String new.
							builder nodes
								do: [ :each | | nd |
									nd := each element model wrapper.
									nd hasAdditionalParents
										ifTrue: [ stream nextPutAll: ' ' , nd oop asString ] ].
							Clipboard clipboardText: stream contents asText ]).
					('copy oop' -> [ :exploraNode | Clipboard clipboardText: exploraNode element model wrapper oop asString asText ]).
					('center'
						-> [ :exploraNode | 
							self view canvas camera translateTo: exploraNode element encompassingRectangle center.
							self view canvas signalUpdate ])}.
	builder dragChildren