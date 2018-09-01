public class dynamic_retrieve 
{
    public List<SelectOption> getPick_Vals()
{
  List<SelectOption> options = new List<SelectOption>();
        
   Schema.DescribeFieldResult fieldResult = account.industry.getDescribe();
   List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
   for( Schema.PicklistEntry f : ple)
   {
      options.add(new SelectOption(f.getLabel(), f.getValue()));
   }       
   return options;
}
}