//Azha Qari
//I worked on this assignment alone :)
import java.util.Scanner;

public class HawaiianName {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String alphabet = "aeiouklhmnAEIOUKLHMN";
        String answer = "";

        do {
            System.out.print("Enter your first name:  ");
            String firstName = scan.next();
            String hawaiiName = "";
            for (int i = 0; i < firstName.length(); i++) {
                if (alphabet.indexOf(firstName.charAt(i)) != -1) {
                    hawaiiName += firstName.charAt(i);
                }
            }
            for (int i = 0; i < firstName.length(); i++) {
                if (alphabet.indexOf(firstName.charAt(i)) == -1) {
                    System.out.println("Sorry " + firstName + ", you aren't Hawaiian enough to come!");
                    System.out.println("Let's make your name... " + hawaiiName + "!");
                    break;
                }
            }
            System.out.println("Aloha, " + hawaiiName);
            System.out.print("Would you to try again? (y/n): ");
            answer = scan.next();
        }
        while (answer.equals("y") || answer.equals("Y"));
    }
}
