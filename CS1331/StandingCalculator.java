//Azha Qari
//I worked on this assignment alone

import java.util.Scanner;

public class StandingCalculator {
    public static void main(String[] args) {
        int credits;
        Scanner myScanner = new Scanner(System.in);
        System.out.print("Credit hours taken: ");
        credits = myScanner.nextInt();

        if (credits < 0) {
            System.out.println("Invalid\n");
        } else if (credits <= 29) {
            System.out.println("Freshman\n");
        } else if (credits <= 59) {
            System.out.println("Sophomore\n");
        } else if (credits <= 89) {
            System.out.println("Junior\n");
        } else {
            System.out.println("Senior\n");
        }
    }
}
