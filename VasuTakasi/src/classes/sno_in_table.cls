public with sharing class sno_in_table
{

    public list<wrap> getRecords()
    
     {
             integer sno=1;
            list<wrap>emps=new list<wrap>();
            list<employee__c>ee=[select name,phone__c from employee__c];
            
            for(employee__c em:ee)
            {
                   
             emps.add(new wrap(sno,em));
             sno++;
             
             }
               return emps;
        }
    


   

    public class wrap
    {
        public integer sno{get;set;}
        public employee__c emp{get;set;}
        
        public wrap(integer sn, employee__c e)
        {
            emp=e;
            sno=sn;
        }
                
    }
    
    public static testmethod void m1()
    {
        sno_in_table sno=new sno_in_table();
        sno.getrecords();
       
    employee__c emp = new employee__c();
    emp.name='vvv';
    emp.phone__c='09030182818';
    insert emp;
    integer no=2;
    sno_in_table.wrap cmp = new sno_in_table.wrap(no,emp);
 

    }
}