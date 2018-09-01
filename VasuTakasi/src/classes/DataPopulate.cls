public with sharing class DataPopulate {
    public DataPopulate(ApexPages.StandardController controller) {
        con=(contact)controller.getRecord(); 
    }
    public void testAcc() {
        if(con.AccountId !=null){
            Account objAcc = [select Id,name,Billingstreet,BillingCity,BillingCountry,BillingPostalCode,BillingState  from Account where id=:con.AccountId ];        
            con.MailingStreet=objAcc.BillingStreet;
            con.Mailingcity=objAcc.Billingcity;
            con.Mailingcountry=objAcc.Billingcountry;
            con.MailingPostalCode =objAcc.BillingPostalCode ;
            con.MailingState =objAcc.BillingState;
        }    
    }
    public Contact con{get;set;}
}