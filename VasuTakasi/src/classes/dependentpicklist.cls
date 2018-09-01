public with sharing class dependentpicklist 
{

   public String empname { get; set; }
   list<selectoption>emp_options=new list<selectoption>();
   list<selectoption>emp_sals=new list<selectoption>();
    public list<selectoption> getEmpcontacts() 
    {
    emp_sals.clear();
    emp_sals.add(new selectoption('--none--','--none--'));
   // employee__c ee=[select id from employee__c where name=:empname];
      for(salary__c sal : [select id,name,employee__c from Salary__c where employee__r.name=:empname])
      {
        emp_sals.add(new selectoption(sal.name,sal.name));
      }
        return emp_sals;
    }


   
    public list<selectoption> getEmplist() 
    {
    emp_options.add(new selectoption('--none--','---none--'));
    for(employee__c emp : [select name from employee__c])
    {
        emp_options.add(new selectoption(emp.name,emp.name));
      
    }
      return emp_options;
        }
        

}