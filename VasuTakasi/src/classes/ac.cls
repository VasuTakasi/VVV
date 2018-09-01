public with sharing class ac
 {
 public list<account> acc;
 public list<contact> cont;
 public string aid{get;set;}
    
public ac()
{
acc=[select name from account];
}
public pagereference save()
{
cont=[select firstname,lastname from contact where accountid=:aid];
return null;
}
 public list<account> getac() {
        return acc;
    }
     public list<contact> getconts() {
        return cont;
    }
  }