//Created by Vasu on :6-3-12.
//To understand the testclass code coverage.

public class classfortestclass{

    public Lead OptyRec{get;set;}
    public classfortestclass(){
        OptyRec=new Lead();
    }
    public List<Lead> getgettestclassmethod(){

        List<Lead> LL=[Select status,Name from Lead where status='Working - Contacted'];
        return LL;
    }
    
    public static testmethod void TestClassName(){

         
         
        classfortestclass Classvar = new classfortestclass();           
        
        
        Account NewAccount=new Account();
         NewAccount.Name='TestAccount';
         Insert NewAccount;
         //Classvar.gettestclassmethod();
    }
}