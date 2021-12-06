
import java.util.Scanner;
public class Loopy2 {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		        Scanner sc = new Scanner(System.in);
		        System.out.println("Please enter the desired number of rows : ");		        int n = sc.nextInt();
		        int num =1;
		        for (int i = 1; i <= n; i++) {
		            for (int j = 1; j <=n-i+1; j++) {
		                System.out.print(num+"  ");
		                num++;
		            }
		            System.out.println();
		        }
		    }
		}
