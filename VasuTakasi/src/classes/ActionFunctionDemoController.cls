public with sharing class ActionFunctionDemoController {
 
  public employee__c cat {get;set;}
  public String message {get;set;}
 
  public ActionFunctionDemoController() {
    cat = new employee__c();
    message = 'Try again!!'; // initial message.
  }
 
  public PageReference save() { 
    try {
      insert cat;
      message = 'Insert successful! -- ' ;
    } catch (Exception e) {
      ApexPages.addMessages(e);
      message = 'Whoops! An error occurred -- ' + e.getMessage();      
    }
    return null;
  }
 
}