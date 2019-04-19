Class {
	#name : #ICTSystem,
	#superclass : #Object,
	#category : #'ICTWorkbench-Core'
}

{ #category : #'as yet unclassified' }
ICTSystem class >> installGToolkit [

	EpMonitor current disable.
[ 
  Metacello new
    baseline: 'GToolkit';
    repository: 'github://feenkcom/gtoolkit/src';
    load
] ensure: [ EpMonitor current enable ].

	
]

{ #category : #'as yet unclassified' }
ICTSystem class >> installPP2 [

	Metacello new
    baseline: 'PetitParser2';
    repository: 'github://kursjan/petitparser2';
    load.

	
]

{ #category : #'as yet unclassified' }
ICTSystem class >> installPP2Roassal2 [

	Metacello new
    baseline: 'PetitParser2Gui';
    repository: 'github://kursjan/petitparser2';
    load.

	
]

{ #category : #'as yet unclassified' }
ICTSystem class >> installQRCode [

	Gofer new  
    	smalltalkhubUser: 'JochenRick' project: 'QRCode';  
    	version: 'QRCode-JochenRick.2';  
    	update.  

	
]

{ #category : #'as yet unclassified' }
ICTSystem class >> installRoassal3 [
	| tmp2 |
	tmp2 := Metacello new.
	tmp2
		baseline: 'Roassal3';
		repository: 'github://ObjectProfile/Roassal3/src';
		load
]

{ #category : #'as yet unclassified' }
ICTSystem class >> installSmartData [



	
]

{ #category : #'as yet unclassified' }
ICTSystem class >> installWooden3D [
	EpMonitor current disable.
	[ | tmp2 |
	tmp2 := Metacello new.
	tmp2
		baseline: 'WodenEngine';
		repository: 'github://ronsaldo/woden/tonel';
		onConflict: [ :arg1 | 
			self halt.
			arg1 useIncoming ];
		onUpgrade: [ :arg2 | 
			self halt.
			arg2 useIncoming ];
		load ]
		ensure: [ EpMonitor current enable ]
]

{ #category : #'as yet unclassified' }
ICTSystem class >> usefulCommands [

	MetacelloToolBox validateBaseline: BaselineOfICTWorkbench.

	IceTipCachedModel allInstances do: [:cacheRep | 
	 (IceTipRemoveRepositoryDialog on: cacheRep) delete.].

	"remove all iceberg repo DANGER"
	IceTipCachedModel allInstances do: #delete.
	IceRepository registry do: #delete.

	EpMonitor current disable.
	Metacello new
		baseline: 'ICTWorkbench';
		repository: 'github://cdrick65/ICTWorkbench';
		onConflict: [ :err | "self halt." err useIncoming ];
		onUpgrade: [ :err | err useIncoming ];
		ignoreImage;
		load": #('FullEnvironment' 'SystemBrowser' 'Tests')".
	EpMonitor current enable.
]
