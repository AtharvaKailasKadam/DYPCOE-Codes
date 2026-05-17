import java.util.Scanner;

public class HelpDeskExpertSystem
{
    public void HelpDeskSolution(String internet, String login, String slowSystem, String errorMsg)
    {
        System.out.println("\n--- Solution ---");

        if(internet.equals("yes") && slowSystem.equals("yes"))
        {
            System.out.println("Issue: Network Congestion");
            System.out.println("Solution: Restart router and limit background downloads");
        }
        else if(internet.equals("yes"))
        {
            System.out.println("Issue: Internet Problem");
            System.out.println("Solution: Check cables or contact ISP");
        }
        else if(login.equals("yes") && errorMsg.equals("yes"))
        {
            System.out.println("Issue: Account Locked");
            System.out.println("Solution: Reset password or contact admin");
        }
        else if(slowSystem.equals("yes"))
        {
            System.out.println("Issue: Low Performance System");
            System.out.println("Solution: Close background apps / increase RAM");
        }
        else
        {
            System.out.println("Issue Not Identified");
            System.out.println("Solution: Contact Technical Support");
        }
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Advanced Help Desk Expert System");

        System.out.print("Is internet not working? ");
        String internet = scanner.nextLine().toLowerCase();

        System.out.print("Are you facing login issues? ");
        String login = scanner.nextLine().toLowerCase();

        System.out.print("Is system slow? ");
        String slowSystem = scanner.nextLine().toLowerCase();

        System.out.print("Do you see error messages? ");
        String errorMsg = scanner.nextLine().toLowerCase();

        scanner.close();

        HelpDeskExpertSystem obj = new HelpDeskExpertSystem();
        obj.HelpDeskSolution(internet, login, slowSystem, errorMsg);
    }
}