public with sharing class acc_opp_count
{

    public PageReference caluclate_count()
    {
        opp_list=new list<Opportunity>();
        opp_list=[select id from Opportunity where accountid=:accid];
        opp_count =opp_list.size();
        return null;
    }


    public integer opp_count { get; set; }
    public string accid{get;set;}
    public list<Opportunity>opp_list;
    list<account>acc_list;
    public list<account>getAccounts()
    {
        acc_list=new list<account>();
       acc_list=[select id,name,phone from account order by name];
        return acc_list;
    }

    
}