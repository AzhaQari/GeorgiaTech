//Azha Qari
//I worked on this assignment alone

import java.util.Scanner;

public class DayOfWeek {
    public static void main(String[] args) {
        int dayNumber;
        Scanner myScanner = new Scanner(System.in);
        System.out.print("Days into the week: ");
        dayNumber = myScanner.nextInt();

        switch (dayNumber) {
            case 1:
                System.out.println("The day is Sunday\n");
                break;
            case 2:
                System.out.println("The day is Monday\n");
                break;
            case 3:
                System.out.println("The day is Tuesday\n");
                break;
            case 4:
                System.out.println("The day is Wednesday\n");
                break;
            case 5:
                System.out.println("The day is Thursday\n");
                break;
            case 6:
                System.out.println("The day is Friday\n");
                break;
            case 7:
                System.out.println("The day is Saturday\n");
                break;
            default:
                System.out.println("The day is Invalid\n");
        }
    }
}
