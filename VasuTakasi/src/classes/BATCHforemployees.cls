global class BATCHforemployees implements Database.batchable<sobject>
{
    global database.queryLocator start(database.batchableContext bc)
    {
        return database.getQuerylocator('select Id,name from employee__c ');
    }

    global void execute(database.batchablecontext bc,List<employee__c> lstcand)
    {
        for(integer i=0;i<lstcand.size();i++)
        {
            if(lstcand[i].name=='form schuduling')
            {
                lstcand[i].name='kevvv';
            }
        }
        update lstcand;
    }
    global void finish(database.batchablecontext bc)
    {
        system.debug('****** Records Update Successfully');
    }
}