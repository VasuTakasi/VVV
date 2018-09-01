public with sharing class wrapper_page_no 
{

    integer lcount=0;
    integer gcount=0;
    public boolean show_next{get;set;}
    list<wrapper>list_wrap{get;set;}
    public list<wrapper>list_page_records{get;set;}
    list<account>list_acc;
    public wrapper_page_no()
    {
        show_next=true;
        list_page_records=new list<wrapper>();
        list_wrap=new list<wrapper>();
        list_acc=[select id,name from account order by name];
        for(integer i=0;i<list_acc.size();i++)
        {
            wrapper w=new wrapper();
            w.sno=i+1;
            w.acc=list_acc[i];
            list_wrap.add(w);
        }
       for(integer i=0;i<10;i++)
        {
         if(i<list_wrap.size())
         {
        list_page_records.add(list_wrap[i]);
        lcount=i;
        }
        else
        {
            show_next=false;
          break;
        }
        }
        gcount=lcount;
        
    }
    public PageReference Next()
     {
     list_page_records=new list<wrapper>();
     for(integer i=gcount+1;i<=gcount+10;i++)
     {
         if(i<list_wrap.size())
         {
         list_page_records.add(list_wrap[i]);
         lcount=i;
         }
        else
        {
            show_next=false;
          break;
        }
      }
          gcount=lcount;
        return null;
    }


    public PageReference previous()
    {
        list_page_records=new list<wrapper>();
        gcount=gcount-10;
        for(integer i=gcount+1;i<=gcount+10;i++)
        {
            list_page_records.add(list_wrap[i]);
         lcount=i;
        }
        gcount=lcount;
        return null;
    }

 
    public PageReference last() {
        return null;
    }


    public PageReference first() {
        return null;
    }


    public class wrapper
    {
        public integer sno{get;set;}
        public account acc{get;set;}
    }
}