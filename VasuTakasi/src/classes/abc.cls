public with sharing class abc 
{
public list<account> acc;
public abc()
{
acc=[select id,name,accountnumber from account limit 20];
}
public list<account> getaccount()
{
return acc;
}
public static testmethod void m1()
    {
     abc obj=new abc();
     obj.getaccount();
    }
}