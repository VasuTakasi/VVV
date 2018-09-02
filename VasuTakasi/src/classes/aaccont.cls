public with sharing class aaccont {
    public set<string>accid=new set<string>();
    public list<account>aq=new list<account>();
    
    public list<account> getCont()
     {
     list<contact>cc= new list<contact>();
     cc=[select name,accountid from contact];
         for(contact a:cc)
         {
            if(a.accountid!=null)
            {
               accid.add(a.accountid);         
            }         
         }
        aq=[select name from account where id in :accid];
        return aq;
    }
    }