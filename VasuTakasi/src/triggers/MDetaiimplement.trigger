trigger MDetaiimplement on Student__c (before insert)

 {
 
 for(student__c s:trigger.new)
 {
 
     if(s.Technologies__c==null)//check for parent exist or not
         {
             s.Technologies__c.adderror('technology required');
             
         }
 }

}