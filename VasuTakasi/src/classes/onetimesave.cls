public class onetimesave
{

    public PageReference saverecord()
    {
        btn_label='saving.....';
         // isdisabled=true;     
        insert std;
        
        btn_label='save';
        std=new student__c();
         //isdisabled=FALSE;  
        return null;
    }

    public student__c std{get;set;}
    public string btn_label{get;set;}
    public boolean isdisabled{get;set;}
    
    public onetimesave()
    {
        std=new student__c();
        btn_label='save';
    }
    
}