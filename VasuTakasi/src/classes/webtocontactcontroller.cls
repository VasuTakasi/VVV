public with sharing class webtocontactcontroller {
 

    ApexPages.StandardController con;
    public webtocontactcontroller(ApexPages.StandardController controller) {
        con=controller;
    }
   
    public pagereference dosave(){
    con.save();
    pagereference ref=new pagereference('/apex/webtocontacts');
    ref.setredirect(true);
    return ref;
    }
 public pagereference docancel(){
    con.cancel();
    pagereference ref=new pagereference('/apex/webtocontacts');
    ref.setredirect(true);
    return ref;
    }
    
    //-----------TestMethod-----------//
    public static testmethod void test()
    {
   
        contact c=new contact(lastname='sfdc');    
        insert c;
        ApexPages.StandardController sc = new ApexPages.standardController(c);    
    webtocontactcontroller obj=new webtocontactcontroller(sc);
    obj.dosave();
    obj.docancel();
    }
    
    
    
    

}