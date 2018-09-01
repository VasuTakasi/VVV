public class sobj
{
    public void mtd()
    {
        list<employee__c>emp=[select id,name from employee__c];
        system.debug('records are'+emp);
        list<string>empnames=new list<string>();
        for(sobject rcd:emp)
        {
             empnames.add(string.valueof(rcd.get('name')));
        }
        
        system.debug('@@@@@@emp names are @@@@@@@'+empnames);
    }
}