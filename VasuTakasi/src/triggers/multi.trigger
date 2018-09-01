trigger multi on Student__c (after insert)
{
List<employee__c> dep= new List<employee__c>();
dep=[select id,name from employee__c];

for (Student__c emp: Trigger.new)
{
if(emp.Fee__c==10000)
{
for(employee__c d:dep)
{
d.phone__c='09030182818';
d.Status__c='closed';
}
}
}
update dep;

}