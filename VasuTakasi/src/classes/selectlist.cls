public class selectlist {

    public list<integer> leftindex { get; set; }

    public list<String> rightselected { get; set; }

    public list<String> leftselected { get; set; }

    public PageReference remove()
    {
       
        return null;
    }


    public PageReference add()
    {
        
         for(string s:leftselected)
        {
            
         selectlist2.add(new selectoption(s,s));
         leftoptions.remove(s);
        }
        selectlist1.clear();
        for(string s:leftoptions)
        {
        selectlist1.add(new selectoption(s,s));
        }
        return null;
    }


    public list<selectoption> selectlist1 { get; set; }
    public list<selectoption> selectlist2 { get; set; }
    set<string>leftoptions;
    set<string>rightoptions;
    public list<string>options=new list<string>{'a','b','c','d','e','f','g','h'};
    public selectlist()
    {
        leftoptions=new set<string>();
        rightoptions=new set<string>();
        selectlist1=new list<selectoption>();
        selectlist2=new list<selectoption>();
        leftoptions.addall(options);
        for(string s:leftoptions)
        {
        selectlist1.add(new selectoption(s,s));
        }
        selectlist1.sort();
    }
}