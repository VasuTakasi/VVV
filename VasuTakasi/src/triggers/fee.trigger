trigger fee on Student__c (before insert,before update)
{
   for(student__c std:trigger.new)
   {
   account a=[select id,name from account where name='vvv' limit 1];
   a.name='vv';
   a.phone='09030192813';
   update a;
   if(std.course_name__c=='salesforce')
   {
    std.fee__c=500;
    }else if(std.course_name__c=='sap')
    {
     std.fee__c=1000;
    }
    }
    
    //this code will executes in edit case
    
    if(trigger.isupdate)
    {
    if(trigger.old[0].name==trigger.new[0].name)
    {
        trigger.new[0].name.adderror('name should not be equal');
    }
    }
}