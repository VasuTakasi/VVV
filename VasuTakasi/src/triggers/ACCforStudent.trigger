trigger ACCforStudent on Student__c (After insert) {

list<Account> lstacc= New List<Account>();
for(Student__c s:Trigger.New)
{
    Account acc=new Account();
    //check for mandatory fields
    acc.name=s.name;
    acc.phone=s.phone__c;
    lstacc.add(acc);
}
insert lstacc;

}