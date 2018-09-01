public with sharing class radio 
{

    public PageReference find()
     {
        system.debug('------------------------------------------'+selected_id );
        return null;
    }


    public String selected_id { get; set; }
    job_application__c[] list_job_apps;
    List<SelectOption> options;
    public job_application__c[]getJob_apps() 
    {
        list_job_apps=new list<job_application__c>();
        list_job_apps=[select name,Position__c from job_application__c];
        return list_job_apps;
    }
    public List<SelectOption> getRadios() {
             options = new List<SelectOption>();
            for(job_application__c j:list_job_apps)
            {
            options.add(new SelectOption(j.name,j.name));
            //options.add(new SelectOption('CANADA','Canada'));
            //options.add(new SelectOption('MEXICO','Mexico'));
            }
            return options;
        }
}