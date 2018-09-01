public class city_place
{

   // public String attachments { get; set; }

    public boolean show_hide { get; set; }
    
    public String place { get; set; }

    public String city { get; set; }
    
     public list<Attachment>attachments{get;set;}
    
    map<string,History__c>history=new map<string,History__c>();

    public PageReference findplace()
    {
        try
        {
        if(city!='')
        {
                        
        for(History__c h:[select name,place__c from History__c])
        {
          history.put(h.name,h);
         }
         History__c h1=new History__c();
         h1=history.get(city);
         if(city==h1.name)
         {
          place=h1.place__c;
          attachments=new list<Attachment>();
          attachments=[select Id, ParentId, Name, Description from Attachment where parentId=:h1.id];
          show_hide=true;
          city='';
         }
         }
         }catch(exception e)
         {
            if(attachments.size()!=null)
            {
            attachments.clear();
          
            }
          place='check your city';
         }
        return null;
    }

}