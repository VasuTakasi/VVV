public class EmployeeController {
	 @AuraEnabled
    public static AuraResponse saveEmp(Employee__c empObj) {
        try{
            upsert empObj;
            return new AuraResponse( 'confirm', 'Record has been saved', empObj );           
        }
        catch(exception e)
        {
            return new AuraResponse( 'error', e.getMessage(), empObj );
        }
    }
    
    public class AuraResponse
    {
        @AuraEnabled public string statusInfo;
        @AuraEnabled public string message;
        @AuraEnabled public Employee__c empObj;
        
        AuraResponse( string statusInfo, string message, Employee__c empObj )
        {
            this.statusInfo = statusInfo;
            this.message = message; 
            this.empObj = empObj;    
        }
    }
}