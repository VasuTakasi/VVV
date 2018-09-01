public class table_inline_edit
{

    public String record { get; set; }
    public table_inline_edit()
    {
        acclist=new list<account>();
        acclist=[select id,name,phone from account limit 25];
    }
    public PageReference saverecord()
     {
         
        account a=new account();
         a=[select id,name from account where id=:accid];
         a.name=apexpages.currentpage().getparameters().get('p:f:pb:pbt:name');
         update a;
        return null;
    }


    public list<account>acclist{get;set;}
    public string accid{get;set;}
    
   
}