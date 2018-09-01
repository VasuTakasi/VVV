public with sharing class SendEmailAttachment {
    
    public List<Task> ConList{get;set;}
    public Opportunity Conid1 {get;set;}
    public Opportunity Conid2 {get;set;}
    public Opportunity Conid3 {get;set;}
    public Opportunity Conid4 {get;set;}
    public Opportunity Conid5 {get;set;}
    
    public employee__c InvRec{get;set;}
    public String EmailAdd{get;set;}
    public string Emailids{get;set;}
    public Blob B{get;set;}
    public Attachment UploadDoc{get;set;}
    public Attachment UploadDoc1{get;set;}
    public Attachment UploadDoc2{get;set;}
    public Attachment UploadDoc3{get;set;}
    public Attachment UploadDoc4{get;set;}
    
    Attachment UploadAtt2=new Attachment();
    public Attachment UploadAtt{get;set;}
    public List<Attachment> UploadAttList{get;set;}
    public string TotString{get;set;}
    public List<Task> TaskList{get;set;}
    
    public String opId;
    
    public string FIStatus{get;set;}
    
    public SendEmailAttachment(ApexPages.StandardController controller) {
        try{
        TaskList=new List<Task>();
        
        Conid1=new Opportunity();
        Conid2=new Opportunity();
        Conid3=new Opportunity();
        Conid4=new Opportunity();
        Conid5=new Opportunity();
     
        UploadAttList=new List<Attachment>();
        UploadAtt=new Attachment();
        UploadDoc=new Attachment();
        UploadDoc1=new Attachment();
        UploadDoc2=new Attachment();
        UploadDoc3=new Attachment();
        UploadDoc4=new Attachment();
        
        isTest=true;
        ConList=new List<Task>();       
        opId = ApexPages.currentPage().getParameters().get('Oppid');
        String s=ApexPages.currentPage().getParameters().get('Oppid');
        if(s <> null ){
        InvRec=[Select Name from employee__c Limit 1];
        }
        Task Con=new Task();        
        ConList.add(Con); 
        }catch(exception e){            
            FIStatus='No PI Records Found';
        }
    }    
       
    public Attachment getMyAttachment(){
        return UploadAtt2;
    }
    
    public void addcon(){
        Task Con=new Task();        
        ConList.add(Con);
    }
    public Boolean isTest{ get; set; }
    string[] ccaddress;
    public pagereference Send(){ 
    pagereference P;
    try{
     
     List<Messaging.EmailFileAttachment> fileAttachments = new List<Messaging.EmailFileAttachment>();
     string opid=ApexPages.currentPage().getParameters().get('Oppid');
     List<Attachment> objAttachments=new List<Attachment>();  
        if(UploadDoc.Name!=null && UploadDoc.Name!='')     {
            UploadDoc.parentid=opid;
            insert UploadDoc;
            objAttachments.add(UploadDoc);
        }
        if(UploadDoc2.Name!=null && UploadDoc2.Name!='')     {
            UploadDoc2.parentid=opid;
            insert UploadDoc2;
            objAttachments.add(UploadDoc2);
        }
        if(UploadDoc3.Name!=null && UploadDoc3.Name!='')     {
            UploadDoc3.parentid=opid;
            insert UploadDoc3;
            objAttachments.add(UploadDoc3);
        }
        
        
        
        if(UploadDoc4.Name!=null && UploadDoc4.Name!='')     {
            UploadDoc4.parentid=opid;
            insert UploadDoc4;
            objAttachments.add(UploadDoc4);            
        }
        set<id> SetId=new Set<id>();
     
        
        if(Conid1.name==null){
            SetId.add(Conid1.name);            
        }
        if(Conid2.name!=null){SetId.add(Conid2.name);}        
        if(Conid3.name!=null){SetId.add(Conid3.name);}        
        if(Conid4.name!=null){SetId.add(Conid4.name);}        
        List<Contact> CL=[select id, email from Contact where id In :SetId];
        
        system.debug('_______________________________________Set SIze_______________________'+SetId.size());              
        system.debug('_______________________________________Con SIze_______________________'+CL.size());
                
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       List<String> toAddresses = new List<String>();
       // String[] emailid = new String[]{};
        integer i=0;
        System.debug('CL at 112--'+CL);
        
        for(Contact C:CL){
            system.debug('______________________________________________________________'+C.Email);
            if(C.Email!=null && C.Email!=''){
                toAddresses.add(C.Email);

         //           emailid[i++]=C.Email;
        
            }
        }
        
        //toAddresses.add('cneelam@bodhtree.com');
       String[] toAddresses2 = new String[toAddresses.size()] ; 
       System.debug('toAddresses at 126--'+toAddresses.size());
//        toAddresses2.addAll(toAddresses); 
       mail.setToAddresses(toAddresses);//.size()>0) ? toAddresses2 : new String[]{'cneelam@bodhtree.com'});
       System.debug('mail.setToAddresses at 125--'+ 'toAddresses2 size() '+toAddresses2.size()+'  '+((toAddresses2.size()>0) ? toAddresses2 : new String[]{'cneelam@bodhtree.com'}));
       string D='01/22/2012'; //Invrec.CreatedDate;
      // mail.sethtmlbody('<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td height="25" style="font-family:Arial, Helvetica, sans-serif;font-size:12px;"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"><tr><td align="center" colspan="2" valign="middle" style="text-transform:uppercase;text-decoration:underline;font-weight:bold;font-size:18px;font-family:Arial, Helvetica, sans-serif;"></td></tr><tr><td align="right" valign="middle"> </td></tr><tr><td align="right" valign="middle"> </td></tr><tr><td align="right" valign="middle"> </td></tr></table></td></tr><tr><td height="50" style="font-family:Arial, Helvetica, sans-serif;font-size:13px;">Dear Sir/Madam,</td></tr><tr><td height="50" style="font-family:Arial, Helvetica, sans-serif;font-size:13px;">Please find enclosed soft copy of invoice. The hard copy of same will reach you in 5-6 working days.</td></tr><tr><td height="50" style="font-family:Arial, Helvetica, sans-serif;font-size:13px;">In case of further assistance please let us know.</td></tr><tr><td height="10" style="font-family:Arial, Helvetica, sans-serif;font-size:13px;"></td></tr><tr><td height="20" style="font-family:Arial, Helvetica, sans-serif;font-size:11px;"><table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td height="25" align="left" valign="middle"  style="font-family:Arial, Helvetica, sans-serif;">Regards,</td></tr><tr><td height="20" align="left" valign="middle" style="color:#000000;font-weight:bold;font-size:18px;font-family:Arial, Helvetica, sans-serif;">Online Support Helpdesk</td></tr><tr><td height="20" align="left" valign="middle" style="color:#4F81BD;font-weight:bold;font-size:12px;font-family:Arial, Helvetica, sans-serif;">Global Information Systems Technology Pvt. Ltd (GIST)</td></tr><tr><td height="20" align="left" valign="middle" style="font-family:Arial, Helvetica, sans-serif;font-size:11px;" >877 Udyog Vihar,  Phase V</td></tr><tr><td height="20" align="left" valign="middle" style="font-family:Arial, Helvetica, sans-serif;font-size:11px;">Gurgaon – 122016</td></tr><tr><td height="20" align="left" valign="middle" style="font-family:Arial, Helvetica, sans-serif;font-size:11px;">Direct -     91-(124)-4614045, 91-(124)-4614034, 91-(124)-4614029, 91-(124)-4614028</td></tr><tr><td height="20" align="left" valign="middle" style="font-family:Arial, Helvetica, sans-serif;font-size:11px;">Board –    91-(124)-4614000 (Ext 245, 229, 234, 228)</td></tr><tr><td height="25" align="left" valign="middle" style="font-family:Arial, Helvetica, sans-serif;"><a href="mailto:onlinesupport@gist.in"> onlinesupport@gist.in</a></td></tr><tr><td height="25" align="left" valign="middle" style="font-family:Arial, Helvetica, sans-serif;"><a href="http://www.gist.in/">http://www.gist.in/</a></td></tr></table></td></tr><tr><td height="50" style="font-family:Arial, Helvetica, sans-serif;font-size:13px;></td></tr><tr><td align="center" valign="middle" height="35"  style="border-top:1px solid #000000;font-family:Arial, Helvetica, sans-serif;font-size:12px;"><b>Registered Office :</b> F-14, Hauz Khas, New Delhi - 110016 (India) <b>Offices :</b> Gurgaon, Mumbai, Bangalore, Kolkata</td></tr></table>');
       //mail.sethtmlbody(PTB);
       mail.setReplyTo('cneelam@bodhtree.com');
       mail.setSenderDisplayName('Bodhtree');
       //mail.setSubject('GIST @ Salesforce');
       mail.setSubject('Subject:- Invoice No.:'+Invrec.Name+', Dated:'+D+' for '+Invrec.phone__c);
       
       List<String> EMSTR=new List<String>();
           system.debug('+++++++++++++++++++++Test Email ids+++++++++++++++++++++++++++++++++++++'+Emailids);   
       if(Emailids.length()>3){
           system.debug('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'+Emailids);
           for(String EM:Emailids.split(',')){EMSTR.add(EM);}        
           mail.setCcAddresses(EMSTR);
       }
       
       Messaging.EmailFileAttachment efas = new Messaging.EmailFileAttachment();
       PageReference pdf =  Page.INVOICE;
       pdf.getParameters().put('id',InvRec.id); 
       pdf.setRedirect(true);    
       if(isTest){   
         efas.setFileName(InvRec.Name+'.pdf');        
         Blob bb = pdf.getContentaspdf();
         efas.setBody(bb);
         fileAttachments.add(efas);
       }
       //mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efas});
       for(Attachment obj : objAttachments){
           Messaging.EmailFileAttachment efs= new Messaging.EmailFileAttachment();
           efs.setFileName(obj.Name);        
           Blob bsb = obj.body;
           efs.setBody(bsb);       
           fileAttachments.add(efs);
       }
       mail.setFileAttachments(fileAttachments);
       //mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efs});
       // system.debug('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'+emailid);
      
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
       string url='/'+ApexPages.currentPage().getParameters().get('Oppid');
       P=new pagereference(url);
       
       Opportunity o;// = [select Invoice_status__c from Opportunity where Id=:opId];
       o.name = 'Sent';
       update o;
       
       return P;
      }catch(exception e){
          system.debug('================================='+e);
          ApexPages.addMessages(e);
          return P;
      }
      return P;
    }

}