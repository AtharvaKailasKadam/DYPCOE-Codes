import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;

/**
 * LoginAction.java - Struts Action Class
 * Handles login validation and processing
 */
public class LoginAction extends ActionSupport implements ModelDriven<LoginForm>, SessionAware {
    
    private LoginForm loginForm = new LoginForm();
    private Map<String, Object> session;
    
    @Override
    public LoginForm getModel() {
        return loginForm;
    }
    
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    
    // Main login execution
    public String execute() {
        // Store data in session
        session.put("userName", loginForm.getName());
        session.put("userEmail", loginForm.getEmailId());
        session.put("userMobile", loginForm.getMobileNumber());
        
        addActionMessage("Welcome " + loginForm.getName() + "!");
        return SUCCESS;
    }
    
    // Logout
    public String logout() {
        session.clear();
        addActionMessage("Logged out successfully!");
        return SUCCESS;
    }
    
    // Home - Show form
    public String home() {
        return SUCCESS;
    }
    
    // Validation Method
    @Override
    public void validate() {
        clearErrors();
        
        // Validate Name - Only alphabets and spaces
        if (loginForm.getName() == null || loginForm.getName().trim().isEmpty()) {
            addFieldError("name", "Name is required");
        } else if (!loginForm.getName().matches("^[a-zA-Z\\s]+$")) {
            addFieldError("name", "Name must contain only alphabets");
        }
        
        // Validate Mobile - Exactly 10 digits
        if (loginForm.getMobileNumber() == null || loginForm.getMobileNumber().trim().isEmpty()) {
            addFieldError("mobileNumber", "Mobile number is required");
        } else if (!loginForm.getMobileNumber().matches("^[0-9]{10}$")) {
            addFieldError("mobileNumber", "Mobile must be exactly 10 digits");
        }
        
        // Validate Email - Valid format
        if (loginForm.getEmailId() == null || loginForm.getEmailId().trim().isEmpty()) {
            addFieldError("emailId", "Email is required");
        } else if (!loginForm.getEmailId().matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            addFieldError("emailId", "Email format is invalid");
        }
    }
}
