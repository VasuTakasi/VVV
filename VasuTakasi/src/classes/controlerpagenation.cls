public with sharing class controlerpagenation 
{


    

    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name,phone__c,country__c FROM employee__c Order By Name ]));
                // sets the number of records in each page set
                con.setPageSize(3);
            }
            return con;
        }
        set;
    }
    list<employee__c> emp=new list<employee__c>();

    public list<employee__c> getRecords()
    {
     emp.clear();
     for(employee__c ee:(List<employee__c>)con.getRecords())
      emp.add(ee);
        return emp;
    }

   public Boolean hasNext {
        get {
            return con.getHasNext();
        }
        set;
    }
 
    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
            return con.getHasPrevious();
        }
        set;
    }

 public void first() {
        con.first();
    }
 
    // returns the last page of records
    public void last() {
        con.last();
    }
 
    // returns the previous page of records
    public void previous() {
        con.previous();
    }
 
    // returns the next page of records
    public void next() {
        con.next();
    }
 
   
}