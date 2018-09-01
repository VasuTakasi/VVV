public with sharing class no_of_weeks
{

    public integer weekCount{ get; set; }

    public date d_date_str { get; set; }
    
    public Integer currentWeekOfMonth( )
    {
    Date currentDate = d_date_str;
    Integer weekCount = 0;
    Integer startWeekResidue = 0;
    Integer endWeekResidue = 0;
    /*
           Calculating startWeekResidue
        */
        Date dt = currentDate.toStartOfMonth().addDays(-1);
    Date dtFirstWeekend = dt.toStartOfWeek().addDays(6);
    startWeekResidue = dt.daysBetween(dtFirstWeekend); 
    
        /*
            Calculating endWeekResidue
        */
        Date dtLastWeekend = currentDate.toStartOfWeek().addDays(-1);
    endWeekResidue = dtLastWeekend.daysBetween(currentDate);
    /*
            Counting the weeks
        */
        weekCount = (currentDate.day() - (startWeekResidue + endWeekResidue))/7;
    weekCount += (startWeekResidue > 0 ? 1:0)+(endWeekResidue > 0 ? 1:0);
    System.debug(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,'+weekCount);
    return weekCount;
}
}