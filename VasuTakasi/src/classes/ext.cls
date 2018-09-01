public with sharing class ext {

    public ext(ApexPages.StandardController con)
    {
                     
    }
    list<employee__c>emp=new list<employee__c>();
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name,phone__c,country__c FROM employee__c Order By Name ]));
                // sets the number of records in each page set
                con.setPageSize(10);
            }
            return con;
        }
        set;                         
    }
  public list<employee__c> getallemp()
  {
      for (employee__c employee : (List<employee__c>)con.getRecords())
            emp.add(employee);
             return emp;
  }
}