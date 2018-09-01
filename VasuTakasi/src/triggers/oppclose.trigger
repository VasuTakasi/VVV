trigger oppclose on Opportunity (before update)
{
  list<opportunity>opplst=[select id,(select opportunityid from opportunitylineitems )from opportunity where id in :trigger.old];
 system.debug('================================================='+trigger.old[0].opportunitylineitems.size());
}