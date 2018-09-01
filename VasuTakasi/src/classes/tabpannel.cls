public with sharing class tabpannel
 {

    public list<account> getAcc() {
        list<account>acc=[select name from account];
        return acc;
        
    }

   public list<employee__c>emp;
    public list<employee__c> getEmprecords() 
    {
    emp=[select id,name from employee__c];
        return emp;
    }

}