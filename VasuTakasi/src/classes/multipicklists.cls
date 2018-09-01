public class multipicklists 
{
 
    String option= null; 
    public list<SelectOption>options2=new list<SelectOption>();
    public List<SelectOption>getcon_fields()
    {
         List<SelectOption> options = new List<SelectOption>();
          options.add(new SelectOption('First Name','First Name'));
            options.add(new SelectOption('Last Name','Last Name'));
            options.add(new SelectOption('Phone','Phone'));
            options.add(new SelectOption('Email','Email'));
            return options;         
    }
     public void setselected_options(String option)
      {
       this.option= option; 
       }    
     public List<SelectOption>getSelected_options() {
        return null;
    }     
    }