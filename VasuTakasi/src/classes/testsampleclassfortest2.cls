public class testsampleclassfortest2
{
  integer c,a=10,b=20;
    public void mul()
    { 
        c=a*b;
        system.debug('mul is.....'+c);
    }
    public void div()
    {
        c=b/a;
        system.debug('div is...'+c);
    }
    
    public static testmethod void ttmeth()
    {
        testsampleclassfortest2 samp=new testsampleclassfortest2();
        samp.mul();
    }
}