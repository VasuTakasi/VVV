public with sharing class acc_cont
{

   list<contact>conlist=new list<contact>();
   list<account>acclist=new list<account>();
    public list<account> getAccounts()
    {
        acclist=[select id,name,phone from account limit 15];
        return acclist;
    }

    
    public list<contact>getContacts()
    {
        conlist=[select name,email from contact limit 15];
        return conlist;
    }

}