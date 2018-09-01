public with sharing class listviews {

    public PageReference dosave()
     {
        employee__c emp=new employee__c();
        emp.name=empname;
        emp.phone__c='09874562135';
        insert emp;
      //  return (new pagereference('https://c.ap1.visual.force.com/apex/listviews'));
      return null;
    }


    public String empname { get; set; }
}