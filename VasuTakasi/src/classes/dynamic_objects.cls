public with sharing class dynamic_objects
 {
      Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();

    public list<selectoption> getAllobjects() 
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();    
   List<SelectOption> options = new List<SelectOption>();
    
   for(Schema.SObjectType f : gd)
   {
      options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
   }
   return options;
    }

}