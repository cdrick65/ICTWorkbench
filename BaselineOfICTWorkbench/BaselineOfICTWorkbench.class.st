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

	"Bloc Brick PetitParser Glamourous"
	"self addTo: aSpec depGithubProject: 'feenkcom/gtoolkit' baseline: 'GToolkit' branch: 'master/src'."
	self addTo: aSpec depGithubProject: 'kursjan/petitparser2' baseline: 'PetitParser2' branch: 'master/src'.

	"self addTo: aSpec depGithubProject: 'svenvc/zinc' baseline: 'ZincHTTPComponents' branch: 'master/src'."
	self addTo: aSpec depGithubProject: 'svenvc/ztimestamp' baseline: 'ZTimestamp' branch: 'master/src'.
	self addTo: aSpec depProject: 'Teapot' smalltalkhubAccount: 'zeroflag'.  
	"little pb here with Teapo => conflicting with JSON and also use Spec deprecated classes"
	self addTo: aSpec depProject: 'XMLParserHTML' smalltalkhubAccount: 'PharoExtras'.
	self addTo: aSpec depProject: 'XPath' smalltalkhubAccount: 'PharoExtras'.
	
	self addTo: aSpec depGithubProject: 'ObjectProfile/Roassal3' baseline: 'Roassal3' branch: 'master/src'.

	"warning missing dependancy => AnimatedGIFReadWriter"
	"self addTo: aSpec depGithubProject: 'JurajKubelka/DiscordSt' baseline: 'DiscordSt' branch: 'master/src'."
	
	"pharo-ide/TelePharo"
	
	"QRCode Tabular DataFrame NetworkExtra + Beacon + SSDP
	Pldependant : pillar ? OSSubpro Telepharo ? OSes (5) "
	
	
	
	"OSSubprocess  and mustache detached heads => try loading mustach and OSSub before Pillar"
	
	"done by GToolkit"
	"self addTo: aSpec depGithubProject: 'noha/mustache' baseline: 'Mustache' branch: 'master/src'."
	self addTo: aSpec depGithubProject: 'noha/geo-json' baseline: 'GeoJSON' branch: 'master/src'.
	"baseline: 'ExternalWebBrowser'; ""noha/JSONWebToken:master/source
	repository: 'github://seandenigris/Pharo-Web-Browser:master/repository';"
	
	self addTo: aSpec depGithubProject: 'pharo-spec/Spec' baseline: 'Spec' branch: 'master/src'.
	" Metacello new
        githubUser: 'pharo-spec' project: 'Spec' commitish: 'master' path: 'src';
        baseline: 'Spec';
        onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        ignoreImage;
        load"
	self addTo: aSpec depGithubProject: 'pharo-contributions/Cryptography' baseline: 'Cryptography' branch: 'master/src'.
	
	self addTo: aSpec depGithubProject: 'PolyMathOrg/PolyMath' baseline: 'PolyMath' branch: 'master/src'.
	
	""
	
	self addTo: aSpec depGithubProject: 'svenvc/NeoJSON' baseline: 'NeoJSON' branch: 'master/src'.
	self addTo: aSpec depGithubProject: 'svenvc/NeoCSV' baseline: 'NeoCSV' branch: 'master/src'.
	self addTo: aSpec depGithubProject: 'svenvc/ston' baseline: 'Ston' branch: 'master/src'.
	
	self addTo: aSpec depGithubProject: 'seandenigris/Pharo-Web-Browser' baseline: 'ExternalWebBrowser' branch: 'master/src'.
	
	"self addTo: aSpec depGithubProject: 'dionisiydk/Mocketry' baseline: 'Mocketry' branch: 'master/src'.
	self addTo: aSpec depGithubProject: 'VincentBlondeau/IMAPClient' baseline: 'ImapClient' branch: 'master/src'."
	self addTo: aSpec depGithubProject: 'skaplar/NewWave' baseline: 'NewWave' branch: 'master/src'.
	
	self addTo: aSpec depGithubProject: 'rydier/SSDP' baseline: 'SSDP' branch: 'master/repository'.

	
	"jecisc/FlagBrowser"
	"self addTo: aSpec depGithubProject: 'jecisc/FlagBrowser' baseline: 'FlagBrowser' branch: 'master/src'."
	"jecisc/pharo-scripts"
	"self addTo: aSpec depGithubProject: 'jecisc/pharo-scripts' baseline: 'PharoSettings' branch: 'master/src/settings'."
	
	
	
]

{ #category : #baselines }
BaselineOfICTWorkbench >> dependantRequirements [

	^ dependantRequirements ifNil: [ dependantRequirements := OrderedCollection new ]
]
