public with sharing class wrapperclass
 {
    public wrapperclass()
    {
    }
  
    public string s{get;set;}
  public class wrapper
    {
        public string tname{get;set;}
        public string tcity{get;set;}
        public boolean ischecked{get;set;}
     public wrapper(string ename,string ecity)
     {
         this.tname=ename;
         this.tcity=ecity;
         ischecked=false;
     }     
    }
     list<employee__c>emp;
     list<wrapper>empwrap=new list<wrapper>();
    public list<wrapper> getRecords()
    {
       emp=[select name,city__c from employee__c];
       for(integer i=0;i<emp.size();i++)
       {
           empwrap.add(new wrapper(emp[i].name,emp[i].city__c)); 
       }
        return empwrap;
    }
    
    public list<string>selectednames=new list<string>();
    public list<id>selectedids=new list<id>();
    public list<employee__c>selectedrecords=new list<employee__c>();
    public string go() 
    {
        for(wrapper w:empwrap)
        {
            if(w.ischecked==true)
            {
              selectednames.add(w.tname);
            }
        }
        
        selectedrecords=[select id,name,city__c from employee__c where name in :selectednames];
        for(integer i=0;i<selectedrecords.size();i++)
        {
           selectedids.add(selectedrecords[i].id);
        }
        
        for(integer i=0;i<selectedids.size();i++)
        {
            if(i<selectedids.size()-1)
            {
                s=s+selectedids[i]+':';
                  }
                  else
                  {
                   s=s+selectedids[i];
                  }
        }
        return s; //(new pagereference('/apex/demo20?id='+s));
    }

}