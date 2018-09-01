public with sharing class ovveride_savefunctionality
{
     public apexpages.standardcontroller con;
    public ovveride_savefunctionality(ApexPages.StandardController controller)
    {
        con=controller;
    }
    public pagereference dosave()
    {
        con.save();
       pagereference ref=new pagereference('/apex/override_save_functionality');
    ref.setredirect(true);
    return ref;
    }
}