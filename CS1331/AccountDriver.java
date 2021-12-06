//********************************************************************
//  AccountDriver.java    
//
//  Demonstrates the creation and use of multiple Account objects.
//********************************************************************

public class AccountDriver
{
   //-----------------------------------------------------------------
   //  Creates some bank accounts and requests various services.
   //-----------------------------------------------------------------
   public static void main (String[] args)
   {
      Account acct1 = new Account ("Ted Murphy", 72354, 102.56);
      Account acct2 = new Account ("Jane Smith", 69713, 40.00);
      Account acct3 = new Account ("Edward Demsey", 93757, 759.32);
      Account acct4 = new Account ("Edward Demsey", 93757, 759.32);

      System.out.println(acct3 == acct4); // the exact same object
                                          // comparing the memory locations
      System.out.println(acct3.equals(acct4));

      System.out.println(acct3.getName().equals(acct4.getName()));

      //System.out.println(acct1.getBalance());
      //System.out.println(acct1.getName());

      //acct2.deposit(100.0);
      //acct2.withdraw(10.0, 1.75);

      System.out.println (acct1);
      System.out.println (acct2);
      System.out.println (acct3);
      System.out.println (acct4);

      System.out.println(Account.getNumAccounts());  // static method being called




   }
}