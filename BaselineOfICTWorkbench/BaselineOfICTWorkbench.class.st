"
BaselineOfICTWorkbench .
""why a class definition ?
not possible to have an object serialized in a git synced file ?""

Metacello new
      baseline: 'ICTWorkbench';
		repository: 'gitlocal://../../iceberg/cdrick65/ICTWorkbench' ;
		load.
		
Metacello new
        githubUser: 'cdrick65' project: 'ICTWorkbench' commitish: 'master' path: '';
        baseline: 'ICTWorkbench';
        load.

Metacello new
		baseline: 'NeoCSV';
		repository: 'gitlocal://../../iceberg/svenvc/NeoCSV' ;
		""'github://pharo-ide/Calypso:v0.12.0/src'""
		""onConflict: [ :err | err useIncoming ];
		onUpgrade: [ :err | err useIncoming ];""
		""load: #('FullEnvironment' 'SystemBrowser' 'Tests').""
		load.

"
Class {
	#name : #BaselineOfICTWorkbench,
	#superclass : #BaselineOf,
	#category : #BaselineOfICTWorkbench
}

{ #category : #baselines }
BaselineOfICTWorkbench >> baseline: spec [ 
	<baseline>
	spec for: #common do: [
		spec
    		baseline: 'PolyMath'
    		with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ].
		spec 
			package: 'ICTWorkbench'	with:
					[ spec requires: #('PolyMath') ]
		]
]