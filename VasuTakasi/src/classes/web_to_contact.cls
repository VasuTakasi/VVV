public class web_to_contact {
    
    contact c=new contact();
    public PageReference convert()
     {
         c=new contact();
         c.lastname=apexpages.currentpage().getparameters().get('lastname');
          c.firstname=apexpages.currentpage().getparameters().get('firstname');
           c.phone=apexpages.currentpage().getparameters().get('phone');
            c.email=apexpages.currentpage().getparameters().get('email');
            insert c;
        return null;
    }

}