public class wrapperClassController {
   public string accid ;
   public wrapperClassController (){
     accid = apexpages.currentpage().getparameters().get('id');
     system.debug('***************Accid'+accid);
   
   }
    //Our collection of the class/wrapper objects cContact 
    public List<cContact> contactList {get; set;}

    //This method uses a simple SOQL query to return a List of Contacts
    public List<cContact> getContacts() {
        if(contactList == null) {
            contactList = new List<cContact>();
            for(Contact c : [select Id, Name, Email, Phone from Contact where AccountId=:accid]) {
                // As each contact is processed we create a new cContact object and add it to the contactList
                contactList.add(new cContact(c));
            }
        }
        return contactList;
    }


    public PageReference processSelected() {

                //We create a new list of Contacts that we be populated only with Contacts if they are selected
        List<Contact> selectedContacts = new List<Contact>();

        //We will cycle through our list of cContacts and will check to see if the selected property is set to true, if it is we add the Contact to the selectedContacts list
        for(cContact cCon : getContacts()) {
            if(cCon.selected == true) {
                selectedContacts.add(cCon.con);
            }
        }

        // Now we have our list of selected contacts and can perform any type of logic we want, sending emails, updating a field on the Contact, etc
        System.debug('These are the selected Contacts...');
        for(Contact con : selectedContacts) {
           string conEmail = con.Email;
           Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
// Strings to hold the email addresses to which you are sending the email.
            String[] toAddresses = new String[] {conEmail};
            //String[] ccAddresses = new String[] {'smith@gmail.com'};
// Assign the addresses for the To and CC lists to the mail object.
            mail.setToAddresses(toAddresses);
           // mail.setCcAddresses(ccAddresses);
// Specify the address used when the recipients reply to the email.
            mail.setReplyTo('support@acme.com');
// Specify the name used as the display name.
            mail.setSenderDisplayName('Salesforce Support');
// Specify the subject line for your email address.
            mail.setSubject('New Case Created : ' + case.Id);
// Set to True if you want to BCC yourself on the email.
            mail.setBccSender(false);
// Optionally append the salesforce.com email signature to the email.
// The email address of the user executing the Apex Code will be used.
            mail.setUseSignature(false);
// Specify the text content of the email.
mail.setPlainTextBody('Thank for Contacting');
mail.setHtmlBody('Thank for Contacting');
// Send the email you have created.
Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
           // system.debug(con);
        }
        return null;
    }


    // This is our wrapper/container class. A container class is a class, a data structure, or an abstract data type whose instances are collections of other objects. In this example a wrapper class contains both the standard salesforce object Contact and a Boolean value
    public class cContact {
        public Contact con {get; set;}
        public Boolean selected {get; set;}

        //This is the contructor method. When we create a new cContact object we pass a Contact that is set to the con property. We also set the selected value to false
        public cContact(Contact c) {
            con = c;
            selected = false;
        }
    }
}