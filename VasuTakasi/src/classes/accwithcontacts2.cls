public with sharing class accwithcontacts2
{
 string s='';
    public String getInfo()
     {
            
       
        return s;
    }

 public  list<account>acc;
 public  list<contact>cont;
 public list<list<contact>>all=new list<list<contact>>();
 
   public string accname{get;set;}
    public list<list<contact>> getacc_conts()
    {
    all.clear();
              acc=[select id,name from account where name=:accname];
      for(integer i=0;i<acc.size();i++)
      {
       
       cont=[select name,accountid from contact where accountid =:acc[i].id];
       
       all.add(cont);
      }
      
       return all;
   }
    public pagereference showcontacts()
    {
    return null;
    }
    public static testmethod void m1()
    {
         account a=new account();
     a.name='vasu';
     a.phone='9040123456';
    insert a;
    contact c=new contact();
    c.lastname='vasu';
    c.accountid=a.id; 
    insert c;
     list<account>acc=new list<account>();
     acc.add(a);
     
      accwithcontacts2 obj=new accwithcontacts2();
     
       obj.getacc_conts();
       obj.showcontacts();
       obj.getInfo();
      
    }
}