public with sharing class emp_sal
 {
     list<selectoption>empnames=new list<selectoption>();

    public list<selectoption> getAll_emp_names()
   
    {   empnames.clear();
        empnames.add(new selectoption('--None--','--None--'));
        for(employee__c emp : [select name from employee__c order by name])
        {
            empnames.add(new selectoption(emp.name,emp.name));
        }
        return empnames;
    }

             public employee__c emp;
             list<Salary__c>sal;

    public PageReference find()
    {
           
        return null;
    }

      
    public String empname { get; set; }

    public list<Salary__c> getSals()
    {
     try
      {      
        
        if(empname<>null)
        {
          emp=[select id from employee__c where name=:empname];
          sal=[select id,name from Salary__c where employee__r.id=:emp.id];
          if(sal.size()==0)
          {
              
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.FATAL,'no records found');
        ApexPages.addMessage(myMsg);
          }
        }
        return sal;
      }
      catch(exception e)
      {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.warning,'Employee name does not exits');
        ApexPages.addMessage(myMsg);
     
      return null;
      }
     }

}