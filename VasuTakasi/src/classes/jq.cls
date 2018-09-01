public with sharing class jq {

    public PageReference details()
     {
        accs=new list<contact>();
        accs=[select id,name,phone from contact where accountid=:aid];
        system.debug('@@@@@@@@@@@@@@@@'+aid);
        return null;
    }

    public jq(ApexPages.StandardSetController controller)
   {
       
   }
  public list<contact>accs{get;set;}
    public string aid {get;set;}
   
}