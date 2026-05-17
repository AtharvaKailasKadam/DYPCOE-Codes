import java.util.Scanner;

public class AirlineSchedulingSystem
{
    public void ScheduleFlight(String weather, String traffic, String technical)
    {
        System.out.println("\n--- Flight Status ---");

        if(weather.equals("bad") && traffic.equals("high"))
        {
            System.out.println("Flight Delayed: Weather + Traffic Issues");
        }
        else if(weather.equals("bad"))
        {
            System.out.println("Flight Delayed due to Weather");
        }
        else if(traffic.equals("high"))
        {
            System.out.println("Flight Delayed due to Air Traffic");
        }
        else if(technical.equals("yes"))
        {
            System.out.println("Flight Cancelled due to Technical Issue");
        }
        else
        {
            System.out.println("Flight On Time");
        }
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Advanced Airline Scheduling System");

        System.out.print("Enter Weather (good/bad): ");
        String weather = scanner.nextLine().toLowerCase();

        System.out.print("Enter Traffic (low/high): ");
        String traffic = scanner.nextLine().toLowerCase();

        System.out.print("Any Technical Issue? (yes/no): ");
        String technical = scanner.nextLine().toLowerCase();

        scanner.close();

        AirlineSchedulingSystem obj = new AirlineSchedulingSystem();
        obj.ScheduleFlight(weather, traffic, technical);
    }
}