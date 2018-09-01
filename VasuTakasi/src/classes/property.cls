public with sharing class property
{

     public list<account>acc {get;set;}
    

    public String iptext { get; set; }
    

    public boolean Show_hide{get;set;}
       
    public list<account> getTable() {
     
        return acc;
    }

    public String erro { get; set; }

    public pagereference go()
     {
       if(iptext !='')
       {
        acc=new list<account>();
        acc=[select name,phone from account where name=:iptext];
         Show_hide=true;
         }
         else
         {
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Field should not left blank');
         Apexpages.addMessage(myMsg);
         }
        return null;
    }


   
}