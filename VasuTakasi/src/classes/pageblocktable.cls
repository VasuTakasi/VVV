public with sharing class pageblocktable 
{

              public list<employee__c>emp=new list<employee__c>();
    public list<employee__c> getRecords() 
    {
        emp=[select id,name from employee__c];
        return emp;
    }

}