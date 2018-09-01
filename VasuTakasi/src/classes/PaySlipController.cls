public class PaySlipController 
{
    public integer noOfDays{get;set;}
    public string monthName{get;set;}
    map<integer,string> mapMonth = new map<integer,string>{ 1=> 'January', 2 => 'February', 3=> 'March', 4=>'April', 5=>'May', 6=>'June', 7=>'July',
                                        8=>'August', 9=>'September', 10=>'October', 11=>'November', 12=>'December' };
    
    public PaySlipController()
    {
        noOfDays = date.daysInMonth(system.Today().year(), system.Today().month());
        string month = ApexPages.CurrentPage().getParameters().get('month');
        monthName = mapMonth.get(system.Today().month());
        
        if( string.isNotBlank(month) )
        {
           noOfDays = date.daysInMonth(system.Today().year(), Integer.valueOf(month)); 
           monthName = mapMonth.get(Integer.valueOf(month));
        }
        
        
    }
}