public class con_save
{
    ApexPages.StandardController con;

    public con_save(ApexPages.StandardController controller) {
    con=controller;
    }
public void do_save()
{
con.save();
system.debug('@@@@@@@@@@@@@@@@@@@@@@@@'+con.getid());
}
}