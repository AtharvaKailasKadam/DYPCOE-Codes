package ChatBot;

import java.util.Scanner;

public class ChatBot
{
    String userName = "";

    public void ChatBotReply(String input)
    {
        input = input.toLowerCase();

        if(input.contains("hello") || input.contains("hi"))
        {
            System.out.println("Bot: Hello " + userName + "! How can I help you?");
        }
        else if(input.contains("name"))
        {
            System.out.println("Bot: My name is AssistBot. I am here to help you.");
        }
        else if(input.contains("price") || input.contains("cost"))
        {
            System.out.println("Bot: Our product prices start from Rs. 999.");
        }
        else if(input.contains("order"))
        {
            System.out.println("Bot: Please enter your Order ID to check status.");
        }
        else if(input.contains("delivery"))
        {
            System.out.println("Bot: Delivery usually takes 3-5 business days.");
        }
        else if(input.contains("refund"))
        {
            System.out.println("Bot: Refund will be processed within 5-7 days.");
        }
        else if(input.contains("payment"))
        {
            System.out.println("Bot: We accept UPI, Credit Card, and Net Banking.");
        }
        else if(input.contains("cancel"))
        {
            System.out.println("Bot: Your order can be cancelled within 24 hours.");
        }
        else if(input.contains("complaint") || input.contains("problem"))
        {
            System.out.println("Bot: Sorry for the inconvenience. Please describe your issue.");
        }
        else if(input.contains("thanks"))
        {
            System.out.println("Bot: You're welcome " + userName + "!");
        }
        else if(input.contains("bye"))
        {
            System.out.println("Bot: Goodbye " + userName + "! Have a great day!");
        }
        else
        {
            System.out.println("Bot: Sorry, I didn't understand. Try using keywords like order, refund, payment.");
        }
    }

    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        System.out.println("=================================");
        System.out.println("   ADVANCED CUSTOMER CHATBOT     ");
        System.out.println("=================================");

        ChatBot bot = new ChatBot();

        System.out.print("Bot: Please enter your name: ");
        bot.userName = scanner.nextLine();

        System.out.println("Bot: Welcome " + bot.userName + "! You can ask me about orders, payments, delivery, etc.");
        System.out.println("Type 'exit' to end chat.\n");

        while(true)
        {
            System.out.print("You: ");
            String userInput = scanner.nextLine();

            if(userInput.equalsIgnoreCase("exit"))
            {
                System.out.println("Bot: Chat ended. Thank you " + bot.userName + "!");
                break;
            }

            bot.ChatBotReply(userInput);
        }

        scanner.close();
    }
}