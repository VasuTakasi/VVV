global class batchtestabc implements Database.batchable<sobject>
{
    global database.queryLocator start(database.batchableContext bc)
    {
        return database.getQuerylocator('select Id,name from account ');
    }

    global void execute(database.batchablecontext bc,List<account> lstTrigger)
    {
       for(Integer i=0;i<lstTrigger.size();i++)
       {
       //     if(lstTrigger[i].name=='ibm')
         //   {
                lstTrigger[i].name='takasi';
           // }
        }
        update lstTrigger;
    }
    global void finish(database.batchablecontext bc)
    {
        system.debug('****** Records Update Successfully');
    }
}