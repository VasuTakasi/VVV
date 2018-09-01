public with sharing class mystndcntrl
 {
 public final account acct;
 public mystndcntrl(ApexPages.standardController std)
 {
 this.acct=(account)std.getRecord();
 }
 public string getgreetings()
 {
 return 'hellow...'+acct.name+'..'+acct.id;
 }
 }