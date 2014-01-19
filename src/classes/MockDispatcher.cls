@isTest
global class MockDispatcher implements HttpCalloutMock{
	private Set<String> methodsCalled = new Set<String>();
	
	global HTTPResponse respond(HTTPRequest req) {
		HttpResponse res;
		methodsCalled.add(req.getEndpoint());
		if (req.getEndpoint().contains('Internal')){
			res = new Mock_InternalWebService1().respond(req);
		}
		else{
			res = new HttpResponse();
			res.setBody('Unknown method');
			res.setStatusCode(404);			
		}
		
		return res;
	}
	
	public Boolean WasInvoked(string endpoint){
		return methodsCalled.contains(endpoint);
	}
}