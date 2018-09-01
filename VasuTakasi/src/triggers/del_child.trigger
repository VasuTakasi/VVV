trigger del_child on Account__c (before delete) {
contact c=[select id from contact where accountid=:trigger.old[0].id];
delete c;
employee__c ee=[select id,name from employee__c where name=:trigger.old[0].name];
delete ee;
}