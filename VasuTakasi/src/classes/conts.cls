public with sharing class conts
 {
public list<account>acc;
    public conts() {
acc=[select name,fax from account limit 200];
 for(integer i=0;i<acc.size();i++)
    {
        if(acc[i].fax==null)
        {
               acc[i].fax='empty';
        }
    }
    }
    public list<account>getnames()
    {
    return acc;
    } 
}