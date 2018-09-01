public with sharing class wrapper_delete
{
    //deletion of selected records--------------------------------
    
    public PageReference delete_selected()
     {
         list<account>selected=new list<account>();
         for(wrapper wrp:wrap_list)
         {
             if(wrp.checkbox==true)
             {
                 selected.add(wrp.acc);
             }
         }
         delete selected;
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, selected.size()+'  Records deleted');
            apexpages.addmessage(myMsg);
        return null;
    }


    public list<wrapper>wrap_list { get; set; }
    wrapper w;
    public list<account>acc_list;
    
    //populate accounts--------------------------
        public list<wrapper>getaccounts()
        {
            acc_list=new list<account>();
            wrap_list =new list<wrapper>();
            acc_list=[select id,name,phone from account limit 50];
            for(account a:acc_list)
            {
                w=new wrapper();
                w.checkbox=false;
                w.acc=a;
                wrap_list.add(w);
            }
            return wrap_list;
        }
    //wrapper class---------------------------------------------------
    public class wrapper
    {
        public boolean checkbox{get;set;}
        public account acc{get;set;}
    }
    
}