public with sharing class accintopicklist {

public list<selectoption>emps=new list<selectoption>();

    public list<selectoption> getempnames() {
for(employee__c ee:[select name from employee__c])
{

 emps.add(new selectoption(ee.name,ee.name));
}
        return emps;
      
    }

}