global class email_ProcessJobApplicantEmail implements Messaging.InboundEmailHandler {
 
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {
 
    Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
 
    Contact contact = new Contact();
    contact.FirstName = email.fromname.substring(0,email.fromname.indexOf(' '));
    contact.LastName = email.fromname.substring(email.fromname.indexOf(' '));
    contact.Email = envelope.fromAddress;
    contact.title= email.subject;
    contact.description=email.plainTextBody;
    contact.AssistantName=email.fromname;
    insert contact;
 
    System.debug('====> Created contact '+contact.Id);
 
    if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
      for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
        Attachment attachment = new Attachment();
        // attach to the newly created contact record
        attachment.ParentId = contact.Id;
        attachment.Name = email.binaryAttachments[i].filename;
        attachment.Body = email.binaryAttachments[i].body;
        insert attachment;
      }
    }
 
    return result;
 
  }
  static testMethod void testMe() {
 
  // create a new email and envelope object
  Messaging.InboundEmail email = new Messaging.InboundEmail() ;
  Messaging.InboundEnvelope env = new Messaging.InboundEnvelope();
 
  // setup the data for the email
  email.subject = 'Test Job Applicant';
  email.fromname = 'FirstName LastName';
  env.fromAddress = 'someaddress@email.com';
 
  // add an attachment
  Messaging.InboundEmail.BinaryAttachment attachment = new Messaging.InboundEmail.BinaryAttachment();
  attachment.body = blob.valueOf('my attachment text');
  attachment.fileName = 'textfile.txt';
  attachment.mimeTypeSubType = 'text/plain';
 
  email.binaryAttachments =
    new Messaging.inboundEmail.BinaryAttachment[] { attachment };
 
  // call the email service class and test it with the data in the testMethod
  email_ProcessJobApplicantEmail emailProcess = new email_ProcessJobApplicantEmail();
  emailProcess.handleInboundEmail(email, env);
 
  // query for the contact the email service created
  Contact contact = [select id, firstName, lastName, email from contact
    where firstName = 'FirstName' and lastName = 'LastName'];
 
  System.assertEquals(contact.firstName,'FirstName');
  System.assertEquals(contact.lastName,'LastName');
  System.assertEquals(contact.email,'someaddress@email.com');
 
  // find the attachment
  Attachment a = [select name from attachment where parentId = :contact.id];
 
  System.assertEquals(a.name,'textfile.txt');
 
}
 
}