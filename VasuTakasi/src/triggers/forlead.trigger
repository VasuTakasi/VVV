trigger forlead on Lead (before insert,before update)
{
    if(trigger.isinsert)
    {
        if(trigger.new[0].phone==null)
        {
            trigger.new[0].phone.adderror('phone no must enter*****');
        }
    }
    if(trigger.isupdate)
    {
        if(trigger.new[0].phone==null)
        {
        trigger.new[0].phone.adderror('invallid ph no');
        }
        else
        {
         trigger.new[0].mobilephone=trigger.new[0].phone;
        }
        
    }
}