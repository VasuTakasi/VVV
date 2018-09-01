global class scheduling implements schedulable
{
  global void execute(SchedulableContext sc)
{
 employee__c emp=new employee__c();
 emp.name='form schuduling';
 emp.phone__c='09874562541';
 insert emp;
}
}