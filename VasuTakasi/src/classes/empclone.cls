public with sharing class empclone {

public list<employee__c>ee=new list<employee__c>();
    public list<employee__c> getEmployees() {
     ee=[select id,name,phone__c from employee__c];
        return ee;
    }
 public pagereference cloning()
 {
 employee__c emp=[select id,name,phone__c from employee__c where id=:eid];
 employee__c empnew=emp.clone(false);
 insert empnew;
 //pagereference ref=new pagereference('/apex/clone');
 //ref.setredirect(true);
 return null;
 }
public string eid{get;set;}
}