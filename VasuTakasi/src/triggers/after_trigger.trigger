/*                 This trigger is for updating firld based on cousre using after insert
Befor insert wer can directly assignde the desire data to perticuler field.
but in after insert we shoul update the perticuler  field

*/

trigger after_trigger on Student__c (after insert)
{
   
    list<student__c>liststudent=new list<student__c>();
    list<student__c>liststudent1=new list<student__c>();
    liststudent1=trigger.new;
    //liststudent=[select id,name,course_name__c,fee__c from student__c where id in:trigger.new];
    liststudent=[select id,name,course_name__c,fee__c from student__c where id in:liststudent1];
    for(student__c s:liststudent)//in 
    {
    if(s.course_name__c=='sap')
    {
        s.fee__c=5000;
    }
    else if(s.course_name__c=='salesforce')
    {
         s.fee__c=15000;
    }
    }
    update liststudent;
   }