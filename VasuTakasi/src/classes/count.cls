public with sharing class count
 {
public integer cnt;
public count()
{
cnt=[select count() from account where name='vasavi'];
}
 public integer getcnt()
 {
 return cnt;
 }
}