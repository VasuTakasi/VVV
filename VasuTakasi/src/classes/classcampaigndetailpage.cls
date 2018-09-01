public with sharing class classcampaigndetailpage
{
    public pagereference editing()
{
  pagereference ref  = new pagereference('https://ap1.salesforce.com/70190000000M8z9/e?retURL=%2F70190000000M8z9');
        ref.setredirect(true);
        return ref;
}

public string camid{get;set;}

public id id1;
public classcampaigndetailpage(ApexPages.StandardController controller)
  {
  id1 =  ApexPages.currentPage().getParameters().get('id');
   }
public campaign deldlt=new campaign();

public pagereference deleting()
{
deldlt=[select id, name from campaign where id=:id1];
delete deldlt;
        pagereference ref=new pagereference('https://c.ap1.visual.force.com/apex/Visualforce_Assignment_HR001');
        ref.setredirect(true);
        return ref;
}

public pagereference copy()
{
        pagereference ref  = new pagereference('https://ap1.salesforce.com/70190000000M8z9/e?clone=1&retURL=%2F70190000000M8z9');
        ref.setredirect(true);
        return ref;
}

}