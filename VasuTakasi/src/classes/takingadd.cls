public class takingadd {

//list<account>acc=new list<account>();
 public account strt;
 public string ab;
    public takingadd(ApexPages.StandardController controller) 
    {
    system.debug('hellow---------'+rid);
 if(rid<>null)
    {
   strt=[select id,name, billingstreet from account where id=:rid];
    ab=strt.billingstreet;
    system.debug('hi----------'+ab);
     }
    }
    public id rid{ get; set; }
    public string getadd()
    {
     return ab;
    }

}