Class {
	#name : #PatchConstraintDialog,
	#superclass : #Object,
	#instVars : [
		'cells',
		'selectedCells',
		'shouldBeEmptyPatches',
		'att2OpeChoices',
		'att1Ope',
		'att1Choices',
		'att2Choices',
		'att1',
		'att2',
		'att1Value',
		'att1OpeChoices',
		'att2Ope',
		'att2Value'
	],
	#category : 'Cormas-Core-Interface'
}

{ #category : #'interface specs' }
PatchConstraintDialog class >> windowSpec [
	"Tools.UIPainter new openOnClass: self andSelector: #windowSpec"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#properties: #(PropertyListDictionary #labelFromApplication false) 
			#label: 'Patches constraints' 
			#min: #(Point 231 68) 
			#max: #(Point 231 68) 
			#bounds: #(Rectangle 720 477 951 545) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 7798 7798 7798)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(ActionButtonSpec 
				#layout: #(Rectangle 165 43.0 224 65.0) 
				#name: #selectCells 
				#model: #selectCells 
				#label: 'Done' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 177 2 227 21) 
				#name: #att1Value 
				#model: #att1Value 
				#tabable: true 
				#alignment: #right 
				#isReadOnly: false 
				#type: #object) #(ComboBoxSpec 
				#layout: #(Rectangle 133 2 178 21) 
				#name: #att1OpeChoices 
				#model: #att1Ope 
				#comboList: #att1OpeChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 18 2 134 21) 
				#name: #att1Choices 
				#model: #att1 
				#comboList: #att1Choices) #(LabelSpec 
				#layout: #(Point 4 1) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: '1-') 
				#style: #pixelDefault) #(InputFieldSpec 
				#layout: #(Rectangle 177 20 227 39) 
				#name: #att2Value 
				#model: #att2Value 
				#tabable: true 
				#alignment: #right 
				#isReadOnly: false 
				#type: #object) #(ComboBoxSpec 
				#layout: #(Rectangle 133 20 178 39) 
				#name: #att2OpeChoices 
				#model: #att2Ope 
				#comboList: #att2OpeChoices) #(ComboBoxSpec 
				#layout: #(Rectangle 18 20 134 39) 
				#name: #att2Choices 
				#model: #att2 
				#comboList: #att2Choices) #(LabelSpec 
				#layout: #(Point 4 18) 
				#name: #Label3 
				#label: #(UserMessage 
					#key: #methodesreturningSymbol 
					#defaultString: '2-') 
				#style: #pixelDefault) #(CheckBoxSpec 
				#layout: #(Point 19 44) 
				#name: #CheckBox1 
				#model: #shouldBeEmptyPatches 
				#label: 'Should be empty'))))
]

{ #category : #aspects }
PatchConstraintDialog >> att1 [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att1 isNil
		ifTrue: [att1 := String new asValue]
		ifFalse: [att1]
]

{ #category : #aspects }
PatchConstraintDialog >> att1Choices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att1Choices isNil
		ifTrue: [att1Choices := List new asValue]
		ifFalse: [att1Choices]
]

{ #category : #aspects }
PatchConstraintDialog >> att1Ope [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att1Ope isNil
		ifTrue: [att1Ope := String new asValue]
		ifFalse: [att1Ope]
]

{ #category : #aspects }
PatchConstraintDialog >> att1OpeChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att1OpeChoices isNil
		ifTrue: [att1OpeChoices := List new asValue]
		ifFalse: [att1OpeChoices]
]

{ #category : #aspects }
PatchConstraintDialog >> att1Value [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att1Value isNil
		ifTrue: [att1Value := nil asValue]
		ifFalse: [att1Value]
]

{ #category : #aspects }
PatchConstraintDialog >> att2 [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att2 isNil
		ifTrue: [att2 := String new asValue]
		ifFalse: [att2]
]

{ #category : #aspects }
PatchConstraintDialog >> att2Choices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att2Choices isNil
		ifTrue: [att2Choices := List new asValue]
		ifFalse: [att2Choices]
]

{ #category : #aspects }
PatchConstraintDialog >> att2Ope [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att2Ope isNil
		ifTrue: [att2Ope := String new asValue]
		ifFalse: [att2Ope]
]

{ #category : #aspects }
PatchConstraintDialog >> att2OpeChoices [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att2OpeChoices isNil
		ifTrue: [att2OpeChoices := List new asValue]
		ifFalse: [att2OpeChoices]
]

{ #category : #aspects }
PatchConstraintDialog >> att2Value [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^att2Value isNil
		ifTrue: [att2Value := nil asValue]
		ifFalse: [att2Value]
]

{ #category : #accessing }
PatchConstraintDialog >> cells [
	
	^cells
]

{ #category : #accessing }
PatchConstraintDialog >> cells: anObject [
	
	cells := anObject
]

{ #category : #'interface opening' }
PatchConstraintDialog >> postOpenWith: aBuilder [
	"set operators choices"
	
	| aList |
	aList := List withAll: #(#= #> #>= #< #<=).
	att1OpeChoices value: aList.
	att2OpeChoices value: aList.	"set menu for selecting patch attributes"
	aList := List new.
	aList
		addAll:
			(DefaultAttributesSetter attributsFromClass: self cells first class) sorted.
	att1Choices value: aList.
	att2Choices value: aList
]

{ #category : #actions }
PatchConstraintDialog >> selectCells [
	
	| collec |
	self shouldBeEmptyPatches value
		ifTrue: [collec := self cells select: [:e | e noOccupant]]
		ifFalse: [collec := self cells].
	((att1 value isNil not and: [att1Ope value ~= ''])
		and: [att1Value value isNil not])
		ifTrue:
			[collec := collec
				select:
					[:e | 
					(e perform: att1 value asSymbol)
						perform: att1Ope value asSymbol
						with: att1Value value]].
	((att2 value isNil not and: [att2Ope value ~= ''])
		and: [att2Value value isNil not])
		ifTrue:
			[collec := collec
				select:
					[:e | 
					(e perform: att2 value asSymbol)
						perform: att2Ope value asSymbol
						with: att2Value value]].
	self selectedCells: collec.
	self close
]

{ #category : #accessing }
PatchConstraintDialog >> selectedCells [
	
	^selectedCells
]

{ #category : #accessing }
PatchConstraintDialog >> selectedCells: anObject [
	
	selectedCells := anObject
]

{ #category : #aspects }
PatchConstraintDialog >> shouldBeEmptyPatches [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^shouldBeEmptyPatches isNil
		ifTrue: [shouldBeEmptyPatches := false asValue]
		ifFalse: [shouldBeEmptyPatches]
]
