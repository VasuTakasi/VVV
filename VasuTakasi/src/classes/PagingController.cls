public with sharing class PagingController
{

    public PageReference getrecords() {
        pagesize=integer.valueof(psize);
        PagingController obj=new PagingController();
        ss='TRUE';
        return null;
    }

    public list<selectoption>sizes {get;set;}
    integer pagesize;
    public string psize{get;set;}
    string ss;
    public PagingController(){
        sizes=new selectoption[]{};
        sizes.add(new selectoption('10','10')) ;
         sizes.add(new selectoption('20','20')) ;
         ss='true';
    }
    List<empWrapper> employees {get;set;}
 
    // instantiate the StandardSetController from a query locator
    public ApexPages.StandardSetController con {
        get {
            if(con == null) {
                con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name,phone__c,country__c FROM employee__c Order By Name ]));
                // sets the number of records in each page set
                if(pagesize==null)
                con.setPageSize(100);
                else
                 con.setPageSize(pagesize);
            }
            else{
              if(ss=='true'){
                 con = new ApexPages.StandardSetController(Database.getQueryLocator([Select Id, Name,phone__c,country__c FROM employee__c Order By Name ]));
                // sets the number of records in each page set
                if(pagesize==null)
                con.setPageSize(100);
                else
                 con.setPageSize(pagesize);
                 }
            }
            return con;
        }
        set;                         
    }
 
    // returns a list of wrapper objects for the sObjects in the current page set
    public List<empWrapper> getemployees()
     {
        employees = new List<empWrapper>();
        for (employee__c employee : (List<employee__c>)con.getRecords())
            employees.add(new empWrapper(employee));
 
        return employees;
    }
 
    // displays the selected items
    public pagereference process()
     {
        ApexPages.Message myMsg ;
        for (empWrapper cw : employees)
        {
            if (cw.checked)
            {
                //ApexPages.addMessage.clear();
           // ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,cw.emp.name+' , '+cw.emp.phone__c));
            myMsg = new ApexPages.message(ApexPages.Severity.INFO,cw.emp.name);
            Apexpages.addMessage(mymsg);
            }
                  }
                  if(myMsg==null)
                  {
                       myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'No Items selected');
                        Apexpages.addMessage(mymsg);
                  }
       return null;
    
 }
    // indicates whether there are more records after the current page set.
    public Boolean hasNext
    {
        get
         {
              ss='false';
            return con.getHasNext();
        }
        set;
    }
 
    // indicates whether there are more records before the current page set.
    public Boolean hasPrevious {
        get {
         ss='false';
            return con.getHasPrevious();
        }
        set;
    }
 
    // returns the page number of the current page set
    public Integer pageNumber {
        get {
         ss='false';
            return con.getPageNumber();
        }
        set;
    }
 
    // returns the first page of records
    public void first() {
     ss='false';
        con.first();
    }
 
    // returns the last page of records
    public void last() {
     ss='false';
        con.last();
    }
 
    // returns the previous page of records
    public void previous() {
     ss='false';
        con.previous();
    }
 
    // returns the next page of records
    public void next() {
     ss='false';
        con.next();
    }
 
    // returns the PageReference of the original page, if known, or the home page.
    public void cancel() {
     ss='false';
        con.cancel();
    }
    public class empWrapper
     {
 
    public Boolean checked{ get; set; }
    public employee__c emp { get; set;}
 
    public empWrapper()
    {
        emp = new employee__c();
        checked = false;
    }
 
   public empWrapper(employee__c e)
   {
        emp = e;
        checked = false;
    }
 
  
    }
 
}