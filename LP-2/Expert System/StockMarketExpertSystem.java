import java.util.Scanner;

public class StockMarketExpertSystem
{
    public void TradingDecision(String trend, String news, String risk)
    {
        System.out.println("\n--- Trading Decision ---");

        if(trend.equals("up") && news.equals("positive") && risk.equals("low"))
        {
            System.out.println("Action: STRONG BUY");
        }
        else if(trend.equals("up") && risk.equals("high"))
        {
            System.out.println("Action: BUY with Caution");
        }
        else if(trend.equals("down") && news.equals("negative"))
        {
            System.out.println("Action: SELL Immediately");
        }
        else if(trend.equals("stable"))
        {
            System.out.println("Action: HOLD");
        }
        else
        {
            System.out.println("Action: WAIT and WATCH");
        }
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Advanced Stock Market Expert System");

        System.out.print("Enter Market Trend (up/down/stable): ");
        String trend = scanner.nextLine().toLowerCase();

        System.out.print("Enter News (positive/negative): ");
        String news = scanner.nextLine().toLowerCase();

        System.out.print("Enter Risk Level (low/high): ");
        String risk = scanner.nextLine().toLowerCase();

        scanner.close();

        StockMarketExpertSystem obj = new StockMarketExpertSystem();
        obj.TradingDecision(trend, news, risk);
    }
}