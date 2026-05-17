import java.util.Scanner;

public class HospitalSystem
{

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("=================================");
        System.out.println("   HOSPITAL EXPERT SYSTEM (AI)   ");
        System.out.println("=================================\n");

        System.out.println("Answer the following questions with yes/no\n");

        System.out.print("Do you have fever? ");
        String fever = sc.nextLine().toLowerCase();

        System.out.print("Do you have cough? ");
        String cough = sc.nextLine().toLowerCase();

        System.out.print("Do you have headache? ");
        String headache = sc.nextLine().toLowerCase();

        System.out.print("Do you have stomach pain? ");
        String stomachPain = sc.nextLine().toLowerCase();

        System.out.print("Do you have chest pain? ");
        String chestPain = sc.nextLine().toLowerCase();

        System.out.print("Do you feel fatigue? ");
        String fatigue = sc.nextLine().toLowerCase();

        System.out.print("Do you have sore throat? ");
        String soreThroat = sc.nextLine().toLowerCase();

        System.out.println("\n--- Diagnosis Result ---");

        if (fever.equals("yes") && cough.equals("yes") && soreThroat.equals("yes")) {
            System.out.println("Possible Disease: Flu / Viral Infection");
            System.out.println("Department: General Physician / ENT");
        }
        else if (fever.equals("yes") && headache.equals("yes") && fatigue.equals("yes")) {
            System.out.println("Possible Disease: Viral Fever");
            System.out.println("Department: General Physician");
        }
        else if (stomachPain.equals("yes") && fever.equals("yes")) {
            System.out.println("Possible Disease: Food Poisoning");
            System.out.println("Department: Gastroenterology");
        }
        else if (stomachPain.equals("yes")) {
            System.out.println("Possible Disease: Acidity / Gastric Issue");
            System.out.println("Department: Gastroenterology");
        }
        else if (chestPain.equals("yes")) {
            System.out.println("Possible Disease: Heart-related Issue");
            System.out.println("Department: Cardiology (Immediate Check Required)");
        }
        else if (fatigue.equals("yes")) {
            System.out.println("Possible Condition: Weakness / Stress");
            System.out.println("Department: General Physician");
        }
        else if (headache.equals("yes")) {
            System.out.println("Possible Disease: Migraine / Stress Headache");
            System.out.println("Department: Neurology");
        }
        else {
            System.out.println("No major illness detected");
            System.out.println("Recommendation: Routine Check-up");
        }

        sc.close();
    }
}