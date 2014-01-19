/* First internal web service */
public class InternalWebService1 {
	// Files a new TPS report, returns the report's id.
	public string FileTpsReport(string data){
		// Get auth token for submitting report.
		AuthWebService auth = new AuthWebService();
		String authToken = auth.Authorize();
		
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://my.domain.com/TpsReport');
        req.setMethod('POST');
        Http h = new Http();
        HttpResponse res = h.send(req);
        return res.getBody();	
	}
	
	// Retrieves a TPS report by id.
	public string GetTpsReport(Integer idToRetrieve){
		// Get auth token to retrieve confidential data.
		AuthWebService auth = new AuthWebService();
		String authToken = auth.Authorize();
		
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://my.domain.com/TpsReport');
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);
        return res.getBody();			
	}
}