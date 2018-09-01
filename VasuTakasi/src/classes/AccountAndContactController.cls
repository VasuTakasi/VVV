public class AccountAndContactController 
{
    @auraEnabled
    public static list<RecordsWrapper> getRecords()
    {
        integer i = 0;
        list<RecordsWrapper> recordsWrapperList = new list<RecordsWrapper>();
        for( Account acc : [ SELECT Id, 
                                    Name, 
                                    Phone, 
                                    ( SELECT Id, Name, Email FROM Contacts )
                                    FROM Account LIMIT 1] )
        {
            RecordsWrapper rw = new RecordsWrapper();
            rw.index = i;
            i++;
            rw.accountObj = acc;
            if( acc.Contacts.size() == 0 )
            {
                rw.contactList = new list<Contact>();
            }
            else
            	rw.contactList = acc.Contacts;
            recordsWrapperList.add(rw);
        }  
        return recordsWrapperList;
    }
    
    @AuraEnabled
    public static string saveAllRecords( list<RecordsWrapper> recordsWrapperList )
    {
        system.debug( 'recordsWrapperList_________'+recordsWrapperList );
        return '';
    }
	public class RecordsWrapper
    {
        @AuraEnabled public integer index;
        @AuraEnabled public Account accountObj;
        @AuraEnabled public list<Contact> contactList;
    }
    
     @AuraEnabled
    public static void SaveAccounts(List<Account> accList){
        Insert accList;
    }
}