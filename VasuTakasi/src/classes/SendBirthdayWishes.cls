global class SendBirthdayWishes implements Database.Batchable<sObject>
{
string query;
 global Database.querylocator start(Database.BatchableContext bc)
 {
  	String query= 'SELECT Id, Name, email__c FROM Sample_Object__c ';
    query += 'where email__c != null';
    return Database.getQueryLocator(query);
 }

global void execute(Database.BatchableContext bc, List<Sample_Object__c> lstPatients)
{
    date thisdate=system.today();
   string sysday=thisdate.day()+'';
   string sysmonth=thisdate.month()+'';
   
   sysday = sysday.length() == 1?'0'+sysday:sysday;
   sysmonth = sysmonth.length() == 1?'0'+sysmonth:sysmonth;
   string dayandmonth=sysday+'/'+sysmonth;
    Messaging.SingleEmailMessage[] emails = new Messaging.SingleEmailMessage[]{};
        EmailTemplate et = [SELECT id FROM EmailTemplate limit 1];
   Contact objCon = [Select Id, Name FROM COntact where email = 'vasu_funnyboy@yahoo.com' limit 1] ;
    //Patient__c[] patientsTobeupdated = new Patient__c[]{};
     for(Sample_Object__c objP : lstPatients)
     {
         //if( objP.DateOfBirth_Text__c != null )
         {
       		//string[] dates = objP.DateOfBirth_Text__c.split('/');
             //if( dates.size() == 3 )
             {
                //string day = dates[1].length() == 1?'0'+dates[1]:dates[1];
                //string mnth = dates[0].length() == 1?'0'+dates[0]:dates[0];
                //string bDay =  day+'/'+mnth;
                 //if( bDay == dayandmonth )
                 {
                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                     List<String> toAddresses = new List<String>();
                     toAddresses.add(objP.email__c);
                     email.setToAddresses(toAddresses);
                     email.setReplyTo('vasu_funnyboy@yahoo.com');
                     //List<String> ccAddresses = new List<String>();
                     //email.setCcAddresses(ccAddresses);
                     //email.setSubject('Happy Birthday. Have a blast — Birthday Reminder!');
                     String message = 'Happy Birthday';
                     //email.setHtmlBody(message);
                     email.setSenderDisplayName(objCon.Name);
                     email.setTemplateId(et.id); 
                     email.setTargetObjectId(objCon.Id); 
                     email.setWhatId(objP.Id);
                     email.setSaveAsActivity(false);
                     email.setTreatTargetObjectAsRecipient(false); //Don’t send email to contact
                     //for(OrgWideEmailAddress owa : [select id, Address, DisplayName from OrgWideEmailAddress WHERE DisplayName='aaa']) {
                       //    email.setOrgWideEmailAddressId(owa.id);
                      //}
                     emails.add(email);       
                     //objP.Bday_Message_Sent_Date__C = system.now();
                     //patientsTobeupdated.add( objP ); 
                 }
             }   
         }
     }
    if( !emails.isEmpty() )
    {
        Messaging.sendEmail(emails); 
    }
    //if( !patientsTobeupdated.isEmpty() )
    //	update patientsTobeupdated;    
}

 global void finish(Database.batchableContext bc)
 {
 }
}