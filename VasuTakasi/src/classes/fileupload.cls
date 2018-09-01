public with sharing class fileupload
{
   public Attachment UploadDoc{get;set;}
    Attachment[] atts;
 public list<Attachment> getatts()
 {
     atts=new Attachment[0];
        system.debug('###############'+UploadDoc);
          return atts;
 }
public fileupload()
{
     
}


 
}