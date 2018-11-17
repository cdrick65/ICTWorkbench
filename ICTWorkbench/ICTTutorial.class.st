"
!ICTT practical

The purpose of this tutorial is to explore simple Inofmration and Communcation Technology basic concepts.

- URL
${example:ICTTutorial>>#newUrl1}$

- Client/Server
- (web)Client 
-get a response
${example:name=ICTTutorial>>#newClient2}$
-webpage
-API usage
-send information
-analyse a response - webscrapping
-(web)Server
-launch default server
-get response from webbrowser
-get response from a client (object)
-TUTORIAL: create a simple server that receive and store information from an IoT device 
- UDP Socket
"
Class {
	#name : #ICTTutorial,
	#superclass : #Object,
	#category : #'ICTWorkbench-Tutorials'
}

{ #category : #'examples-url' }
ICTTutorial >> contents2 [
<gtExample>

	 ^ self newUrl1 retrieveContents.




]

{ #category : #'examples-url' }
ICTTutorial >> newClient2 [
<gtExample>

	 ^ ZnClient new
         beOneShot;
         get: 'http://zn.stfx.eu/zn/numbers.txt'.





]

{ #category : #'examples-url' }
ICTTutorial >> newClient3 [
<gtExample>

	 ^ ZnEasy 
         get: 'http://zn.stfx.eu/zn/small.html'.





]

{ #category : #'examples-url' }
ICTTutorial >> newClientExisting [
<gtExample>

	 ^ ZnEasy 
         get: 'http://www.smartphm.eu/existepas.html'.





]

{ #category : #'examples-url' }
ICTTutorial >> newClientNotExisting [
<gtExample>

	 ^ ZnEasy 
         get: 'http://www.trucmuchedemachin.es'.





]

{ #category : #'examples-url' }
ICTTutorial >> newClientNotFound [
<gtExample>

	 ^ ZnEasy 
         get: 'http://www.smartphm.eu/existepas.html'.





]

{ #category : #'examples-url' }
ICTTutorial >> newUrl1 [
<gtExample>

	^ 'http://www.monip.fr' asUrl.


]

{ #category : #'examples-url' }
ICTTutorial >> newUrl2 [
<gtExample>

	 ^ ZnUrl new
			scheme: #http;
			host: 'www.seaside.st';
			port: 8080;
			addPathSegment: 'example';
			addPathSegment: 'foo.html';
			queryAt: 'q' put: '100';
			fragment: 'mark'.





]

{ #category : #'examples-url' }
ICTTutorial >> test [ 
	
	^44
]

{ #category : #'examples-url' }
ICTTutorial >> testBeacon [

	FileLogger new
	filename: '/tmp/test.log';
	runFor: StringSignal during: [ 
		StringSignal emit: 'test message'
		]
]
