@RestResource(urlMapping='/MappingDataService/*')
global with sharing class MappingData {  
 //Here we can use Either HttpPost or HttpGet  
  @HttpPost   
 /*    
//Method which returns the integer Value   
 Global static integer MappingDetails (Integer x, integer y) {    
    return x+y;  
  }  
  */    //Method which returns the list of sObject Records.   
 Global static list<sObject> MappingDetails(String objname){
//        List<teacher__c> lstResult = [select id, name from teacher__c where id=: MapId];
                string s= 'Select id , name from '+objname;   
     List<sobject> lst= database.query(s);     
   return lst;   
 }}