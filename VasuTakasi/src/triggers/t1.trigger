trigger t1 on Account (before insert,before update)
{
  List<string> lstnew=new List<string>();
for(account newrec: Trigger.new)
{
lstnew.add(newrec.phone);
}
system.debug('******NewEmail *****'+lstnew);
set<string> setemail=new set<string>();
for(account s : [select Id,name,phone from account where phone in : lstnew])
{
setemail.add(s.phone);
} 
system.debug('***Duplicate ****'+setemail);

for(account s:Trigger.new)
{
if(setemail.contains(s.phone))
{
s.phone.addError('Already Existed');
}
}
}