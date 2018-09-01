public with sharing class opportunitys
{
  
    ApexPages.StandardController con;
    public opportunitys(ApexPages.StandardController controller)
    {
       con=controller;
    }
     
    public pagereference dosave()
    {
      
      con.save();
    return null;
    }
}