@RestResource(urlMapping='/vvv/*')
global class RestAPIController {
  @HttpPost 
  global static String createNewCase() {
     System.debug('COMPANY: ');
     System.debug('CASE TYPE: ');
     return 'Done';
   }
}