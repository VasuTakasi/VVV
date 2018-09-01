global class Batchupdating implements Database.Batchable<sObject>{

   
   
   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator([select id,name from employee__c]);
   }

   global void execute(Database.BatchableContext BC, List<employee__c> scope){
     for(integer i=0;i<=scope.size();i++){
     
     if(scope[i].name=='666')
     {
         scope[i].name='kevvuuuu';
     }
     }
     update scope;
    }

   global void finish(Database.BatchableContext BC){
   }
}