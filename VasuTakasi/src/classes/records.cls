public with sharing class records {

    public String name { get; set; }

    public String selobj { get; set; }
    public list<account>org_list1{get;set;}
    public list<contact>org_list2{get;set;}
   
    public PageReference object_results()  
    {    
         org_list1=new list<account>();
         org_list2=new list<contact>();
      if(selobj=='org1')
        {
        org_list1=new list<account>();
        org_list1=[select name from account];
        }
       else  
        {
        org_list2=new list<contact>();
        org_list2=[select lastname  from contact];
        }
        
        
         
     
        return null;
        }
    }