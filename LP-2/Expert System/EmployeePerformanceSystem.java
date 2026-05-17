import java.util.Scanner;

public class EmployeePerformanceSystem
{
    public void EvaluatePerformance(int attendance, int projects, int rating, int lateDays)
    {
        System.out.println("\n--- Performance Result ---");

        if(attendance > 90 && projects > 6 && rating >= 4 && lateDays < 3)
        {
            System.out.println("Performance: Excellent");
            System.out.println("Promotion + Bonus Recommended");
        }
        else if(attendance > 80 && projects >= 4 && rating >= 3)
        {
            System.out.println("Performance: Good");
            System.out.println("Eligible for Increment");
        }
        else if(attendance > 65)
        {
            System.out.println("Performance: Average");
            System.out.println("Needs Training");
        }
        else if(lateDays > 10)
        {
            System.out.println("Performance: Poor");
            System.out.println("Disciplinary Action Required");
        }
        else
        {
            System.out.println("Performance: Very Poor");
            System.out.println("Warning Issued");
        }
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Advanced Employee Performance System");

        System.out.print("Enter Attendance (%): ");
        int attendance = scanner.nextInt();

        System.out.print("Enter Projects Completed: ");
        int projects = scanner.nextInt();

        System.out.print("Enter Rating (1-5): ");
        int rating = scanner.nextInt();

        System.out.print("Enter Late Days: ");
        int lateDays = scanner.nextInt();

        scanner.close();

        EmployeePerformanceSystem obj = new EmployeePerformanceSystem();
        obj.EvaluatePerformance(attendance, projects, rating, lateDays);
    }
}