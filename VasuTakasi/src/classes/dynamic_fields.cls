public with sharing class dynamic_fields {

    public dynamic_fields(ApexPages.StandardController controller) {

    }


    public list<string> getFields() {
      
      map<String, Schema.SObjectType>  m1 = Schema.getGlobalDescribe() ;
        SObjectType objToken1 = m1.get('contact'); 
        DescribeSObjectResult objDef1= objToken1.getDescribe(); 
        map<String, SObjectField> fieldmap =  objDef1.fields.getmap();
        List<String> lstobjectfields1=  new List<String>();
        List<String> fieldLabels1=  new List<String>();
        map<String,String> fieldLabelNamemap1=   new map<String,String>();
       
        for (String fName1:fieldmap.keySet())
        {
        if(fieldmap.get(fName1).getDescribe().getType()!=Schema.DisplayType.Time &&
        fieldmap.get(fName1).getDescribe().getType()!=Schema.DisplayType.anytype&&
        fieldmap.get(fName1).getDescribe().getType()!=Schema.DisplayType.base64 &&
        fieldmap.get(fName1).getDescribe().getType()!=Schema.DisplayType.EncryptedString &&
        fieldmap.get(fName1).getDescribe().getType()!=Schema.DisplayType.Id &&
        fieldmap.get(fName1).getDescribe().getType()!=Schema.DisplayType.multiPicklist &&
        fieldmap.get(fName1).getDescribe().getType()!=Schema.DisplayType.Reference &&
        fieldmap.get(fName1).getDescribe().getType()!=Schema.DisplayType.TextArea)   
        {
        fieldLabels1.add(fieldmap.get(fName1).getDescribe().getLabel());
        fieldLabelNamemap1.put(fieldmap.get(fName1).getDescribe().getLabel(), fName1);
         }
       
        }
       
       
        for (String fLabel1:fieldLabels1){
        
        if(flabel1 !='Created Date'&& flabel1!='Last Activity Date' && flabel1!='Last modified Date' && flabel1!='Deleted' && flabel1!='System modstamp'&& flabel1!='')
        {
           //lstobjectfields.add(new selectOption(fieldLabelNamemap.get(flabel),fLabel));
           lstobjectfields1.add(fieldLabelNamemap1.get(flabel1));
        }
        }
        system.debug('#### All Fields are ####'+lstobjectfields1);
        
        
        return lstobjectfields1;
    }
    
    public static testmethod void mname()
    {
       contact c=new contact();
       c.lastname='qq';
       insert c;
       ApexPages.StandardController controller;
       dynamic_fields df=new dynamic_fields(controller);
       df.getFields();
    }

}