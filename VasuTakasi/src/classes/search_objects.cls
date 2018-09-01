public with sharing class search_objects
{
   List<Schema.SObjectType> gd{get;set;}
   //Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
 public List<SelectOption> getobjNames()
 {
    gd = Schema.getGlobalDescribe().Values();    
   List<SelectOption> options = new List<SelectOption>();
    
   for(Schema.SObjectType f : gd)
   {
      options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getName()));
   }
   return options;
  }
      
}