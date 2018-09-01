public with sharing class classcampaign {
  list<campaign>camps;
  
    public String sUserId = Userinfo.getUserId();
    
    public string valuelist{get;set;}
    
    public classcampaign(ApexPages.StandardController controller) { }
    
    public string refresh{get;set;}
    
    public string listvalue{get;set;}
    
         public string cid{get;set;}
   public list<campaign> getcamptab()
   {
   if(listvalue==null)
   {
     camps=[select name,status,type,startdate from campaign];
   }
   else if(valuelist=='All Campaigns')
     {
    camps=[select name,status,type,startdate from campaign];
     }
     else if(listvalue=='All Active Campaigns')
     {
       camps=[select name,status,type,startdate from campaign where Isactive=true];
     }
      else if(listvalue=='My Active Campaigns')
     {
       camps=[select name,status,type,startdate from campaign where OwnerId=:sUserId and Isactive=true];
     }
      else if(listvalue=='InActive Campaigns')
     {
       camps=[select name,status,type,startdate from campaign where Isactive=false];
     }
     else if(listvalue=='Recently Modified')
     {
     camps=[select name,status,type,startdate from campaign where LastModifiedDate=LAST_N_DAYS:1];
     }             
   return camps;
   }
   public list<campaign> getrecentlymodified()
   {
     camps=[select name,status,type,startdate from campaign where LastModifiedDate=LAST_N_DAYS:30];
     return camps;
   }
   public pagereference passid()
   {
   pagereference ref=new pagereference('/apex/campaigndetailpage?id='+cid);
   ref.setredirect(true);
  return ref;
   }
   public pagereference populate()
   {
    
    
          return null;
    
   }
   
}