public class picklist_onchange {

    public PageReference onchange()
    {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'You are selected --'+pick_value );
        apexpages.addmessage(myMsg);
        return null;
    }


    public String pick_value { get; set; }
}