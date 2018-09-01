public with sharing class constr
{

public String listoption { get; set; }

list<account>acc=new list<account>();

    public list<account> getAccounts()
     {
             if(listoption !=null)
             {
        acc=[select name,phone,industry from account where industry=:listoption];
              }      
        return acc;
    }


  public constr()
  { 
        acc=[select name,phone,industry from account where industry='Engineering'];
  }
}