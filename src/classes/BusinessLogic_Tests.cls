// Test our BusinessLogic class.
@isTest
private class BusinessLogic_Tests {
	// Test to verify that callouts are only made when appropriate.
    static testMethod void VerifyWebServiceNotInvoked() {
    	MockDispatcher myDispatcher = new MockDispatcher();
     	Test.setMock(HttpCalloutMock.class, myDispatcher);	
     	BusinessLogic helper = new BusinessLogic(); 
     	
     	Test.startTest();
     	helper.DoWork(false);
     	Test.stopTest();
     	
     	System.assertEquals(false, myDispatcher.WasInvoked('http://my.domain.com/Internal/TpsReport'), 'Web service inappropriately invoked.');
    }
    
    // Test to verify that callouts are only made when appropriate.
    static testMethod void VerifyWebServiceInvoked() {
    	MockDispatcher myDispatcher = new MockDispatcher();
     	Test.setMock(HttpCalloutMock.class, myDispatcher);	
     	BusinessLogic helper = new BusinessLogic(); 
     	
     	Test.startTest();
     	helper.DoWork(true);
     	Test.stopTest();
     	
     	System.assertEquals(true, myDispatcher.WasInvoked('http://my.domain.com/Internal/TpsReport'), 'Web service not invoked as expected.');
    }
}
