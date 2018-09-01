public class pagemassage_style {

    public pagemassage_style(ApexPages.StandardSetController controller) {

    }
    public string name{get;set;}
      public void selected_name()
    {
             //name.fontstyle='bold';      
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.info, 'you selected <p style="color:red;font-size:16px;"> '+name+'</p>');
            Apexpages.addMessage(mymsg);
    }
}