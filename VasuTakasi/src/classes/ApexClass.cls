public with sharing class ApexClass
{
    public List<Account> AcList{get;set;}
    public Set<string> AccNameset{get;set;}
    List<Account> AcList2;
    public String AcName{get;set;}
    public ApexClass(){
           AccNameset=new Set<string>();
           
           AcList=[Select name,phone from Account];           
           
           for(Account A:AcList){
               
               if(A.phone!=Null){
                   
                   AccNameset.Add(A.Name);
                   
               }
           }
    }
    public static testmethod void m1()
    {
        account a=new account();
        a.name='pp';
        a.phone='09030182818';
        insert a;
        ApexClass obj=new ApexClass();
        
    }
}