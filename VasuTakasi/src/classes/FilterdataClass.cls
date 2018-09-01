public with sharing class FilterdataClass 
{
     List<employee__c> lsttest = new List<employee__c>();
    string sQuery='';
    public List<employee__c> getRecords() {
    if(hdnVal=='ALL')
    {
        sQuery='select Id,name,city__c from employee__c';
    }
    else
    {
       sQuery='select Id,name,city__c from employee__c where name LIKE \''+hdnVal+'%\'';
       system.debug('****** sQuery is ******'+sQuery);
     }
    lsttest = database.query(sQuery);
    return lsttest;
    }


    public PageReference showValApex() {
        system.debug('******hdnVal******'+hdnVal);
        return null;
    }

    public String hdnVal { get; set; }
}