public with sharing class DClass {

    list<employee__c> lstemp = new list<employee__c>();
    public list<employee__c> getRecords() {
    List<string> ids = url.split(':');
     lstemp = [select id, name, city__c from employee__c where id in : ids];
        return lstemp;
    }

    string url = apexpages.currentpage().getparameters().get('id');
}