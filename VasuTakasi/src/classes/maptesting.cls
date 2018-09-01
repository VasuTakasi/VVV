public class maptesting
{
  public   map<integer,string>mp=new map<integer,string>{1=>'va',2=>'su'};
    public void m1()
    {
      
        system.debug('@@@@@@@@@@@@@@@@@@@@@@@@@@'+mp);
      
    }
     
        // get() : to get the value from the specific key..
   public void m2()
   {
       string s= mp.get(2);
     system.debug('@@@@@@@@@@@@@###########$$$$$$$$$$$'+s);
   }     
   public void m3()
   {
       mp.put(3,'vasu');
       system.debug('<<<<<<<<<<<<<<<....>>>>>>>>>>>>>>'+mp);
   }
   // size() : Returns the size of the map (it returns an integer)
   public void m4()
   {
       integer cnt=mp.size();
       system.debug('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%'+cnt); 
   }
   // clone() : copies the map values into another map..
   public void m5()
   {
       map<integer,string>mp2=mp .clone();
       system.debug('WWWWWEEEEEEEE'+mp2);
   }
    // keyset() : Returns all the key values from the existing map.
    public void m6()
    {
    set<integer>keys=mp.keyset();
    system.debug('%%^%^%^%^%^%^%^%^*%*&%*&%*&'+keys);
    }
    public void m7()
    {
          
      string rm= mp.remove(2);
       // boolean result = mp.isEmpty();
        system.debug('***** Result is *****'+mp);
    }
}