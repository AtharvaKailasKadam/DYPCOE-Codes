/**
 * BankClient.java - Standalone Client
 * Tests EJB functionality
 */

import javax.naming.InitialContext;
import javax.naming.NamingException;

public class BankClient {
    
    public static void main(String[] args) {
        try {
            // Lookup EJB from JNDI
            InitialContext ctx = new InitialContext();
            
            // JNDI name format: java:global/EAR_NAME/MODULE_NAME/CLASS_NAME!INTERFACE_NAME
            BankService bankService = (BankService) ctx.lookup("java:global/BankApp/BankServiceBean!BankService");
            
            // Create account
            System.out.println("=== Bank Application ===");
            bankService.createAccount("ACC001", 5000);
            System.out.println("Account created with balance: 5000");
            
            // Check balance
            double balance = bankService.getBalance("ACC001");
            System.out.println("Current balance: " + balance);
            
            // Deposit
            balance = bankService.deposit("ACC001", 2000);
            System.out.println("After deposit of 2000: " + balance);
            
            // Withdraw
            balance = bankService.withdraw("ACC001", 1000);
            System.out.println("After withdrawal of 1000: " + balance);
            
            // Final balance
            balance = bankService.getBalance("ACC001");
            System.out.println("Final balance: " + balance);
            
        } catch (NamingException e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
