/* Sample business logic class */
public class BusinessLogic {
	public String DoWork(Boolean calloutIsNeeded){
		if (calloutIsNeeded){
			// Retrieve and process data, then file TPS report
			InternalWebService1 ws = new InternalWebService1();
			String newReportId = ws.FileTpsReport('Sensitive data');
			return newReportId;
		}
		else{
			return null;
		}
	}
}