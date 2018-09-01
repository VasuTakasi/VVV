public class merge_duplicate_records
{

    public PageReference mergerecords() {
        return null;
    }

    list<Salary__c>salorylist;
    public list<salary__c>getsalorys()
    {
        salorylist=new list<salary__c>();
        salorylist=[select id,name,Basic__c from salary__c  ];
        return salorylist;
    }
}