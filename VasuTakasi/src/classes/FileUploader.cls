public class FileUploader 
{
    public string nameFile{get;set;}
    public Blob contentFile{get;set;}
    String[] filelines = new String[]{};
    List<Account> accstoupload;
    
    public Pagereference ReadFile()
    {
        nameFile=contentFile.toString();
        filelines = nameFile.split('\n');
        accstoupload = new List<Account>();
        for (Integer i=1;i<filelines.size();i++)
        {
            String[] inputvalues = new String[]{};
            inputvalues = filelines[i].split(',');
            
            Account a = new Account();
            a.Name = inputvalues[0];
            a.phone=inputvalues[1];
            accstoupload.add(a);
        }
        try{
        insert accstoupload;
        }
        catch (Exception e)
        {
            ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured. Please check the template or try again later');
            ApexPages.addMessage(errormsg);
        }    
        return null;
    }
    
    public List<Account> getuploadedAccounts()
    {
        if (accstoupload!= NULL)
            if (accstoupload.size() > 0)
                return accstoupload;
            else
                return null;                    
        else
            return null;
    }            
}