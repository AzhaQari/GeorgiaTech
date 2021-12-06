import java.util.Random;
import java.util.Scanner;

public class CoinFlip {
    public static void main(String[] args) {
        Random gen = new Random();
        Scanner scan = new Scanner(System.in);
        int numSequences;
        double i;
        String output = "";
        String response = "";
        do {
            System.out.print("Ready to run a coin flip simulation. Enter the number of sequences:  ");
            numSequences = scan.nextInt();

            System.out.print("How many heads should each sequence have?: ");
            int numHeads = scan.nextInt();

            System.out.print("How many tails should each sequence have?: ");
            int numTails = scan.nextInt();

            int headCount = 0;
            int tailCount = 0;
            int totalCount = 0;
            int maxLength = 0;
            int sequenceCounter = 1;
            System.out.println("Simulating Sequences");
            for (int x = 0; x < numSequences; x++) {
                headCount = 0;
                tailCount = 0;
                output = "";

                while (headCount < numHeads || tailCount < numTails) {
                    i = gen.nextDouble();
                    if (i <= 0.5) {
                        output += "T";
                        tailCount++;
                        totalCount++;
                    } else {
                        output += "H";
                        headCount++;
                        totalCount++;
                    }
                }
                if (maxLength < output.length()) {
                    maxLength = output.length();
                } else {
                    maxLength = maxLength;
                }

                System.out.println(sequenceCounter + " - " + output);
                sequenceCounter++;
            }
            double avgFlips = (double) totalCount / numSequences;

            System.out.println("The average number of flips was " + avgFlips + " and maximum was " + maxLength);

            response = "";
            while (!"y".equals(response) && !"n".equals(response)) {
                System.out.print("Would you like to run another simulation? (y/n): ");
                response = scan.next();
            }
        } while ("y".equals(response));

    }
}
