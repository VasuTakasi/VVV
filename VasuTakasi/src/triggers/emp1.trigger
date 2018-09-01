trigger emp1 on Employee__c (before insert,before update) 
{
Employee__c[]emp=trigger.new;
trigger_class.empmethod(emp);
}