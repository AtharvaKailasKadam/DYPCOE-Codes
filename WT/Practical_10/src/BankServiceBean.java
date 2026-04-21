/**
 * BankServiceBean.java - Session Bean Implementation
 * Implements bank business logic
 */

import javax.ejb.Stateful;
import java.util.HashMap;
import java.util.Map;

@Stateful
public class BankServiceBean implements BankService {
    
    // Store account balances in memory
    private Map<String, Double> accounts = new HashMap<String, Double>();
    
    @Override
    public void createAccount(String accountId, double initialBalance) {
        if (initialBalance < 0) {
            throw new IllegalArgumentException("Initial balance cannot be negative");
        }
        accounts.put(accountId, initialBalance);
    }
    
    @Override
    public double getBalance(String accountId) {
        if (!accounts.containsKey(accountId)) {
            throw new IllegalArgumentException("Account not found");
        }
        return accounts.get(accountId);
    }
    
    @Override
    public double deposit(String accountId, double amount) {
        if (!accounts.containsKey(accountId)) {
            throw new IllegalArgumentException("Account not found");
        }
        
        if (amount <= 0) {
            throw new IllegalArgumentException("Deposit amount must be positive");
        }
        
        double currentBalance = accounts.get(accountId);
        double newBalance = currentBalance + amount;
        accounts.put(accountId, newBalance);
        
        System.out.println("Deposited: " + amount + " to account: " + accountId);
        return newBalance;
    }
    
    @Override
    public double withdraw(String accountId, double amount) {
        if (!accounts.containsKey(accountId)) {
            throw new IllegalArgumentException("Account not found");
        }
        
        if (amount <= 0) {
            throw new IllegalArgumentException("Withdrawal amount must be positive");
        }
        
        double currentBalance = accounts.get(accountId);
        
        if (currentBalance < amount) {
            throw new IllegalArgumentException("Insufficient balance");
        }
        
        double newBalance = currentBalance - amount;
        accounts.put(accountId, newBalance);
        
        System.out.println("Withdrawn: " + amount + " from account: " + accountId);
        return newBalance;
    }
}
