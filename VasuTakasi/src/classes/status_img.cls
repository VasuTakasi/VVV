public with sharing class status_img {

    public status_img(ApexPages.StandardController controller) {
alist=[select name,phone from account limit 1];
    }
 list<account>alist=new list<account>();

    
public void find()
{
   for(integer i=0;i<440588560;i++)
   {
    i++;
   }
  
   alist=[select name,phone from account limit 1];
    }
    public list<account> getFinAccts()
    {
     return alist;
    }
   }