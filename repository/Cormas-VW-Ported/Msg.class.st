"
Msg is an Object that will serve for communication. Any agents which needs to send a Msg will create an instance of a subclass of Msg and fulfil it. The message will have at least three attributes listed below. It is up to the modeller to create new instance variables to be used for the exchanges modelled.

Instance Variables:
	receiver	<LensAbsentee | Object>	description of receiver : it is an instance of a class inheriting from AgentComm or AgentCommLocation or GroupComm or GroupCommLocation. It means that the receiver has a mailbox and will be automatically registered by the channel.
	sender	<LensAbsentee | Object>	description of sender. Usually it is the instance of the entity sending the message. But the entity sending the message can leave it blank ( for anonymous message) or even fulfill it with another agent adress. 
	symbol	<Object>					content of the message to be fufilled to give some sense to the conversation. It can be anything. The undelying idea is to use it for meta-information on the conversation (indicating if it is a proposal, an acceptance, a denial, etc.).

Methods :
from: and from: to: are two methods to fulfill the sender and receiver attributes.

methods in the protocol pov are methods which output must be true or false. These pov methods are cretaed through Cormas interface (Model-> Define the observation->Communication). When selected at the interface of the observer it will be applied on each message transmitted by the channle. If the output is true a line betwwen the sender and the receiver will be displayed. By default always and never are proposed. They can be copied at the level of the subclass.

Class methods.

isObserved set the active pov.




"
Class {
	#name : #Msg,
	#superclass : #Object,
	#instVars : [
		'sender',
		'receiver',
		'topic',
		'content',
		'symbol'
	],
	#classInstVars : [
		'isObserved'
	],
	#category : 'Cormas-VW-Ported'
}

