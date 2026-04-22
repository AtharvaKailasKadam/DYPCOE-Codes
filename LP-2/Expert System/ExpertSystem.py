def helpdesk_expert_system():
    print("=== Help Desk Expert System ===")
    print("Answer with 'yes' or 'no'\n")

    internet_issue = input("Are you facing internet connectivity issues? ").lower() == "yes"
    slow_computer = input("Is your computer running slow? ").lower() == "yes"
    login_problem = input("Are you unable to login? ").lower() == "yes"
    printer_issue = input("Is the printer not working? ").lower() == "yes"

    print("\n--- Solution सुझाव ---")

    found = False

    if internet_issue:
        print("Issue: Internet Connectivity Problem")
        print("Solution: Restart router or check network cables.\n")
        found = True

    if slow_computer:
        print("Issue: Slow Computer Performance")
        print("Solution: Close background apps or restart system.\n")
        found = True

    if login_problem:
        print("Issue: Login Problem")
        print("Solution: Check username/password or reset credentials.\n")
        found = True

    if printer_issue:
        print("Issue: Printer Problem")
        print("Solution: Check printer connection and install drivers.\n")
        found = True

    if not found:
        print("Issue not identified.")
        print("Solution: Please contact IT support for further assistance.")

    print("\nThank you for using Help Desk Expert System.")

helpdesk_expert_system()