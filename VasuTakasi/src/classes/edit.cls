public with sharing class edit
{
    list<employee__c>emp=new list<employee__c>();
    employee__c empobj;
    
    public string eid{get;set;}
    public list<employee__c> getEmployees()
    {
        emp=[select id,name,phone__c from employee__c order by name limit 20];
        return emp;
    }
    public PageReference editing()
    {
        
        //this.eid = ApexPages.currentPage().getParameters().get('id'); 
       // empobj=[Select Id from employee__c where Id=:eid];
        pageReference editPage = new PageReference('https://ap1.salesforce.com/'+eid+'/e?retURL=%2F' + eid);
         editPage.setRedirect(true);
         return editPage;
       
    }

    

    
}