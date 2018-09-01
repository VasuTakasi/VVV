public with sharing class dynamic_picklist {

    public list<selectoption> getPicklistvalue() {
       set<String> setobj = new set<string>();
          List<SelectOption> options = new List<SelectOption>();
          Schema.DescribeFieldResult ccity  = Schema.sObjectType.employee__c.fields.country__c.getSObjectField().getDescribe();
          options.add(new selectoption('--None--','--None--'));
          for(PicklistEntry ent:ccity.getpicklistvalues())
          { 
               options .add(new SelectOption(ent.getValue(), ent.getLabel())); 
               setobj.add(ent.getvalue());
           }
           
            return options;
    }

}