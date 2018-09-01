trigger Delchild on Technologies__c (before delete) {
/*
list<student__c> lststd=new list<student__C>();
lststd=[select id,technologies__c from student__c where technologies__c =:trigger.old[0].id];

delete lststd;*/
//write this trigger  for bulk trigger

list<student__c> lststd=new list<student__C>();
set<string> s1=new set<string >();
for(Technologies__c t: trigger.old)
{
s1.add(t.id);

}
lststd=[select id ,Technologies__c  from student__c where Technologies__c IN:s1];
delete lststd;

}