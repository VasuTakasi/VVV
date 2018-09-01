public class change_listitem_position
{

    public PageReference movedown()
    {
        for(integer i=0;i<items.size()-1;i++)
        {
             
            if(selecteditem==items.get(i).getvalue())
            {
                
                selectoption s=items.get(i+1);
                items.set(i+1,new selectoption(selecteditem,selecteditem));
                items.set(i,s);
                break;
              
            }
        }
        return null;
    }


    public PageReference moveup()
    {
        for(integer i=1;i<items.size();i++)
        {
             
            if(selecteditem==items.get(i).getvalue())
            {
                
                selectoption s=items.get(i-1);
                items.set(i-1,new selectoption(selecteditem,selecteditem));
                items.set(i,s);
              break;
            }
        }
        return null;
    }


    public String selecteditem { get; set; }
   public list<selectoption>items{get;set;}
   public change_listitem_position()
   {
       items=new list<selectoption>();
       items.add(new selectoption('a','a-------'));
       items.add(new selectoption('b','b---------'));
       items.add(new selectoption('c','c-----------'));
       items.add(new selectoption('d','d------------'));
   }
}