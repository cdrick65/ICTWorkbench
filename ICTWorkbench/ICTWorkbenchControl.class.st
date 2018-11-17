Class {
	#name : #ICTWorkbenchControl,
	#superclass : #Object,
	#category : #'ICTWorkbench-Core'
}

{ #category : #'as yet unclassified' }
ICTWorkbenchControl class >> usefulCommands [

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
