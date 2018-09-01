trigger update_child_record on Account (after insert,after update)
{
try
{
if(trigger.new[0].name=='ram')
{
 contact c=[select id from contact  where accountid=:trigger.new[0].id];
 c.lastname='ram';
 update c;
 }
 }catch(exception e)
 {
 }
}