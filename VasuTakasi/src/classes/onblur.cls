public class onblur {
    public onblur()
    {
        acc=new account();
    }
    public PageReference saveacc()
    {
        insert acc;
        acc=new account();
        return null;
    }


    public account acc { get; set; }
}