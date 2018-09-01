public with sharing class getpassedrecords 
{
 public string url=apexpages.currentpage().getparameters().get('value');
    public list<employee__c> getRecords() 
    {
    list<string>ids=url.split(':');
    list<employee__c>ee=[select id,name,phone__c from employee__c where id in : ids];
        return ee;
    }

}