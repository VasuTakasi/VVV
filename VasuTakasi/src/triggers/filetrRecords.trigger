trigger filetrRecords on Account (before insert) {
    string cach = 'noval';
    if(Cache.Session.contains('local.myPartition.orderDate'))
        cach = string.valueOf(Cache.Session.get('local.myPartition.orderDate'));
    string error = '<label style="font-size:15px;color:blue;">A sample error</h1><script>alert("errorrrrrr");</script>'+cach;
	for( integer i=0; i<trigger.new.size(); i++ )
    {
        Cache.Session.put('local.myPartition.orderDate', 'yahoooooo');
        trigger.new[0].AccountNumber = '2233';
        trigger.new[0].addError(error,false);
    }
}