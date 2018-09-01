public with sharing class search_objects2
{
  
    // variable declarations............
    
     public boolean con_show_hide { get; set; }
     public Account [] accounts{ get; set; }
     public Contact [] contacts{ get; set; }
     public String searchname { get; set; }
     
     // code for searching..............

    public PageReference search()
    {    
        con_show_hide=false;
        accounts =new list<account>();
        Contacts=new list<contact>();
        
        if(searchname!=null)
        {
        List<List<SObject>> searchList = [FIND :'*'+searchname+'*' IN ALL FIELDS RETURNING Account (Id, Name,phone), Contact(lastname,firstname), Opportunity, Lead]; 
         accounts = ((List<Account>)searchList[0]);
         contacts = ((List<Contact>)searchList[1]);
        // Opportunity [] opportunities = ((List<Opportunity>)searchList[2]);
         Lead [] leads = ((List<Lead>)searchList[3]);
         }
         if(contacts.size()!=null)
         {
             con_show_hide=true;
         }
        return null;
    }
      
}