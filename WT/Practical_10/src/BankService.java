/**
 * BankService.java - Remote Interface
 * Defines business methods for EJB
 */

import javax.ejb.Remote;

@Remote
public interface BankService {
    // Deposit money
    public double deposit(String accountId, double amount);
    
    // Withdraw money
    public double withdraw(String accountId, double amount);
    
    // Check balance
    public double getBalance(String accountId);
    
    // Create account
    public void createAccount(String accountId, double initialBalance);
}
