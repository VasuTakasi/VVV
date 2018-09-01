public class acc_with_conts
{
    public list<account>acc;
    public list<account>getAccounts()
    {
        acc=new list<account>();
        acc=[select name,(select name,phone from contacts)from account order by name];
        //system.debug(acc.contacts.lastname);
        return acc;
    }

    
}