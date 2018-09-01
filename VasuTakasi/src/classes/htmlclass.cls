public with sharing class htmlclass {

    public PageReference save() {
       
       account acc=new account();
       acc.name=apexpages.currentpage().getparameters().get('txt1');
       acc.phone=apexpages.currentpage().getparameters().get('txt2');
      list<account>aa=new list<account>();
       //for(integer i=0;i<acc.size();i++)
      // {
        aa=[select id,name from account where name=:acc.name]; 
       delete aa;
      // }
        return null;
    }

}