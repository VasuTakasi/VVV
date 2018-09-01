public with sharing class wpclass_two_objs
{
    public list<wrapper> lstwrap = new list<wrapper> ();
    integer size;
    
    public list<wrapper> getwrapper ()
    {
   
    list<account> lstacc = [select name from Account];
    list <employee__c> lstemp = [select name from employee__c];
    
    if (lstacc.size()> lstemp.size())
    {
    size= lstacc.size();
    }
    else
    {
    size=lstemp.size();
    
    }
    for (integer i=0;i<size;i++ )
    {
     wrapper w = new wrapper ();
    if(i<lstacc.size())
    {
  
    w.a=lstacc[i];
    }
    if(i<lstemp.size())
    {
    
    w.emp=lstemp[i];
    }
lstwrap.add(w);
      
    }
    return lstwrap;
    }
    public class wrapper
    {
    public account a {get;set;}
    public employee__c emp {get;set;}
    }
    

}