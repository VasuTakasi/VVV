public class ex 
{

    public String name { get; set; }

    public PageReference clear() {
        acc_list.clear();
        return null;
    }


    public void shows()
     {
            acc_list=new list<account>();
         acc_list=[select name from account where name like :name+'%' ];
      
       // return null;
    }


    public list<account>acc_list { get; set; }

    public void show()
     {
       // return null;
    }

}