Class {
	#name : #BaselineOfICTWorkbenchUnixes,
	#superclass : #BaselineOfICTWorkbench,
	#category : #BaselineOfICTWorkbench
}

{ #category : #accessing }
BaselineOfICTWorkbenchUnixes >> customProjectAttributes [
    Smalltalk os isMacOS ifTrue: [ ^ #(#MacOS) ].
    Smalltalk os isUnix ifTrue: [ ^ #(#Unix) ].
]
