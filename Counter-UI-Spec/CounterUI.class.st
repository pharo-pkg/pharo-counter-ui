"
I'm a basic UI to interact with a counter object.
Open me with:
	self new openWithSpec
"
Class {
	#name : #CounterUI,
	#superclass : #ComposableModel,
	#instVars : [
		'counterLabel',
		'incButton',
		'decButton',
		'counter'
	],
	#category : #'Counter-UI-Spec'
}

{ #category : #specs }
CounterUI class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :column |
			column 
				add: #counterLabel;
				newRow: [ :row |
					row
						add: #decButton;
						add: #incButton ] height: 25;
				yourself ];
		yourself
]

{ #category : #specs }
CounterUI class >> title [
	^ 'Spec Counter'
]

{ #category : #accessing }
CounterUI >> counterLabel [
	^ counterLabel
]

{ #category : #accessing }
CounterUI >> decButton [
	^ decButton
]

{ #category : #accessing }
CounterUI >> incButton [
	^ incButton
]

{ #category : #api }
CounterUI >> initialExtent [
	 ^  (300.0@70.0)
]

{ #category : #initialization }
CounterUI >> initialize [
	super initialize.
	counter := Counter new
]

{ #category : #initialization }
CounterUI >> initializePresenter [
	"Initialize widgets behavior"

	incButton action: [ counter increment. self refresh ].
	decButton action: [ counter decrement. self refresh ].
]

{ #category : #initialization }
CounterUI >> initializeWidgets [
	incButton := self newButton
		label: nil;
		icon: (self iconNamed: #add);
		yourself.
	decButton := self newButton
		label: nil;
		icon: (self iconNamed: #windowMinimize);
		yourself.
	counterLabel := self newLabel.
	
	self focusOrder
		add: decButton;
		add: incButton.
		
	self whenBuiltDo: [ self refresh ]
]

{ #category : #actions }
CounterUI >> refresh [
	counterLabel label: counter value asString
]
