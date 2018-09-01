public with sharing class accts_conts_by_single_query
{

    public list<SObject> conts { get; set; }
    //conts=new list<SObject>();
    public list<account>acclist;
    public list<contact>conlist;
    string  FieldValue;
     SObject[] c;
    public accts_conts_by_single_query()
    {
       
        acclist=[select id,name,(select id,name from contacts) from account];
       for(integer i=0;i<acclist.size();i++)
       {
        conts = acclist.get(i).getSObjects('Contacts');
        //FieldValue = c.get(0).get('Name');

        }
             system.debug('###############'+conts);
    }
}