public with sharing class sals
{

    public integer total { get; set; }
    
    public double avrg { get; set; }
    
    double avg;
    double basic;
    public sals()
    {
      list<Salary__c> sal=[select id,name,Basic__c from salary__c];
       avg=0;
      total=0;
          
        for(salary__c ss:sal)
        {
         total=total+1;
         avg=avg+ss.Basic__c;
        }
        avrg=avg/total;
        }
        
}