//-Dhttps.protocols=TLSv1.1,TLSv1.2
public class CSSIncidentsWorkedOnReportController
{
    public string strJSON {get;set;}
    public boolean status{get;set;}{status = true;}
    public string importType{get;set;}
    public Report[] Report;
    map<string,Report> mapOutbound = new map<string,Report>(); 
    public map<string,Report> mapInbound{get;set;}{ mapInbound = new map<string,Report>();}
    public string defectFilter{get;set;}
    
    public map<string, map<string,integer>> mapSeverity{get;set;} 
    
    public CSSIncidentsWorkedOnReportController()  
    {
        initialization();
    }
    
    public void initialization()
    {
    	mapInbound.clear();
    	mapOutbound.clear();
    	mapSeverity = new map<string, map<string,integer>>();
        map<string,integer> mapTemp = new map<string,integer>{ 
        									'Critical' => 0,
        									'High' => 0,
        									'Medium' => 0,
        									'Low' => 0,
        									'Total' => 0
        								 };
         
         mapSeverity = new map<string, map<string,integer>>{
					         	'New' => mapTemp.clone(),
					         	'OpenAndOther' => mapTemp.clone(),
					         	'Closed' => mapTemp.clone(),
					         	'Rejected' => mapTemp.clone(),
					         	'MDMorODS' => mapTemp.clone(),
					         	'InProgress' => mapTemp.clone(),
					         	'Other' => mapTemp.clone()
					         };
    }
    
    public void uploadReportOne()
    {
        try{
            if( string.isNotBlank(strJSON) )
            {
                Report = ((CSSIncidentsWorkedOnReportController)System.JSON.deserialize(strJSON, CSSIncidentsWorkedOnReportController.class)).Report;
                if( importType == 'inbound' )
                {
                	initialization();
                    defectFilter = '';
                    
                    map<string,integer> mapNew = mapSeverity.get('New');
                    map<string,integer> mapOther = mapSeverity.get('OpenAndOther');
                    
                    for( Report obj: Report ){
                        mapInbound.put(obj.DefectId,obj);
                        
                        if( obj.Status == 'New' )
                        {
                        	mapNew.put(obj.Severity, mapNew.get( obj.Severity )+1 );
                        	mapNew.put( 'Total', mapNew.get( 'Total' )+1 ) ;
                        }
                        else
                        {
                        	 mapOther.put(obj.Severity, mapOther.get( obj.Severity )+1 );
                        	 mapOther.put( 'Total', mapOther.get( 'Total' )+1 ) ;
                        }
                        
                        mapSeverity.put( 'New', mapNew );
                        mapSeverity.put( 'OpenAndOther', mapOther );
                        
                        defectFilter += obj.DefectId+' OR ';
                    }
                    defectFilter = defectFilter.substring( 0,defectFilter.length()-4 );
                }
                else if( importType == 'outbound' )
                {
                    for( Report obj: Report )
                    {
                        mapoutbound.put(obj.DefectId,obj);
                     	if( obj.Status == 'Closed' )
                     	{
                     		map<string,integer> mapTemp = mapSeverity.get('Closed');
                     		mapTemp.put(obj.Severity, mapTemp.get( obj.Severity )+1 );
                     		mapSeverity.put( 'Closed', mapTemp );
                     		mapTemp.put( 'Total', mapTemp.get( 'Total' )+1 ) ;
                     	}   
                     	else if( obj.Status == 'Rejected' )
                     	{
                     		map<string,integer> mapTemp = mapSeverity.get('Rejected');
                     		mapTemp.put(obj.Severity, mapTemp.get( obj.Severity )+1 );
                     		mapSeverity.put( 'Rejected', mapTemp );
                     		mapTemp.put( 'Total', mapTemp.get( 'Total' )+1 ) ;
                     	}   
                     	else if( obj.Application == 'MDM' || obj.Application == 'Data Staging' )
                     	{
                     		map<string,integer> mapTemp = mapSeverity.get('MDMorODS');
                     		mapTemp.put(obj.Severity, mapTemp.get( obj.Severity )+1 );
                     		mapSeverity.put( 'RejMDMorODSected', mapTemp );
                     		mapTemp.put( 'Total', mapTemp.get( 'Total' )+1 ) ;
                     	}   
                     	else if( obj.Application == 'CSS' )
                     	{
                     		map<string,integer> mapTemp = mapSeverity.get('InProgress');
                     		mapTemp.put(obj.Severity, mapTemp.get( obj.Severity )+1 );
                     		mapSeverity.put( 'InProgress', mapTemp );
                     		mapTemp.put( 'Total', mapTemp.get( 'Total' )+1 ) ;
                     	}   
                     	else
                     	{
                     		map<string,integer> mapTemp = mapSeverity.get('Other');
                     		mapTemp.put(obj.Severity, mapTemp.get( obj.Severity )+1 );
                     		mapSeverity.put( 'Other', mapTemp );
                     		mapTemp.put( 'Total', mapTemp.get( 'Total' )+1 ) ;
                     	}  
                    }
                }
            }
        }
        catch(exception e)
        {
            ApexPages.addMessages(e);
        }
    }
    
    public PageReference generateReport()
    {
        for( Report inBound:mapInbound.values() )
        {
            if( mapOutbound.containsKey(inBound.DefectId) )
            {
                Report outBound = mapOutbound.get(inBound.DefectId);
                inBound.Application = outBound.Application;
                inBound.ResolutionComments = extractLastComment(outBound.ResolutionComments);
                inBound.CurrentStatus = outBound.Status;
                inBound.SubApplication = outBound.SubApplication;
            }
        }
        return Page.CSSIncidentsWorkedOnReportFinal;
    }
    
    public string extractLastComment( string comment )
    {
        if( string.isNotBlank(comment) )
        {
            comment = comment.substringAfterLast('________________________________________').substringAfter(':');
            return comment;
        }
        return '';
    }
    
    public PageReference generateSummaryReport()
    {
    	return page.CSSIncidentsSummaryReport;
    }
    
    public class Report {
		public String DefectId {get;set;}
		public String ReportedDate {get;set;}
		public String Severity {get;set;}
		public String Status {get;set;}
		public String Summary {get;set;}
		public String Application {get;set;}
		public String CurrentStatus {get;set;}
		public String SubApplication {get;set;}
		public String ResolutionComments {get;set;}
	}
}