public with sharing class wrapperemp 
{

  public list<employee__c>emplist=new list<employee__c>();
  public list<wrapper>wrplist=new list<wrapper>();
  public list<string>selectednames=new list<string>();
  
  public class wrapper
  {
  public string ename{get;set;}
  public string ephone{get;set;}
  public boolean ischecked{get;set;}
  public wrapper(string ephone,string ename)
  {
  this.ischecked=false;
  this.ename=ename;
  this.ephone=ephone;
  }
  }
    public list<wrapper> getEmprecords() 
    {
         emplist=[select name,phone__c from employee__c];
         for(integer i=0;i<emplist.size();i++)
         {
         wrplist.add(new wrapper(emplist[i].phone__c,emplist[i].name));
         }
        return wrplist;
    }

    public PageReference display() 
    {
      for(wrapper w : wrplist)
      {
       if(w.ischecked==true)
        {
         selectednames.add(w.ename);
        }
      }
      
      list<employee__c>emprecords=[select id,name,phone__c from employee__c where name in : selectednames];
       List<String> selectedRecordIds = new List<String>();
        for(Integer  i=0;i<emprecords.size();i++){
            selectedRecordIds.add(emprecords[i].Id);
        }
        
       string s='';
       for(integer i=0;i<selectedrecordids.size();i++)
       {
       if(i<selectedrecordids.size()-1)
       {
        s=s+selectedrecordids[i]+':';
        }else
        {
        s=s+selectedrecordids[i];
        }
       }
       pagereference ref=new pagereference('/apex/dispalyselectedrecords?value='+s);
       ref.setredirect(true);
        return ref;
    }
}