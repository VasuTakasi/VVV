public with sharing class delete_operation
{

    public delete_operation() {

    }
  
    public string rid{get;set;}

    public PageReference remove()
    {
        employee__c ee=[select id from employee__c where id=:rid];
        delete ee;
        return null;
    }


    public list<employee__c> getRecords()
    {
        list<employee__c>emp=[select id,name,phone__c from employee__c ORDER BY Name ]; 
        return emp;
    }

}