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
	#instVars : [
		'dependantRequirements'
	],
	#category : #BaselineOfICTWorkbench
}

{ #category : #'baseline-dependance' }
BaselineOfICTWorkbench >> addTo: aSpec depGithubProject: aGithubProj baseline: aBaselineName branch: aVersion [ 
	
	| version |
	version := aVersion ifNil: [ 'master'].
	self dependantRequirements add: aBaselineName.
	aSpec
			baseline: aBaselineName 
			with: [ aSpec repository: 'github://' , aGithubProj , ':' ,  aVersion].
]

{ #category : #'baseline-dependance' }
BaselineOfICTWorkbench >> addTo: aSpec depProject: aProjectName smalltalkhubAccount: aSthubName [ 
	self addTo: aSpec depProject: aProjectName smalltalkhubAccount: aSthubName version: #stable
]

{ #category : #'baseline-dependance' }
BaselineOfICTWorkbench >> addTo: aSpec depProject: aProjectName smalltalkhubAccount: aSthubName version: aVersion [
	self dependantRequirements add: aProjectName.
	aSpec
			project: aProjectName  
			with: [ aSpec
						className: #ConfigurationOf , aProjectName;
						versionString: aVersion"#stable";
						repository: 'http://smalltalkhub.com/mc/' , aSthubName, '/', aProjectName ,'/main'  ].
]

{ #category : #baselines }
BaselineOfICTWorkbench >> baseline: spec [ 
	<baseline>
	spec for: #common do: [
		self dependanciesFor: spec.
		spec 
			package: 'ICTWorkbench'	with:
					[ spec requires: self dependantRequirements asArray ]
		]
]

{ #category : #accessing }
BaselineOfICTWorkbench >> customProjectAttributes [
    Smalltalk os isMacOS ifTrue: [ ^ #(#MacOS) ].
    Smalltalk os isUnix ifTrue: [ ^ #(#Unix) ].
    Smalltalk os isWindows ifTrue: [ ^ #(#Windows) ]
]

{ #category : #'baseline-dependance' }
BaselineOfICTWorkbench >> dependanciesFor: aSpec [
"aSpec => aMetacelloBaselineConstructor"
	self addTo: aSpec depGithubProject: 'svenvc/zinc' baseline: 'ZincHTTPComponents' branch: 'master/src'.
	self addTo: aSpec depGithubProject: 'svenvc/ztimestamp' baseline: 'ZTimestamp' branch: 'master/src'.
	self addTo: aSpec depProject: 'Teapot' smalltalkhubAccount: 'zeroflag'.  
	"little pb here with Teapo => conflicting with JSON and also use Spec deprecated classes"
	self addTo: aSpec depProject: 'XMLParserHTML' smalltalkhubAccount: 'PharoExtras'.
	self addTo: aSpec depProject: 'XPath' smalltalkhubAccount: 'PharoExtras'.
	
	"warning missing dependancy => AnimatedGIFReadWriter"
	self addTo: aSpec depGithubProject: 'JurajKubelka/DiscordSt' baseline: 'DiscordSt' branch: 'master/src'.
	
	self addTo: aSpec depGithubProject: 'pillar-markup/pillar' baseline: 'Pillar' branch: 'master/src'.
	"OSSubprocess  and mustache detached heads => try loading mustach and OSSub before Pillar"
	self addTo: aSpec depGithubProject: 'noha/mustache' baseline: 'Mustache' branch: 'master/src'.
	self addTo: aSpec depGithubProject: 'noha/geo-json' baseline: 'GeoJSON' branch: 'master/src'.
	"baseline: 'ExternalWebBrowser'; ""noha/JSONWebToken:master/source
	repository: 'github://seandenigris/Pharo-Web-Browser:master/repository';"
	
	self addTo: aSpec depGithubProject: 'pharo-spec/Spec' baseline: 'Spec' branch: 'master/src'.
	self addTo: aSpec depGithubProject: 'pharo-contributions/Cryptography' baseline: 'Cryptography' branch: 'master/src'.
	
	self addTo: aSpec depGithubProject: 'PolyMathOrg/PolyMath' baseline: 'PolyMath' branch: 'master/src'.
	
	self addTo: aSpec depGithubProject: 'svenvc/NeoJSON' baseline: 'NeoJSON' branch: 'master/src'.
	self addTo: aSpec depGithubProject: 'svenvc/NeoCSV' baseline: 'NeoCSV' branch: 'master/src'.
	self addTo: aSpec depGithubProject: 'svenvc/ston' baseline: 'Ston' branch: 'master/src'.
"
		
		spec
			project: 'Teapot'  
			with: [ spec
						className: #ConfigurationOfTeapot;
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/zeroflag/Teapot/main'  ].
					
		spec
			project: 'SSDP'  
			with: [ spec
						versionString: #stable;
						repository: 'http://smalltalkhub.com/mc/henriksp/SSDP/main'  ].
					
		spec
			baseline: 'ExternalWebBrowser'
			with: [ spec repository: 'github://seandenigris/Pharo-Web-Browser:master/repository']."
		
]

{ #category : #baselines }
BaselineOfICTWorkbench >> dependantRequirements [

	^ dependantRequirements ifNil: [ dependantRequirements := OrderedCollection new ]
]
