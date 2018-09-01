public class actionfunction2 {

    public PageReference doaction()
     {
         ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO, 'You are selected: '+selected_value );
            apexpages.addmessage(myMsg);
        return null;
    }

    
    public String selected_value { get; set; }
}