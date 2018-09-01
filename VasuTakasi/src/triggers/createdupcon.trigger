/*
Author:vasu Takasi
Created Date:Dec 26, 2012
Descrption:To create another contact for account in lead conversion
*/
trigger createdupcon on Lead (after update) 
{
    list<contact>lstcontact=new contact[]{};
    list<opportunitycontactrole>lstoppconrole=new list<opportunitycontactrole>();
    list<task>lsttask=new task[]{};
    set<id>setconids=new set<id>();
    map<id,id>mapaccopp=new map<id,id>();//key->acc id, value-opp id
    map<id,task>mapacctsk=new map<id,task>();//key->acc id,value -task
    for(lead l:trigger.new)
    {
        if(l.isconverted==true)
        {
            setconids.add(l.convertedcontactid);
            if(l.convertedopportunityid!=null &&l.convertedopportunityid!='')
            mapaccopp.put(l.convertedaccountid,l.convertedopportunityid);
        }
    }
   for(contact c:[select lastname,firstname,accountid,phone,email from contact where id in:setconids])
   {
       lstcontact.add(c.clone());
   }
    insert lstcontact;
    for(contact c:lstcontact)
    {   
     	if(mapaccopp.get(c.accountid)!=null&&mapaccopp.get(c.accountid)!='')
        lstoppconrole.add(new opportunitycontactrole(contactid=c.id,opportunityid=mapaccopp.get(c.accountid)));
    }
    insert lstoppconrole;
}