{ #category : #'instance creation' }
Msg class >> from: unAgent [
	
	^super new from: unAgent
]

{ #category : #'instance creation' }
Msg class >> from: unAgent to: unAutre [
	"Purpose: Creates a message with a sender and a receiver. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: aSymbol = <anObject>
			anObject = <anObject>
Example: Msg topic: #comeHere content: aSpatialEntity)"
	
	^super new from: unAgent to: unAutre
]

{ #category : #deprecated }
Msg class >> from: anAgent to: anotherOne content: anObject [
	"Purpose: Creates a message with a sender, a receiver and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			anotherOne = <AgentComm or AgentCommLocation	
			anObject = <anObject>
Example: Msg from: anAgent1 to: anAgent2 content: aGift)"
	
	self deprecated: 'Deprecated during Pharo 4.0 migration'.
	^super new from: anAgent to: anotherOne content: anObject
]

{ #category : #'+ communication' }
Msg class >> from: anAgent to: anotherOne topic: anObject [
	"Purpose: Creates a message with a sender, a receiver and a topic. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			anotherOne = <AgentComm or AgentCommLocation	
			anObject = <anObject>
Example: Msg from: anAgent1 to: anAgent2 topic: #hello)"
	
	^super new from: anAgent to: anotherOne topic: anObject
]

{ #category : #'+ communication' }
Msg class >> from: anAgent to: anotherOne topic: aSymbol content: anObject [
	"Purpose: Creates a message with a sender, a receiver, a topic and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			anotherOne = <AgentComm or AgentCommLocation	
			aSymbol = <anObject>
			anObject = <anObject>
Example: Msg from: anAgent1 to: anAgent2 topic: #comeHere content: aSpatialEntity)"
	
	^super new from: anAgent to: anotherOne topic: aSymbol content: anObject
]

{ #category : #accessing }
Msg class >> isObserved [
	
	^isObserved
]

{ #category : #accessing }
Msg class >> isObserved: aSymbol [
	
	isObserved := aSymbol
]

{ #category : #testing }
Msg class >> isSituatedClass [
	
	^false
]

{ #category : #'instance creation' }
Msg class >> new: x [
	
	^self new
]

{ #category : #printing }
Msg class >> printHierarchy [
	"Answer a description containing the names of all of the subclasses and superclasses of the receiver."
	
	| s |
	s := WriteStream on: (String new: 16).
	self printSubclassesOn: s level: 0.
	^s contents
]

{ #category : #'accessing class hierarchy' }
Msg class >> printSubclassesOn: aStream level: level [
	"As part of the algorithm for printing a description of the receiver, print the
	subclass on the file stream, aStream, indenting level times."
	
	| subs |
	level isZero
		ifFalse:
			[aStream cr.
			2 * level timesRepeat: [aStream space]].	"aStream print: self name asString."
	aStream nextPutAll: self name asString.	"aStream space; nextPut: $(.
	self instVarNames
		do: [:aName | aStream print: aName]
		separatedBy: [aStream space].
	aStream nextPut: $)."
	subs := self subclasses.	"self == Class ifTrue:
		[aStream crtab: level+1; nextPutAll: (#AllTheMetaclasses << #dialogs >> '... all the Metaclasses ...') asString.
		subs := subs reject: [:sub | sub isMeta]]."	"Print subclasses in alphabetical order"
	(subs
		asSortedStrings:
			[:p :x :y | 
			| collation |
			(collation := p
				collate: x name
				to: y name) < 0
				or:
					[collation = 0
						and:
							[x == y
								or:
									[(p
										collate: x printString
										to: y printString) <= 0]]]])
		do:
			[:sub | 
			sub
				printSubclassesOn: aStream
				level: level + 1]
]

{ #category : #'- activityEditor' }
Msg class >> superClassesUntil: aSuperClass [
	"Return the super classes of the class sender until aSuperClass"
	
	| coll |
	coll := self withAllSuperclasses
		select: [:aClass | aClass inheritsFrom: aSuperClass].
	coll add: aSuperClass.
	^coll
]

{ #category : #'+ util' }
Msg class >> superClassesUntilEntity [
	"Return the super classes of the class sender until Msg"
	
	^self superClassesUntil: Msg
]

{ #category : #deprecated }
Msg class >> to: anAgent content: anObject [
	"Purpose: Creates a message with a receiver and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			aContent = <anObject>
Example: Msg to: anAgent content: aGift)"
	
	self deprecated: 'Deprecated during Pharo 4.0 migration'.
	^super new to: anAgent content: anObject
]

{ #category : #'+ communication' }
Msg class >> to: anotherOne topic: aSymbol [
	"Purpose: Creates a message with a receiver and a topic. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
Example: Msg to: anAgent topic: #hello)"
	
	^super new to: anotherOne topic: aSymbol
]

{ #category : #'+ communication' }
Msg class >> to: anotherOne topic: aSymbol content: anObject [
	"Purpose: Creates a message with a receiver, a topic and a content. The message can be sent by a communicant agent using the method sendMessageSynchronously:  or sendMessageAsynchronously:
Argument: anAgent = <AgentComm or AgentCommLocation
			aSymbol = <anObject>
			anObject = <anObject>
Example: Msg to: anAgent topic: #comeHere content: aSpatialEntity)"
	
	^super new to: anotherOne topic: aSymbol content: anObject
]

{ #category : #pov }
Msg >> always [
	
	^true
]

{ #category : #accessing }
Msg >> content [
	
	^self content
]

{ #category : #accessing }
Msg >> content: aValue [
	
	content := aValue
]

{ #category : #private }
Msg >> from: anAgent [
	"method to fulfill the sender attribute"
	
	self sender: anAgent
]

{ #category : #private }
Msg >> from: anAgent to: anotherOne [
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne
]

{ #category : #private }
Msg >> from: anAgent to: anotherOne content: anObject [
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne.
	self content: anObject
]

{ #category : #private }
Msg >> from: anAgent to: anotherOne topic: aSymbol [
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne.
	self topic: aSymbol
]

{ #category : #private }
Msg >> from: anAgent to: anotherOne topic: aSymbol content: anObject [
	"method to fulfill the sender and receiver attributes"
	
	self sender: anAgent.
	self receiver: anotherOne.
	self topic: aSymbol.
	self content: anObject
]

{ #category : #pov }
Msg >> never [
	
	^false
]

{ #category : #accessing }
Msg >> receiver [
	^ receiver
]

{ #category : #accessing }
Msg >> receiver: aReceiver [
	receiver := aReceiver
]

{ #category : #accessing }
Msg >> sender [
	^ sender
]

{ #category : #accessing }
Msg >> sender: aSender [
	sender := aSender
]

{ #category : #accessing }
Msg >> symbol [
	
	^symbol
]

{ #category : #accessing }
Msg >> symbol: aSymbol [
	
	symbol := aSymbol
]

{ #category : #private }
Msg >> to: anAgent content: aSymbol [
	"method to fulfill the sender and receiver attributes"
	
	self receiver: anAgent.
	self content: aSymbol
]

{ #category : #private }
Msg >> to: anotherOne topic: aSymbol [
	"method to fulfill the sender and receiver attributes"
	
	self receiver: anotherOne.
	self topic: aSymbol
]

{ #category : #private }
Msg >> to: anotherOne topic: aSymbol content: anObject [
	"method to fulfill the sender and receiver attributes"
	
	self receiver: anotherOne.
	self topic: aSymbol.
	self content: anObject
]

{ #category : #accessing }
Msg >> topic [
	
	^topic
]

{ #category : #accessing }
Msg >> topic: anObject [
	
	topic := anObject
]
