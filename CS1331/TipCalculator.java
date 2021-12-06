//Azha Qari
//I worked on this assignment alone

import java.util.Scanner;

public class TipCalculator {
    public static void main(String[] args){
        Scanner scan = new Scanner(System.in);
        int itemNum = 1;
        double price = 0;
        double subTotal = 1;
        double tip = 0;

        System.out.println("Enter the prices of your items. Enter -1 to enter tip percentage.");


        while(price != -1) {
            System.out.print("Item " + itemNum + ":  $");
            price = scan.nextDouble();
            itemNum++;
            subTotal += price;
        }

        System.out.print("Enter the tip percentage:  ");
        tip = scan.nextDouble();
        double tipAmount = tip * subTotal;
        double total = tipAmount + subTotal;

        System.out.println("Subtotal:  $" + Math.round(subTotal * 100) / 100.0);
        System.out.println("Tip:  $" + Math.round(tipAmount * 100) / 100.0);
        System.out.println("Total:  $" + Math.round(total * 100) / 100.0);
    }
}
