public class trigger_class
{
public static void empmethod(Employee__c[]emp)
{
for(Employee__c e:emp)
{
if(e.country__c==null)
{
e.country__C='india';
}
}
}
static testmethod void method()
{    
    Employee__c []emp=new list<Employee__c >();
    Employee__c ee=new Employee__c();
    ee.name='xxx';
    ee.phone__c='09030182818';
    emp.add(ee);
    insert emp;
   trigger_class.empmethod(emp);
}
}