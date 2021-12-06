import java.util.Scanner;

public class Headah {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter a number");
        int n = sc.nextInt();
        while (n != 1) {
            if (n % 2 == 0) {
                n = n/2;
                System.out.println(n);
            } else {
                n = (3 * n) + 1;
                System.out.println(n);
            }
        }
        System.out.println(n);
    }

}
