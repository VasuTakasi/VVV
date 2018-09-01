public with sharing class userepete
 {
public list<account>acc;
    public list<account> getRecords() {
      acc=[select name,(select name from contacts) from account where name='vvv' ];
        return acc;
    }

}