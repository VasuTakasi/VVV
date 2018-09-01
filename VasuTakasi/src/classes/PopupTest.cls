public with sharing class PopupTest {    
    public List<account> getAccounts()  
    {  
        List<account> accounttList = new List<account>();  
        accounttList = [Select Id, Name from Account];  
        return accounttList ;  
    }  
  public list<contact> getcontact()
  {
  list<contact> conlist = new list<contact>();
  conlist = [select id,name from contact];
  return conlist;
  }
}