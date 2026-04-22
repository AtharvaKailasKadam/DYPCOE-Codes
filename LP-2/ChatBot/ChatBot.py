def chatbot():
    print("Chatbot: Hello! Welcome to our service. How can I help you today?")
    print("(Type 'exit' to end the conversation)\n")

    while True:
        user_input = input("You: ").lower()

        if user_input == "exit":
            print("Chatbot: Thank you for visiting. Have a great day!")
            break

        elif any(word in user_input for word in ["hello", "hi", "hey"]):
            print("Chatbot: Hello! How can I assist you today?")

        elif "order" in user_input and "status" in user_input:
            print("Chatbot: Please provide your order ID to check the status.")

        elif "delivery" in user_input:
            print("Chatbot: Delivery usually takes 3-5 business days.")

        elif "payment" in user_input:
            print("Chatbot: We accept credit cards, debit cards, and UPI.")

        elif "refund" in user_input:
            print("Chatbot: Refunds are processed within 5-7 business days.")

        elif "contact" in user_input or "support" in user_input:
            print("Chatbot: You can contact support at support@example.com.")

        else:
            print("Chatbot: Sorry, I didn't understand that. Can you rephrase?")

chatbot()