//Azha Qari
//I worked on the homework assignment alone, using only course materials.
import java.util.Scanner;

public class CoinChanger {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        System.out.println("How many pennies do you have:  ");
        String pennies = scan.nextLine();
        int numPennies = Integer.parseInt(pennies);

        System.out.println("How many nickels do you have:  ");
        String nickels = scan.nextLine();
        int numNickels = Integer.parseInt(nickels);

        System.out.println("How many dimes do you have:  ");
        String dimes = scan.nextLine();
        int numDimes = Integer.parseInt(dimes);

        System.out.println("How many quarters do you have:  ");
        String quarters = scan.nextLine();
        int numQuarters = Integer.parseInt(quarters);

        int totalCents = (numQuarters * 25) + (numDimes * 10) + (numNickels * 5) + numPennies;
        int numDollars = totalCents / 100;
        int numCents = totalCents % 100;

        System.out.println("Your total is " + numDollars + " dollars and " + numCents + " cents.");
    }
}
