public with sharing class filterrecords 
{

   

    public list<employee__c>emp;
   


    
    public list<employee__c> getFilt() {
        return emp;
    }
  
    
    string squery='';
    public list<employee__c> getRecords() 
    {
      if(squery=='')
      {
          
             squery='select id,name,phone__c from employee__c ';
          emp=database.query(squery);
     }
     else
     {
      if(selectedchar=='All')
      {
             squery='select id,name,phone__c from employee__c ';
          emp=database.query(squery);
               
       }
       else
        {
        squery='select id,name,phone__c from employee__c where name LIKE \''+selectedchar+'%\'';
        emp=database.query(squery);
      
        }
       
        }
           if(emp.size()==0)
         {
             ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Case List Doest not contains any records');
            ApexPages.addMessage(myMsg); 
            system.debug('??????????????????????'+mymsg+'///'+emp.size());
         }
       return emp ;
       
    }


    public PageReference filter() 
    {
                return null;
    }


    public String selectedchar { get; set; }
}