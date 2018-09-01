public with sharing class ovverridesave {
   ApexPages.StandardController con;
    public ovverridesave(ApexPages.StandardController controller) {
con=controller;
    }
public pagereference saverecord()
{
con.save();
//pagereference ref=new pagereference('/apex/ovverridesave');
//ref.setredirect(true);
return null;
}
}