public with sharing class accounts_based_on_months
{
  
    public String selected_month { get; set; }
    public list<account>acc;
    public list<account>accounts;
    

    public PageReference getrecords()
    {
         string dat='';
          accounts=new list<account>();
          //acc.clear();
         acc=new list<account>();
         acc=[select id,Createddate,name,phone from account];
         for(account a:acc)
         {
             dat=a.Createddate .format('MMMM');
             
             if(selected_month ==dat)
             {
               accounts.add(a);
              }
             
         }
        return null;
    }


    public list<account> getAccounts()
    {
      
            return accounts;
    }


    public static testmethod void testm1()
    {
        account aa=new account();
        aa.name='zz';
        insert aa;
      accounts_based_on_months a=new accounts_based_on_months();
      a.getrecords();
      a.getAccounts();
    }

    
}