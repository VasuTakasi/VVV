public with sharing class relatedcontacts {

public relatedcontacts(){
   AccountData();
 }
list<Account> lstacc = new list<Account>();
list<accountwrapclass> lstAccwrap = new list<accountwrapclass>();
    public list<accountwrapclass> getAccounts() {
   // lstacc=[select id,name,phone,website,taxable__c from Account];
        return lstAccwrap ;
    }
    public void AccountData(){
      
      for(Account acc:[select id,name,phone,website from Account]){
          accountwrapclass objacc = new accountwrapclass();
          objacc.Name = acc.Name;
          objacc.accid = acc.id;
          objacc.phone = acc.phone;
          objacc.website = acc.website;
          //if(acc.taxable__C == true){
           // objacc.taxable ='yes';
       //   }else{
            // objacc.taxable ='NO';
          //}
          lstAccwrap.add(objAcc);
      }
    
    
    }
  
 //wrapper class  
 public class accountwrapclass{
   public string accid{get;set;}
   public string Name{get;set;}
   public string Phone{get;set;}
   public string Website{get;set;}
   public string taxable{get;set;}
  
 } 
    

}