trigger convert_to_account on Lead (after insert)
{
if(trigger.isinsert)
{
    
    list<account>Acc_list=new list<account>();
    list<contact>con_list=new list<contact>();
    account a;
        contact c;
    for(lead l:trigger.new)
    {
    a=new account();
      a.name=l.company;
      
     a.phone=l.phone;
      
       acc_list.add(a);
       
                  
      }
      
      
      insert acc_list;
      
      
      for(integer i=0;i<trigger.new.size();i++)
      {
         c=new contact();
          c.lastname=trigger.new[i].lastname;
          c.phone=trigger.new[i].phone;
          c.accountid=Acc_list[i].id;
          con_list.add(c);
      }
      system.debug('############@@@@@@@@@@@@@@@'+con_list); 
      insert con_list ;
      
}
}