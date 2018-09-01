public with sharing class fullaccounts {

    public list<account> task1 { get; set; }
    public fullaccounts()
    {
            task1=new list<account> ();
            task1=[select name from account];    
    }
    
     
       
}