
import java.util.Scanner;

public class Loopy3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		        Scanner sc = new Scanner(System.in);
		        System.out.println("Please enter the desired number of rows : ");
		        int n = sc.nextInt();
		        for(int i=1;i<=n;i++){
		            for(int j=n-i;j>0;j--){
		                System.out.print(" ");
		            }
		            for(int k=(2*i-1);k>0;k--){
		                System.out.print(k);
		            }
		            System.out.println();
		        }
		    }
		}
		*/
		for (int count1 = 1; count1 <= 5; count1++) {
			for (int count2 = 1; count2<=5; count2++) {
				System.out.print("#");
				System.out.println();
			}
		}
	}
}
