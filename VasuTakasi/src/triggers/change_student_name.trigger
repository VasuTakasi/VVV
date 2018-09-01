trigger change_student_name on History__c (before insert)
{
 
trigger.new[0].addError(' ');
}