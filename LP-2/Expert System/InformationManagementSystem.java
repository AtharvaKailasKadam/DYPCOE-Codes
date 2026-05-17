import java.util.Scanner;

public class InformationManagementSystem
{
    public void ManageInfo(String dataType, String priority)
    {
        System.out.println("\n--- Information Handling ---");

        if(dataType.equals("student") && priority.equals("high"))
        {
            System.out.println("Store in Secure Student Database with Backup");
        }
        else if(dataType.equals("employee"))
        {
            System.out.println("Store in HR Management System");
        }
        else if(dataType.equals("finance") && priority.equals("high"))
        {
            System.out.println("Store in Encrypted Financial System");
        }
        else if(priority.equals("low"))
        {
            System.out.println("Store in Archive Database");
        }
        else
        {
            System.out.println("Store in General Database");
        }
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Advanced Information Management System");

        System.out.print("Enter Data Type (student/employee/finance): ");
        String dataType = scanner.nextLine().toLowerCase();

        System.out.print("Enter Priority (high/low): ");
        String priority = scanner.nextLine().toLowerCase();

        scanner.close();

        InformationManagementSystem obj = new InformationManagementSystem();
        obj.ManageInfo(dataType, priority);
    }
}