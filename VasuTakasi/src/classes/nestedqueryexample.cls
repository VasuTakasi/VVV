public class nestedqueryexample
{
  public List<Account> getaccsandtmember()
  {
      List<Account> accounts = [Select Id,(Select name,phone From Account.contacts), Name, BillingCountry from Account ];
      return accounts;
  }
}