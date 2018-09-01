public with sharing class ide_class
 {
 public list<account>acc_list;

   public void getaccounts()
   {
   acc_list=new list<account>();
   acc_list=[select name from account where name='vasu'];
        }
    public static testmethod void m1()
    {
     account a=new account();
     a.name='aaa';
     a.phone='875634535';
     insert a;
     ide_class i=new ide_class();
    i.getaccounts();
    }
    }