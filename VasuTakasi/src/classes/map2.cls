public class map2
{
    public void m1()
    {
        map<id,employee__c>mp=new map<id,employee__c>([select id,name from employee__c]);
        list<string>empnames=new list<string>();
        for(id ids : mp.keyset())
        {
            empnames.add(mp.get(ids).name);
        }
        system.debug('^&&&%%&*%&*%&*%'+empnames);
    }
}