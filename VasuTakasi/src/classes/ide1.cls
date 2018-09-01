public with sharing class ide1
{
account a=new account();
public void getrecords()
{
a=[select id,name from account limit 1];
}
}