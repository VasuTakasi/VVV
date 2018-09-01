public with sharing class copyacctocont {

    public copyacctocont(ApexPages.StandardController controller) {
   cont =(contact)controller.getRecord();
    }
    public contact cont{get;set;}
    
    public pagereference copyfields()
    {
      Account objAcc =[select Id,name,Billingcity,Billingcountry,billingstate,billingpostalcode from Account where Id =:cont.AccountId ];
        cont.Mailingcity=objAcc.billingcity;
        cont.mailingcountry = objAcc.billingcountry;
        cont.mailingpostalcode = objAcc.billingpostalcode;
        cont.mailingstate = objAcc.billingstate;
        return null;
    }

}