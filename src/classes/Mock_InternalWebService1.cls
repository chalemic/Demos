@isTest
global class Mock_InternalWebService1 implements HttpCalloutMock {
	global HTTPResponse respond(HTTPRequest req) {
		HttpResponse res = new HttpResponse();
		if (req.getEndpoint().contains('TpsReport') && 
			('POST' == req.getMethod())){
			res.setBody('1');
			res.setStatusCode(200);
		}
		else if (req.getEndpoint().contains('SendTpsReport') && 
			('GET' == req.getMethod())){
			res.setBody('Sample data');
			res.setStatusCode(200);
		}
		else{
			res.setBody('Unknown method');
			res.setStatusCode(404);
		}
		
		return res;
	}
}