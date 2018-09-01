public with sharing class wrapper2
{

   

    list<wrapper>wrapp{get;set;}
    list<employee__c>emp=new list<employee__c>();
    public class wrapper
    {
        public boolean ischecked{get;set;}
        public employee__c emps{get;set;}
        public wrapper()
        {
         emps=new employee__c();
        ischecked=false;
        }
        
        public wrapper(employee__c e)
        {
            emps=e;
       ischecked=false;
        }
    }
   
    public list<wrapper> getFilltable()
    {
        wrapp=new list<wrapper>();
        emp=[select id,name,phone__c from employee__c order by name ];
        for(employee__c ee:emp)
        {
        wrapp.add(new wrapper(ee));
        }
        return wrapp;
    }

}