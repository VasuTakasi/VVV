public class updt
 {
 public account acc;
 public updt()
 {
 id id1=apexpages.currentpage().getparameters().get('id');
 
 {
 acc=[select id,name,accountnumber from account where id=:id1];
 }

 }
 public account getaccount()
 {
 return acc;
 }
 public pagereference save()
 {
 upsert acc;
 return null;
 }
 
}